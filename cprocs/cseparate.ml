(*
  Separate analysis

  @author Stephan Falke

  Copyright 2010-2014 Stephan Falke

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
*)

module RVG = Rvgraph.Make(Rule)
module LSC = LocalSizeComplexity.Make(Rule)
module GSC = GlobalSizeComplexity.Make(Rule)
module TGraph = Tgraph.Make(Rule)
module CTRSObl = Ctrsobl.Make(Rule)
module CTRS = CTRSObl.CTRS
open CTRSObl
open CTRS

let sep_var_suffix = "_sep"

(* separate analysis *)
let rec process innerprover innerFuns addSizeSummaries sepId sepOblIdMultiplier ctrsobl tgraph rvgraph =
  if CTRSObl.isSolved ctrsobl || innerFuns = [] then
    None
  else
  (
    let vars = CTRS.getVars ctrsobl.ctrs in
    let allFuns = Trs.getFuns ctrsobl.ctrs.rules in

    (* The case where everything would be separated out. This _will_ crash, so we don't do it. *)
    if (List.length allFuns) = (List.length innerFuns) then
      None
    else
      (
        Log.log (Printf.sprintf "Separating into subproblems, inner problem using locations [%s]." (String.concat ", " innerFuns));
        let freshOblId = (sepId * sepOblIdMultiplier) in
        let (outerRules, entryRules, innerRules, exitRules) = splitRules ctrsobl innerFuns in
        Log.debug (Printf.sprintf "Inner rules that are separated out:\n%s" (Rule.listToStringPrefix "  " innerRules));
        let (innerObl, innerTGraph, innerRVGraph) = getInnerObligation ctrsobl entryRules innerRules freshOblId tgraph rvgraph in
        let subproof = innerprover innerObl innerTGraph innerRVGraph in
        match subproof with
        | Some (Complexity.P innerComplexity, innerSizes, innerProof) ->
        (* Now that we could solve the subproblem, build the reduced outer problem *)
          Log.log (Printf.sprintf "Inner problem for [%s] solved successfully, returning to outer problem." (String.concat ", " innerFuns));
          let (reducedOuterObl, reducedTGraph, reducedRVGraph) =
            getOuterObligation ctrsobl tgraph rvgraph vars innerFuns outerRules entryRules innerRules exitRules freshOblId innerSizes innerComplexity addSizeSummaries in
          Log.log (Printf.sprintf "Constructed outer problem");
          Some ((reducedOuterObl, reducedTGraph, reducedRVGraph), getProof innerObl freshOblId innerProof reducedOuterObl)
        | _ -> None
      )
  )

and splitRules ctrsobl innerFuns =
  List.fold_left
    (fun (outR, entryR, inR, exitR) rule ->
      let lhsIsInner = Utils.contains innerFuns (Term.getFun (Rule.getLeft rule)) in
      let rhsIsInner = Utils.contains innerFuns (Term.getFun (Rule.getRight rule)) in
      match (lhsIsInner, rhsIsInner) with
      | (true, true) ->
        (outR, entryR, rule::inR, exitR)
      | (true, false) ->
        (outR, entryR, inR, rule::exitR)
      | (false, true) ->
        (outR, rule::entryR, inR, exitR)
      | (false, false) ->
        (rule::outR, entryR, inR, exitR))
    ([], [], [], [])
    ctrsobl.ctrs.rules

and getInnerObligation ctrsobl entryRules innerRules freshOblId tgraph rvgraph =
  let innerStartFun = "inner_" ^ (string_of_int freshOblId) ^ "_start_sep" in
  let innerStartRules =
    List.map
      (fun entryRule -> Rule.create (innerStartFun, snd (Rule.getLeft entryRule)) (Rule.getRight entryRule) [])
      entryRules in
  let innerTGraph = TGraph.addNodes (TGraph.keepNodes tgraph innerRules) innerStartRules in
  let innerRVGraph =
    match rvgraph with
    | None -> None
    | Some rvg ->
      let innerStartRulesWithLSCs = LSC.computeLocalSizeComplexities innerStartRules in
      Some (RVG.addNodes (RVG.keepNodes rvg innerRules) innerStartRulesWithLSCs innerTGraph) in
  let (innerCost, innerComplexity) =
    List.fold_left
      (fun (innerCost, innerComplexity) rule ->
        (RuleMap.add rule (RuleMap.find rule ctrsobl.cost) innerCost,
         RuleMap.add rule (RuleMap.find rule ctrsobl.complexity) innerComplexity))
      (List.fold_left
         (fun (innerCost, innerComplexity) rule ->
           (RuleMap.add rule Expexp.zero innerCost, RuleMap.add rule (Complexity.P Expexp.one) innerComplexity))
         (RuleMap.empty, RuleMap.empty)
         innerStartRules)
      innerRules in
  let innerObl =
    { ctrs = { rules = innerStartRules @ innerRules ; startFun = innerStartFun }
    ; cost = innerCost
    ; complexity = innerComplexity
    ; leafCost = Expexp.zero} in
  (innerObl, innerTGraph, innerRVGraph)

and getOuterObligation ctrsobl tgraph rvgraph vars innerFuns outerRules entryRules innerRules exitRules innerId innerGSC innerCost addSizeSummaries =
  let getMaybeHavocedVarPols innerRules vars =
    let varIsUnchanged rules allVars var =
      let varIsUnchangedInRule idx rule =
        Poly.equal (List.nth (Term.getArgs (Rule.getLeft rule)) idx) (List.nth (Term.getArgs (Rule.getRight rule)) idx) in
      let varIdx = Utils.getIdx allVars var in
      List.for_all (varIsUnchangedInRule varIdx) rules in
    let getNewVarName havocedVars var =
      if Utils.contains havocedVars var then (var ^ sep_var_suffix) else var in
    let havocedVars = List.filter (fun v -> not(varIsUnchanged innerRules vars v)) vars in
    (List.map (getNewVarName havocedVars) havocedVars, List.map (fun v -> Poly.fromVar (getNewVarName havocedVars v)) vars) in

  let varPols = List.map Poly.fromVar vars in
  let (havocedVars, maybeHavocedVarPols) = getMaybeHavocedVarPols innerRules vars in
  let inLoopFun = "inner_" ^ (string_of_int innerId) ^ "_in_sep" in
  let tmpFun = "inner_" ^ (string_of_int innerId) ^ "_compl_sep" in
  let outLoopFun = "inner_" ^ (string_of_int innerId) ^ "_out_sep" in

  (* Difference from paper:
   * Instead of t' = (_in., _, _out.) with cost (cost of separated), we
   * create two types of transitions here:
   * - costRule, which has the cost of the separated SCC
   * - summaryRules, which summarize the changes to values (several, to make the case analysis for abs(...) explicit)
   *)
  let costRule = Rule.create (inLoopFun, varPols) (tmpFun, varPols) [] in
  let summaryRules =
    if (not addSizeSummaries) || (exitRules = []) then
      [Rule.create (tmpFun, varPols) (outLoopFun, maybeHavocedVarPols) []]
    else
      List.map
        (fun summaryCond -> Rule.create (tmpFun, varPols) (outLoopFun, maybeHavocedVarPols) summaryCond)
        (getSummaryConditions innerGSC exitRules vars havocedVars) in
  let tskip = Rule.create (inLoopFun, varPols) (outLoopFun, varPols) [] in

  (* Fix up the rules we already have *)
  let allRemovedRules = entryRules @ exitRules @ innerRules in
  let (newCost, newComplexity, newEntryExitRules) =
    (* Redirect exit rules *)
    List.fold_left
      (fun (newCost, newComplexity, newRules) r ->
        let newRule = Rule.create (outLoopFun, Term.getArgs (Rule.getLeft r)) (Rule.getRight r) (Rule.getCond r) in
        (RuleMap.add newRule (RuleMap.find r ctrsobl.cost) newCost,
         RuleMap.add newRule (RuleMap.find r ctrsobl.complexity) newComplexity,
         newRule::newRules))
      (* Redirect entry rules *)
      (List.fold_left
         (fun (newCost, newComplexity, newRules) r ->
           let newRule = Rule.create (Rule.getLeft r) (inLoopFun, Term.getArgs (Rule.getRight r)) (Rule.getCond r) in
           (RuleMap.add newRule (RuleMap.find r ctrsobl.cost) newCost,
            RuleMap.add newRule (RuleMap.find r ctrsobl.complexity) newComplexity,
            newRule::newRules))
         (* Remove everything inner / what we are going to change *)
         (CTRS.removeRulesFromMap ctrsobl.cost allRemovedRules, CTRS.removeRulesFromMap ctrsobl.complexity allRemovedRules, [])
         entryRules)
      exitRules in

  (* Now prepare the new obligation. *)
  let addedRules = tskip :: (costRule :: (summaryRules @ newEntryExitRules)) in
  let newRules = addedRules @ outerRules in
  let newCost =
    List.fold_left
      (fun newCost summaryRule -> RuleMap.add summaryRule Expexp.zero newCost)
      (RuleMap.add costRule innerCost (RuleMap.add tskip Expexp.zero newCost))
      summaryRules in
  let newComplexity =
    List.fold_left
      (fun newComplexity summaryRule -> RuleMap.add summaryRule Complexity.Unknown newComplexity)
      (RuleMap.add costRule Complexity.Unknown (RuleMap.add tskip Complexity.Unknown newComplexity))
      summaryRules in
  let newTGraph = TGraph.addNodes (TGraph.removeNodes tgraph allRemovedRules) addedRules in
  let newRVGraph = RVG.updateOptionRVGraph rvgraph allRemovedRules addedRules newTGraph in
  let outerObl =
    { ctrs = { rules = newRules ; startFun = ctrsobl.ctrs.startFun }
    ; cost = newCost
    ; complexity = newComplexity
    ; leafCost = ctrsobl.leafCost } in
  (outerObl, newTGraph, newRVGraph)

and getSummaryConditions innerGSC exitRules allVars havocedVars =
  (* List of maps from variable to its maximal size after using an exit rule. As that
     set may have changed (chaining, leaf removal, ...), we extract an updated
     version of the inner rules. Then max over that: *)
  let exitFuns = List.map (fun r -> Term.getFun (Rule.getLeft r)) exitRules in
  let exitRules = GSC.RVMap.fold (fun (rule, _) _ res -> if Utils.contains exitFuns (Term.getFun (Rule.getRight rule)) then rule::res else res) innerGSC [] in
  let maxExitSizeMaps = List.map (fun exitR -> GSC.extractSizeMapForRuleForVars innerGSC exitR 0 allVars) exitRules in
  let overallMaxSizeMap =
    let maxMapPair map map' =
      let maxOneVarPair (x, c) (y, c') =
        if x <> y then
          failwith "internal error in Cseparate.maxOneVarPair"
        else
          (x, Complexity.sup [c;c']) in
      List.map2 maxOneVarPair map map' in
    List.fold_left maxMapPair (List.hd maxExitSizeMaps) (List.tl maxExitSizeMaps) in
  (* Restrict to havoced vars. Then, as these are in absolute values, so now we have to unfold the abs(...) everywhere... *)
  let havocedVarMaxSizeMap =
    let getSizeBoundForUnhavoced havocedVar =
      let origVar = String.sub havocedVar 0 ((String.length havocedVar) - (String.length sep_var_suffix)) in
      List.assoc origVar overallMaxSizeMap in
    List.map (fun v -> (v, getSizeBoundForUnhavoced v)) havocedVars in

  let rec case_split cs vars =
    let split_one cs x =
      let apply_split c subs c' = c::(Pc.instantiate c' subs) in
      let x_pol = Poly.fromVar x in
      let subst = [(x, Poly.negate x_pol)] in
      let geq = Pc.Geq (x_pol, Poly.zero) in
      let lt = Pc.Lss (x_pol, Poly.zero) in
      (List.map (apply_split geq []) cs) @ (List.map (apply_split lt subst) cs) in
    match vars with
    | [] -> cs
    | x::rest -> case_split (split_one cs x) rest in
  let polyConstraint =
    Utils.concatMap
      (fun (var, bound) -> match Complexity.getPoly bound with | None -> [] | Some polyBound -> [Pc.Leq (Poly.fromVar var, polyBound)])
      havocedVarMaxSizeMap in
  let polyVars = Pc.getVars polyConstraint in
  case_split [polyConstraint] polyVars

and getProof innerctrsobl innerId innerProof outerctrsobl ini outi=
  "Separating problem " ^ (string_of_int ini) ^ " produces the isolated subproblem\n" ^
  (CTRSObl.toStringNumber innerctrsobl (1 + innerId)) ^ "\n\n" ^
  "=== begin of proof for isolated subproblem " ^ (string_of_int (1 + innerId)) ^ " ===\n" ^
  indent_lines (innerProof ()) ^
  "\n=== end of proof for isolated subproblem " ^ (string_of_int (1 + innerId)) ^ " ===\n\n" ^
  "Applying the information from the isolated subproblem " ^ (string_of_int (1 + innerId)) ^
  " to problem " ^ (string_of_int ini) ^ " produces the following problem:\n" ^
  (CTRSObl.toStringNumber outerctrsobl outi)
and indent_lines text =
  let lines = Str.split (Str.regexp "\n") text in
    String.concat "\n" (List.map (fun line -> "\t" ^ line) lines)

let selectSCC ctrsobl sccRules =
  (*
   * Heuristic:
   * guardVars(  l -> r [g] ) = Vars(g)
   * updateVars( l -> r [g] ) = Vars(r) \ { v' \in Vars(r) | v = v' \in g }
   * Natural lift to rule sets
   * Take Sub-SCC S' of S if guardVars(S) \cap updateVars(S') = \emptyset
   *)
  let selectSubSCC ctrsobl sccFuns (sccTrans : Rule.rule list) =
    let sccFunsNumber = List.length sccFuns in
    let checkFunSubsetCand funSubset =
      Log.debug (Printf.sprintf "Considering location subset [%s]" (String.concat ", " funSubset));
      let transSubset = List.filter (fun rule -> Utils.contains funSubset (Rule.getLeftFun rule) && Utils.contains funSubset (Rule.getRightFun rule)) sccTrans in
      let (funsWithIn', funsWithOut') = List.fold_left (fun (ins, outs) rule -> ((Rule.getLeftFun rule)::ins, (Rule.getRightFun rule)::outs)) ([], []) transSubset in
      let funsWithIn = Utils.remdup funsWithIn' in
      let funsWithOut = Utils.remdup funsWithOut' in
      let funNumber = List.length funSubset in

      if (funNumber > 0) && (funNumber < sccFunsNumber) && (List.length funsWithIn = funNumber) && (List.length funsWithOut = funNumber) then (* is non-trivial proper sub-SCC *)
        (
          Log.debug " ... which is a non-trivial proper sub-SCC";
          (* We want to avoid the case where we have locations in the scc which
             are only reachable from the chosen subset, and only lead back to the
             chosen subset. As example, consider this (simplified) problem appearing
             in cexamples/ex16.koat:
             s         -> bb4
             bb4       -> i_1_in
             i_1_in    -> i_1_compl
             i_1_in    -> i_1_out
             i_1_compl -> i_1_out
             i_1_out   -> bb4
             Here, i_1_compl
             Without this check, we split out [b_4, i_1_in, i_1_out] here (with
             surrounded i_1_compl), which leads to an endless sequence of splits.
             TODO: Actually, this check should be extended to sequences of
             transitions, but I haven't seen a problem like this yet.
          *)
          let hasSurroundedFun ctrsobl subSCCFuns =
            let hasExternalTrans ctrsobl subSCCFuns funSym =
              List.exists
                (fun r ->
                  let rLhsFun = Rule.getLeftFun r in
                  let rRhsFun = Rule.getRightFun r in
                  if rRhsFun = funSym then
                    not(Utils.contains subSCCFuns rLhsFun) (* Incoming rule comes from outside the subSCC *)
                  else if rLhsFun = funSym then
                    not(Utils.contains subSCCFuns rRhsFun) (* Outgoing rule goes out of the subSCC *)
                  else
                    false)
                ctrsobl.ctrs.rules
            in
            let allFuns = Utils.remdup (Utils.concatMap (fun r -> [Rule.getLeftFun r; Rule.getRightFun r]) ctrsobl.ctrs.rules) in
            let outsideFuns = Utils.remove (Utils.removeAll allFuns subSCCFuns) ctrsobl.ctrs.startFun in
            List.exists (fun f -> not(hasExternalTrans ctrsobl subSCCFuns f)) outsideFuns
          in
          if not(hasSurroundedFun ctrsobl funSubset) then
            (
              Log.debug " ... without surrounded symbols";
              let outerTransSet = Utils.removeAllC Rule.equal sccTrans transSubset in
              (* Eliminate the negation of guards on the splitted transitions from the set of guards considered on the outside *)
              let innerGuards = Utils.remdupC Pc.equalAtom (Utils.concatMap Rule.getCond transSubset) in
              (* Stupid heuristic: If an inner guard is v1 >= v2 + 1, then it's negation may be v2 >= v1 *)
              let negateGuard g =
                match g with
                | Pc.Geq(t1, t2) ->
                  (
                    match (Poly.getVars t1, Poly.getVars t2) with
                    | ([v1], [v2]) ->
                      if Poly.equal t1 (Poly.fromVar v1) && Poly.equal t2 (Poly.add (Poly.fromVar v2) (Poly.fromConstant (Big_int.big_int_of_int 1))) then
                        [Pc.negateAtom g ; Pc.Geq (Poly.fromVar v2, t1)]
                      else
                        [Pc.negateAtom g]
                    | _ ->
                      [Pc.negateAtom g]
                  )
                | Pc.Leq(t2, t1) ->
                  (
                    match (Poly.getVars t1, Poly.getVars t2) with
                    | ([v1], [v2]) ->
                      if Poly.equal t1 (Poly.fromVar v1) && Poly.equal t2 (Poly.add (Poly.fromVar v2) (Poly.fromConstant (Big_int.big_int_of_int 1))) then
                        [Pc.negateAtom g ; Pc.Leq (t1, Poly.fromVar v2)]
                      else
                        [Pc.negateAtom g]
                    | _ ->
                      [Pc.negateAtom g]
                  )
                | _ -> [Pc.negateAtom g]
              in
              let negatedInnerGuards = Utils.concatMap negateGuard innerGuards in
              let cleanedOuterGuards = Utils.removeAllC Pc.equalAtom (Utils.concatMap Rule.getCond outerTransSet) negatedInnerGuards in
              let outerGuardVars = Utils.remdup (Pc.getVars cleanedOuterGuards) in
              let extractUpdatedVars rule =
                let oldNewPairs = List.combine (Term.getArgs (Rule.getLeft rule)) (Term.getArgs (Rule.getRight rule)) in
                Utils.concatMap (fun (oldV, newV) -> if (not (Poly.equal oldV newV)) then Poly.getVars oldV else []) oldNewPairs
              in
              let innerUpdatedVars = Utils.remdup (Utils.concatMap extractUpdatedVars transSubset) in
              Log.debug (Printf.sprintf " Outer guard vars [%s], inner update vars [%s]" (String.concat ", " outerGuardVars) (String.concat ", " innerUpdatedVars));
              not(List.exists (fun v -> Utils.contains outerGuardVars v) innerUpdatedVars)
            )
          else
            false
        )
      else false
    in
    if sccFunsNumber > 6 then
      None (* ... just not worth enumerating the powerset *)
    else
      let funSubsets = Utils.powSet sccFuns in
      Utils.tryFind checkFunSubsetCand funSubsets in


  if List.for_all (fun r -> not(CTRSObl.hasUnknownComplexity ctrsobl r)) sccRules then
    None
  else
    let sccFuns = Utils.remdup (Utils.concatMap Rule.getFuns sccRules) in
    selectSubSCC ctrsobl sccFuns sccRules
