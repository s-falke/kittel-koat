(*
  Polynomial interpretations using Farkas' lemma.  Optionally with a minimal element

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

module LSC = LocalSizeComplexity.Make(Rule)
module GSC = GlobalSizeComplexity.Make(Rule)
module TGraph = Tgraph.Make(Rule)
module CTRSObl = Ctrsobl.Make(Rule)
module CTRS = CTRSObl.CTRS
open CTRSObl
open CTRS

let rec getOnlyFor xx r s =
  match xx with
    | [] -> []
    | x::xs -> let rule = List.hd r in
                 if (Trs.contains s rule) then
                   x::(getOnlyFor xs (List.tl r) s)
                 else
                   getOnlyFor xs (List.tl r) s


let getRuleSubsetsToOrient tgraph ctrsobl useSizeComplexities =
  (* Which ones to choose here is rather unclear, and a heuristic.
   * Enumerating all possible subsets of unknowns (i.e., rule sets for which we
   * search a PRF) works for small examples, but is not feasible on larger ones.
   * We use the following heuristics:
   *  - Try the set of _all_ unknown rules.
   *  - Take a SCC, remove everything that is already bounded, and try for the rest (?)
   *  - Try those SCCs for which all predecessors already have time bounds
   *    (if we use size complexities)
   *)
  let sccHasUnknownPreds tgraph unknowns scc =
    let sccPreds = TGraph.getPreds tgraph scc in
    let outsideSCCPreds = Utils.removeAllC Rule.equal sccPreds scc in
    List.exists (Utils.containsP Rule.equal unknowns) outsideSCCPreds in
  let sccContainsSomeUnknown unknowns scc =
    List.exists (fun r -> Utils.containsP Rule.equal unknowns r) scc in
  let unknowns = CTRSObl.getUnknownComplexityRules ctrsobl in
  if useSizeComplexities then
    let nonTrivialSCCs = TGraph.getNontrivialSccs tgraph in
    unknowns :: (List.filter (fun scc -> (sccContainsSomeUnknown unknowns scc) && not(sccHasUnknownPreds tgraph unknowns scc)) nonTrivialSCCs)
  else
    [unknowns]

let rec findFirst f xs =
  match xs with
  | [] -> None
  | x::rest ->
    match f x with
    | None -> findFirst f rest
    | Some res -> Some res

(* Find a polynomial interpretation *)
let rec process useSizeComplexities useMinimal degree ctrsobl tgraph rvgraph =
  if degree < 0 || degree > 1 || CTRSObl.isSolved ctrsobl then
    None
  else
  (
    Log.log (Printf.sprintf "Trying linear PRF (Farkas-based) processor for degree %i (%s size bounds, %s minimal element)..." degree (if useSizeComplexities then "with" else "without") (if useMinimal then "with" else "without"));
    let globalSizeComplexities = if useSizeComplexities then GSC.compute ctrsobl (Utils.unboxOption rvgraph) else GSC.empty in
    let allCandidates = getRuleSubsetsToOrient tgraph ctrsobl useSizeComplexities in
    findFirst (tryOneS useSizeComplexities useMinimal degree ctrsobl tgraph rvgraph globalSizeComplexities) allCandidates
  )
and tryOneS useSizeComplexities useMinimal degree ctrsobl tgraph rvgraph globalSizeComplexities s =
    Farkaspolo.lambda_count := 0;
    Farkaspolo.all_lambdas := [];
    let toOrient = if useSizeComplexities then s else ctrsobl.ctrs.rules in
    if toOrient = [] then
      None
    else
      let (abs, params) = Polo.create_poly_map degree toOrient in
      let cwbs_with_rules = List.map (fun r -> (r, Farkaspolo.convert_rule_to_leqs r abs Big_int.unit_big_int)) toOrient in
      let cwbs_for_unknowns_with_rules = getOnlyFor cwbs_with_rules toOrient s in
      let weak_with_rules = List.map (fun (r, cwb) -> (r, Farkaspolo.getWeak cwb)) cwbs_with_rules in
      let bound_with_rules = List.map (fun (r, cwb) -> (r, Farkaspolo.getBound cwb)) cwbs_for_unknowns_with_rules in
      let strictDecrease_with_rules = List.map (fun (r, w) -> (r, Farkaspolo.getStrict w)) (getOnlyFor weak_with_rules toOrient s) in

      let (isMINs, isMINsVars) = if useMinimal then (create_is_mins toOrient) else ([], []) in
      let weakRhsMin_with_rules = if useMinimal then (List.map (fun r -> (r, (getRhsMin isMINs r))) toOrient) else [] in
      let weakUseMinimal_with_rules = if useMinimal then List.map2 (fun (r, w) tO -> assert (Rule.equal r tO); (r, addNeitherMin isMINs w tO)) weak_with_rules toOrient else [] in
      let s = (getOnlyFor toOrient toOrient s) in (* We need to do this to restore the same order as for the other things... *)
      let boundUseMinimal_with_rules = if useMinimal then List.map2 (fun (r, w) s -> assert (Rule.equal r s); (r, addLhsNotMin isMINs w s)) bound_with_rules s else [] in
      let strictRhsNotMin_with_rules = if useMinimal then (List.map (fun r -> (r, [getRhsNotMin isMINs r])) s) else [] in
      let strictRhsMin_with_rules = if useMinimal then (List.map (fun r -> (r, [getRhsMin isMINs r])) s) else [] in

      let strictAndBounded_with_rules = 
        if useMinimal then [] 
        else 
          List.map2 (fun (rS, s) (rB, b) -> assert(Rule.equal rB rS); (rS, b @ s)) strictDecrease_with_rules bound_with_rules  in
      let strictAndNoMin_with_rules =
        if useMinimal then 
          List.map2 (fun (rS, s) (rB, b) -> assert(Rule.equal rB rS); (rS, b @ s)) strictDecrease_with_rules strictRhsNotMin_with_rules
        else [] in


      (* Optimization: If we use size complexities, we force coefficient for input
       * sizes that will have unknown sizes to zero.
       * To avoid hacking the rest of the system, we add these constraints to the
       * weak constraints, which are ANDed in anyway.
       *)
      let extra_constraints =
        if useSizeComplexities && degree > 0 then
          forceCoeffForUnknownInputToZero ctrsobl tgraph globalSizeComplexities toOrient abs
        else
          [] in

      let allparams = params @ !Farkaspolo.all_lambdas @ isMINsVars in
      let res = 
        if useMinimal then
          Smt.isSatisfiableFarkasPoloMinimal (extra_constraints @ (getMinRestrictions isMINsVars)) (getMinImplications isMINs abs) (List.map snd weakUseMinimal_with_rules) (List.map snd weakRhsMin_with_rules) (List.map snd boundUseMinimal_with_rules) (List.map snd strictAndNoMin_with_rules) (List.map snd strictRhsMin_with_rules) allparams
        else 
          Smt.isSatisfiableFarkasPolo (extra_constraints @ (Utils.concatMap snd weak_with_rules)) (List.map snd strictAndBounded_with_rules) allparams
      in
      match res with
      | None -> None
      | Some model ->
        (
          let model' = Polo.fix_model model (params @ isMINsVars) in
          let conc = get_concrete_poly abs isMINs model' in
          let c = getC useSizeComplexities tgraph conc ctrsobl toOrient globalSizeComplexities in
          let nctrsobl = 
            if useMinimal then 
              annotateMinimal ctrsobl boundUseMinimal_with_rules strictAndNoMin_with_rules strictRhsMin_with_rules model' c
            else 
              annotate ctrsobl strictAndBounded_with_rules model' c
          in
          if CTRSObl.haveSameComplexities ctrsobl nctrsobl then 
            None
          else
            (
              if Log.do_debug () then
                Log.debug ("Found the following PRF:\n" ^ (pol_to_string conc));
              Log.log (Printf.sprintf "PRF synthesis successful, proven complexity %s." (Complexity.toString c));
              Some ((nctrsobl, tgraph, rvgraph), getProof ctrsobl nctrsobl conc useSizeComplexities globalSizeComplexities toOrient)
            )
        )

and getIsMIN isMINs f =
  Pc.Equ (Poly.fromVar (getMINmarker isMINs f), Poly.one)
and getIsNotMIN isMINs f =
  Pc.Equ (Poly.fromVar (getMINmarker isMINs f), Poly.zero)
and getMINmarker isMINs f =
  List.assoc f isMINs

and getLhsMin isMINs rule =
  getIsMIN isMINs (Term.getFun (Rule.getLeft rule))
and getLhsNotMin isMINs rule =
  getIsNotMIN isMINs (Term.getFun (Rule.getLeft rule))
and getRhsMin isMINs rule =
  getIsMIN isMINs (Term.getFun (Rule.getRight rule))
and getRhsNotMin isMINs rule =
  getIsNotMIN isMINs (Term.getFun (Rule.getRight rule))

and addNeitherMin isMINs weakcond rule =
  (getLhsNotMin isMINs rule)::(getRhsNotMin isMINs rule)::weakcond

and addLhsNotMin isMINs boundcond rule =
  (getLhsNotMin isMINs rule)::boundcond

and create_is_mins trs =
  let funs = Utils.remdup (List.flatten (List.map (fun rule -> (Rule.getFuns rule)) trs)) in
    let map = List.map create_is_min funs in
      (map, List.map snd map)
and create_is_min f =
  (f, f ^ "_isMIN")

and getMinRestrictions isMINsVars =
  List.flatten (List.map getZeroOrOne isMINsVars)
and getZeroOrOne v =
  let vP = Poly.fromVar v in
    [Pc.Leq (Poly.zero, vP); Pc.Leq (vP, Poly.one)]

and getMinImplications isMINs abs =
  match isMINs with
    | [] -> []
    | (f, f_isMIN)::rest -> let f_pol = List.assoc f abs in
                              (getMinImplicationsOne f_isMIN f_pol)::(getMinImplications rest abs)
and getMinImplicationsOne f_isMIN f_pol =
  (getZero f_isMIN, List.map getZero (Polo.getParamsOne ("", f_pol)))
and getZero v =
  Pc.Equ (Poly.fromVar v, Poly.zero)

(* create concrete polo *)
and get_concrete_poly abs isMINs model =
  match abs with
    | [] -> []
    | (f, pol)::popo -> if (isMINs = []) || (isNonMIN isMINs model f) then
                          (f, Some (Polo.get_concrete_poly_one pol model))::(get_concrete_poly popo isMINs model)
                        else
                          (f, None)::(get_concrete_poly popo isMINs model)
and isNonMIN isMINs model f =
  let isMINvar = getMINmarker isMINs f in
    Poly.eq_big_int Big_int.zero_big_int (List.assoc isMINvar model)

and forceCoeffForUnknownInputToZero ctrsobl tgraph globalSizeComplexities toOrient abs =
  let vars = CTRS.getVars ctrsobl.ctrs in
  let forceCoeffForUnknownInputToZeroForFun pre_toOrient funSym =
    let incomingRules = List.filter (fun rule -> (Term.getFun (Rule.getRight rule)) = funSym) pre_toOrient in
    let varsOfUnknownSize =
      List.map fst
        (Utils.concatMap
           (fun prerule ->
             List.filter
               (fun (var, compl) -> compl = Complexity.Unknown)
               (GSC.extractSizeMapForRuleForVars globalSizeComplexities prerule 0 vars))
           incomingRules) in
    let forcedToZeroCoeffs =
      List.flatten
        (List.mapi
           (fun i v ->
             if Utils.contains varsOfUnknownSize v then
               [Polo.getName funSym (i+1)] (* We count 1-based there *)
             else
               [])
           vars) in
    forcedToZeroCoeffs in
  let pre_toOrient = Utils.notInP Rule.equal toOrient (TGraph.getPreds tgraph toOrient) in
  let funs_toOrient = Utils.remdup (List.map (fun rule -> Term.getFun (Rule.getLeft rule)) toOrient) in
  let toZeroCoeffs = Utils.remdup (Utils.concatMap (forceCoeffForUnknownInputToZeroForFun pre_toOrient) funs_toOrient) in
  List.map getZero toZeroCoeffs

and getC useSizeComplexities tgraph conc ctrsobl toOrient globalSizeComplexities =
  let vars = CTRS.getVars ctrsobl.ctrs in
  if useSizeComplexities then
    let funs_toOrient = Utils.remdup (List.map (fun rule -> Term.getFun (Rule.getLeft rule)) toOrient) in
    let pre_toOrient = Utils.notInP Rule.equal toOrient (TGraph.getPreds tgraph toOrient) in
    Complexity.listAdd (List.map (getTerm conc ctrsobl pre_toOrient globalSizeComplexities vars) funs_toOrient)
  else
    let pol_start = List.assoc ctrsobl.ctrs.startFun conc in
    let varBindings = List.mapi (fun i v -> ("X_" ^ (string_of_int (i + 1)), Expexp.fromVar v)) vars in
    Complexity.P (Expexp.abs (Expexp.instantiate (Expexp.fromPoly (Utils.unboxOption pol_start)) varBindings))
and getTerm conc ctrsobl pre_toOrient globalSizeComplexities vars f =
  let getTermForPreRule pol_f globalSizeComplexities vars prerule =
    let k = CTRSObl.getComplexity ctrsobl prerule in
    let csmap = GSC.extractSizeMapForRule globalSizeComplexities prerule 0 vars in
    let applied = Complexity.apply (Expexp.abs (Expexp.fromPoly (Utils.unboxOption pol_f))) csmap in
    Complexity.mult k applied
  in
  let t_f = List.filter (fun rule -> (Term.getFun (Rule.getRight rule)) = f) pre_toOrient in
  let pol_f = List.assoc f conc in
  Complexity.listAdd (List.map (getTermForPreRule pol_f globalSizeComplexities vars) t_f)


and isStrict strictVar model =
  try
    Pc.isTrue strictVar model
  with
  | Not_found -> false
and annotate ctrsobl strictAndBounded_with_rules model d =
  let newComplexity =
    List.fold_left 
      (fun newComplexity (rule, strictAndBounded) -> 
        if isStrict strictAndBounded model && CTRSObl.hasUnknownComplexity ctrsobl rule then 
          RuleMap.add rule d newComplexity
        else
          newComplexity)
      ctrsobl.complexity
      strictAndBounded_with_rules
  in
  { ctrs = ctrsobl.ctrs ; cost = ctrsobl.cost ; complexity = newComplexity ; leafCost = ctrsobl.leafCost }

and annotateMinimal ctrsobl boundUseMinimal_with_rules strictAndNoMin_with_rules strictRhsMin_with_rules model d =
  let isStrictMinimal bound strict rhsminimal model =
    (isStrict bound model) && ((isStrict strict model) || (isStrict rhsminimal model))
  in
  let newComplexity =
    List.fold_left 
      (fun newComplexity ((rB, boundVar), (rS, strictVar), (rM, rhsMinVar)) -> 
        assert (Rule.equal rB rS && Rule.equal rS rM);
        if isStrictMinimal boundVar strictVar rhsMinVar model && CTRSObl.hasUnknownComplexity ctrsobl rB then 
          RuleMap.add rB d newComplexity
        else
          newComplexity)
      ctrsobl.complexity
      (Utils.combine3 boundUseMinimal_with_rules strictAndNoMin_with_rules strictRhsMin_with_rules)
  in
  { ctrs = ctrsobl.ctrs ; cost = ctrsobl.cost ; complexity = newComplexity ; leafCost = ctrsobl.leafCost }


and getProof oldctrsobl newctrsobl pol useSizeComplexities sizeComplexities toOrient ini outi =
  let newlybound = List.filter (fun rule -> not (CTRSObl.hasUnknownComplexity newctrsobl rule)) (CTRSObl.getUnknownComplexityRules oldctrsobl) in
  let moreThanOne = (List.length newlybound) <> 1 in
  "A polynomial rank function with\n" ^
    (pol_to_string pol) ^ "\n" ^
    (if useSizeComplexities then ("and size complexities\n" ^ (GSC.printSizeComplexities newctrsobl sizeComplexities) ^ "\n") else "") ^
    "orients " ^ (printOrientedRules useSizeComplexities toOrient) ^ "weakly and the " ^ (if moreThanOne then "transitions" else "transition") ^ "\n" ^
    (Rule.listToStringPrefix "\t" newlybound) ^ "\n" ^
    "strictly and produces the following problem:\n" ^
    (CTRSObl.toStringNumber newctrsobl outi)
and printOrientedRules useSizeComplexities toOrient =
  if useSizeComplexities then
    "the " ^ (if (List.length toOrient) <> 1 then "transitions" else "transition") ^ "\n" ^
      (Trs.toStringPrefix "\t" toOrient) ^ "\n"
  else "all transitions "
and pol_to_string pol =
  String.concat "\n" (List.map pol_to_string_one pol)
and pol_to_string_one (f, pol_opt) =
  "\tPol(" ^ f ^ ") = " ^ (if pol_opt = None then "-infty" else (Poly.toString (rename (Utils.unboxOption pol_opt))))
and rename pol =
  let vars = Poly.getVars pol in
  let mapping = List.map (fun x_i -> (x_i, Poly.fromVar ("V" ^ (String.sub x_i 1 ((String.length x_i) - 1))))) vars in
  Poly.instantiate pol mapping
