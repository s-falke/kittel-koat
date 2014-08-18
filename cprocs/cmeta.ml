(*
  Combined multivariate complexity function processor

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

IFDEF HAVE_APRON THEN
open ApronInvariantsProc
END

module RVG = Rvgraph.Make(Rule)
module LSC = LocalSizeComplexity.Make(Rule)
module GSC = GlobalSizeComplexity.Make(Rule)
module TGraph = Tgraph.Make(Rule)
module CTRSObl = Ctrsobl.Make(Rule)
module CTRS = CTRSObl.CTRS
open CTRSObl
open CTRS

module KnowledgeProc = KnowledgePropagationProc.Make(Rule)
module UnreachableProc = DeleteUnreachableProc.Make(Rule)
module UnsatProc = DeleteUnsatProc.Make(Rule)
module ChainProc = ComplexityChainProc.Make(Rule)

let sep = 10000

let i = ref 1
let done_inner = ref 0
let proofs = ref []
let output_nums = ref []
let input_nums = ref []
let todo = ref (CTRSObl.getInitialObl [] "", (TGraph.G.empty, Array.of_list []), None, 0)

let rec check trs =
  if trs = [] then
    raise (Cint_aux.ParseException (0, 0, "Error: Cannot handle empty CINT!"))
  else
    let first = List.hd trs in
    let arity = Term.getArity (Rule.getLeft first)
    and lvars = Term.getVars (Rule.getLeft first) in
    checkRules arity lvars trs
and checkRules arity lvars trs =
  match trs with
    | [] -> ()
    | rule::rest -> let lhs = Rule.getLeft rule
                    and rhs = Rule.getRight rule in
                      if ((Term.getArity lhs) <> arity) || (Term.getVars lhs <> lvars) then
                        raise (Cint_aux.ParseException (0, 0, "Error: Not all rules have the same variables!"))
                      else if ((Term.getArity rhs) <> arity) then
                        raise (Cint_aux.ParseException (0, 0, "Error: Not all function symbols have the same arity!"))
                      else
                        checkRules arity lvars rest

and checkStartCondition tgraph trs startfun =
  let startRules = List.filter (fun rule -> (Term.getFun (Rule.getLeft rule)) = startfun) trs in
    if (TGraph.getPreds tgraph startRules) <> [] then
      raise (Cint_aux.ParseException (0, 0, "Error: Start nodes have incoming edges!"))

let rec process trs maxchaining startfun =
  check trs;
  let vars = Term.getVars (Rule.getLeft (List.hd trs)) in
  let tgraph = TGraph.compute trs in
    checkStartCondition tgraph trs startfun;
    let rvgraph = None in
      let initial = (CTRSObl.getInitialObl trs startfun, tgraph, rvgraph, 1) in
        i := 1;
        proofs := [];
        input_nums := [];
        output_nums := [];
        todo := initial;
        ChainProc.max_chaining := maxchaining;
        ChainProc.done_chaining := 0;
        doInitial ();
        proofs := List.rev !proofs;
        input_nums := List.rev !input_nums;
        output_nums := List.rev !output_nums;
        insertRVGraphIfNeeded ();
        let (ctrsobl, tgraph, rvgraph, _) = !todo in
        let globalSizeComplexities = GSC.compute ctrsobl (Utils.unboxOption rvgraph) in
        Some (getOverallCost tgraph globalSizeComplexities vars !todo, getProof initial !input_nums !output_nums !proofs)
and processInner ctrsobl tgraph rvgraph =
  let vars = CTRS.getVars ctrsobl.ctrs in
  let initial = (ctrsobl, tgraph, rvgraph, (1 + sep * (!done_inner + 1))) in
  let old_i = !i
  and old_proofs = !proofs
  and old_input_nums = !input_nums
  and old_output_nums = !output_nums
  and old_todo = !todo
  and old_done_chaining = !ChainProc.done_chaining
  in
    i := 1;
    proofs := [];
    input_nums := [];
    output_nums := [];
    todo := initial;
    ChainProc.done_chaining := 0;
    incr done_inner;
    doInitial ();
    proofs := List.rev !proofs;
    input_nums := List.rev (List.map (fun i -> i + sep * !done_inner) !input_nums);
    output_nums := List.rev (List.map (fun i -> i + sep * !done_inner) !output_nums);
    insertRVGraphIfNeeded ();
    let (ctrsobl, tgraph, rvgraph, _) = !todo in
    let globalSizeComplexities = GSC.compute ctrsobl (Utils.unboxOption rvgraph) in
    let res = Some (getOverallCost tgraph globalSizeComplexities vars !todo, globalSizeComplexities, getProof initial !input_nums !output_nums !proofs) in
    ChainProc.done_chaining := old_done_chaining;
    todo := old_todo;
    output_nums := old_output_nums;
    input_nums := old_input_nums;
    proofs := old_proofs;
    i := old_i;
    res
and getOverallCost tgraph globalSizeComplexities vars (ctrsobl, _, _, _) =
  let getCostForRule tgraph globalSizeComplexities vars rule =
    let ruleCost = CTRSObl.getCost ctrsobl rule in
    let ruleComplexity = CTRSObl.getComplexity ctrsobl rule in
    if Expexp.isConst ruleCost then
      Complexity.mult ruleComplexity (Complexity.P ruleCost)
    else
      (
        let preRules = TGraph.getPreds tgraph [rule] in
        let getCostPerPreRule ruleCost globalSizeComplexities vars preRule =
          let csmap = GSC.extractSizeMapForRuleForVars globalSizeComplexities preRule 0 vars in
          Complexity.apply ruleCost csmap
        in
        Complexity.mult ruleComplexity (Complexity.sup (List.map (getCostPerPreRule ruleCost globalSizeComplexities vars) preRules))
      ) in
  let ruleCosts = (Complexity.listAdd (List.map (getCostForRule tgraph globalSizeComplexities vars) ctrsobl.ctrs.rules)) in
  Complexity.add 
    ruleCosts
    (Complexity.P ctrsobl.leafCost)
and getProof (ctrsobl, _, _, i) inums onums theproofs =
  fun () -> "Initial complexity problem:\n" ^ (string_of_int i) ^ ":" ^
            (CTRSObl.toString ctrsobl) ^
            (attachProofs inums onums theproofs)
and attachProofs inums onums tproofs =
  match inums with
    | [] -> ""
    | i::is -> "\n\n" ^ ((List.hd tproofs) i (List.hd onums)) ^ (attachProofs is (List.tl onums) (List.tl tproofs))
and update (ctrsobl, tgraph, rvgraph) p ini =
  let outi = !i + 1 in
    todo := (ctrsobl, tgraph, rvgraph, outi);
    i := outi;
    proofs := p::!proofs;
    input_nums := ini::!input_nums;
    output_nums := outi::!output_nums

and run proc =
  match !todo with
    | (ctrsobl, tgraph, rvgraph, ini) ->
      (
        if CTRSObl.isSolved ctrsobl then
          ()
        else
          match (proc ctrsobl tgraph rvgraph) with
            | None -> ()
            | Some (newData, p) -> update newData p ini
      )

and run_ite proc1 proc2 proc3 =
  match !todo with
    | (ctrsobl, tgraph, rvgraph, ini) ->
      (
        if CTRSObl.isSolved ctrsobl then
          ()
        else
          match (proc1 ctrsobl tgraph rvgraph) with
            | None -> proc3 ()
            | Some (newData, p) -> update newData p ini;
                                   proc2 ()
      )

and insertRVGraphIfNeeded () =
  match !todo with
    | (_, _, Some _, _) -> ()
    | (ctrsobl, tgraph, None, ini) ->
      let lscs = LSC.computeLocalSizeComplexities ctrsobl.ctrs.rules in
      todo := (ctrsobl, tgraph, Some (RVG.compute lscs tgraph), ini)

(*
 Heuristic:
  guardVars(  l -> r [g] ) = Vars(g)
  updateVars( l -> r [g] ) = Vars(r) \ { v' \in Vars(r) | v = v' \in g }
  Natural lift to rule sets
  Take Sub-SCC S' of S if guardVars(S) \cap updateVars(S') = \emptyset
*)

and selectSubSCC sccFuns (sccTrans : Rule.rule list) =
  let funSubsets = List.tl (Utils.powSet sccFuns) in (* First one is the empty set *)
  let checkFunSubsetCand funSubset =
    let transSubset = List.filter (fun rule -> Utils.contains funSubset (Rule.getLeftFun rule) && Utils.contains funSubset (Rule.getRightFun rule)) sccTrans in
    let (funsWithIn', funsWithOut') = List.fold_left (fun (ins, outs) rule -> ((Rule.getLeftFun rule)::ins, (Rule.getRightFun rule)::outs)) ([], []) transSubset in
    let funsWithIn = Utils.remdup funsWithIn' in
    let funsWithOut = Utils.remdup funsWithOut' in
    let funNumber = List.length funSubset in
    if (funNumber > 0) && (List.length funsWithIn = funNumber) && (List.length funsWithOut = funNumber) then (* is SCC *)
    (
      let outerTransSet = Utils.removeAllC Rule.equal sccTrans transSubset in
      let outerGuardVars = Utils.remdup (Utils.concatMap (fun rule -> Pc.getVars (Rule.getCond rule)) outerTransSet) in
      let extractUpdatedVars rule =
        let oldNewPairs = List.combine (Term.getArgs (Rule.getLeft rule)) (Term.getArgs (Rule.getRight rule)) in
        Utils.concatMap (fun (oldV, newV) -> if (not (Poly.equal oldV newV)) then Poly.getVars oldV else []) oldNewPairs
      in
      let innerUpdatedVars = Utils.remdup (Utils.concatMap extractUpdatedVars transSubset) in
      List.exists (fun v -> Utils.contains outerGuardVars v) innerUpdatedVars
    )
    else false
  in
  Utils.tryFind checkFunSubsetCand funSubsets

and selectSCC ctrsobl sccRules =
  if List.for_all (fun r -> not(CTRSObl.hasUnknownComplexity ctrsobl r)) sccRules then
    None
  else
    let sccFuns = Utils.remdup (Utils.concatMap Rule.getFuns sccRules) in
    selectSubSCC sccFuns sccRules

and getInnerFuns () =
  match !todo with
    | (ctrsobl, tgraph, _, _) ->
      (
        let sccs = TGraph.getNontrivialSccs tgraph in
        match sccs with
        | [] -> []
        | [_] -> []
        | scc::_ -> 
          let l' = Utils.remdup (List.flatten (List.map Rule.getFuns scc))
          and allfuns = Utils.remdup (List.flatten (List.map Rule.getFuns ctrsobl.ctrs.rules)) in
          if (List.length l') = (List.length allfuns) then
            []
          else
            l'
      )

and doInitial () =
  doInitialCleaning ();
  doLoop ();
and doInitialCleaning () =
  run UnsatProc.process;
  run Cleaf.process;
and doLoop () =
  doUnreachableRemoval ();
  doKnowledgePropagation ();
  doSeparate () ; (* doFarkasConstant () *)
and doApronInvariants () =
IFDEF HAVE_APRON THEN
  run ApronInvariantsProc.process_koat
ELSE
  ()
END
and doUnreachableRemoval () =
  run UnreachableProc.process
and doKnowledgePropagation () =
  run KnowledgeProc.process
and doSeparate () =
  let (ctrsobl, tgraph, _, _) = !todo in
  let sccs = TGraph.getNontrivialSccs tgraph in
  let rec findSubSCC ctrsobl sccs =
    match sccs with
    | [] -> None
    | scc::restSCCs ->
      match selectSCC ctrsobl scc with
      | Some innerFuns -> Some innerFuns
      | None -> findSubSCC ctrsobl restSCCs
  in
  match findSubSCC ctrsobl sccs with
  | Some innerFuns ->
    run_ite (Cseparate.process processInner innerFuns true (!done_inner + 1) sep) doSeparationCleanup doFarkasConstant
  | None -> 
    doFarkasConstant ()
and doSeparationCleanup () =
  doApronInvariants () ;
  run UnsatProc.process;
  doLoop () ;
and doFarkasConstant () =
  run_ite (Cfarkaspolo.process false false 0) doLoop doFarkasConstantSizeBound
and doFarkasConstantSizeBound () =
  insertRVGraphIfNeeded ();
  run_ite (Cfarkaspolo.process true false 0) doLoop doFarkas
and doFarkas () =
  run_ite (Cfarkaspolo.process false false 1) doLoop doPolo1
and doPolo1 () =
  run_ite (Cpolo.process 1 false) doLoop doFarkasSizeBound
and doFarkasSizeBound () =
  run_ite (Cfarkaspolo.process true false 1) doLoop doPolo1SizeBound
and doPolo1SizeBound () =
  run_ite (Cpolo.process 1 true) doLoop doFarkasMinimal
and doFarkasMinimal () =
  run_ite (Cfarkaspolo.process false true 1) doLoop doPolo2
and doPolo2 () =
  run_ite (Cpolo.process 2 false) doLoop doChain1
and doChain1 () =
  run_ite (ChainProc.process 1) doLoop doChain2
and doChain2 () =
  run_ite (ChainProc.process 2) doLoop doNothing
and doNothing () =
  ()
