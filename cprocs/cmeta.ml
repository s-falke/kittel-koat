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
module SlicingProc = SlicingProc.Make(Rule)

IFDEF HAVE_APRON THEN
module ApronInvariantsProc = ApronInvariantsProcessor.Make(Rule)
END

let sep = 10000

let i = ref 1
let done_inner = ref 1
let proofs = ref []
let output_nums = ref []
let input_nums = ref []
let did_ai = ref false
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
  i := 1;
  proofs := [];
  input_nums := [];
  output_nums := [];
  ChainProc.max_chaining := maxchaining;
  ChainProc.done_chaining := 0;
  let initObl = CTRSObl.getInitialObl trs startfun in
  let maybeSlicedObl =
    match (SlicingProc.process initObl) with
    | None -> initObl
    | Some (newctrsobl, proof) ->
      i := 2;
      proofs := proof::!proofs;
      input_nums := 1::!input_nums;
      output_nums := 2::!output_nums;
      newctrsobl in
  let tgraph = TGraph.compute maybeSlicedObl.ctrs.rules in
  checkStartCondition tgraph maybeSlicedObl.ctrs.rules startfun;
  let initial = (maybeSlicedObl, tgraph, None, !i) in
  todo := initial;
  doInitial ();
  proofs := List.rev !proofs;
  input_nums := List.rev !input_nums;
  output_nums := List.rev !output_nums;
  insertRVGraphIfNeeded ();
  let (ctrsobl, tgraph, rvgraph, _) = !todo in
  let globalSizeComplexities = GSC.compute ctrsobl (Utils.unboxOption rvgraph) in
  Some (getOverallCost tgraph globalSizeComplexities !todo, getProof (initObl, tgraph, rvgraph, 1) !input_nums !output_nums !proofs)
and processInner ctrsobl tgraph rvgraph =
  let initial = (ctrsobl, tgraph, rvgraph, (1 + sep * !done_inner)) in
  let old_i = !i
  and old_proofs = !proofs
  and old_input_nums = !input_nums
  and old_output_nums = !output_nums
  and old_todo = !todo
  and old_done_chaining = !ChainProc.done_chaining
  and old_did_ai = !did_ai
  in
    i := 1;
    proofs := [];
    input_nums := [];
    output_nums := [];
    did_ai := false;
    todo := initial;
    ChainProc.done_chaining := 0;
    doInitial ();
    proofs := List.rev !proofs;
    input_nums := List.rev (List.map (fun i -> i + sep * !done_inner) !input_nums);
    output_nums := List.rev (List.map (fun i -> i + sep * !done_inner) !output_nums);
    incr done_inner;
    insertRVGraphIfNeeded ();
    let (ctrsobl, tgraph, rvgraph, _) = !todo in
    let globalSizeComplexities = GSC.compute ctrsobl (Utils.unboxOption rvgraph) in
    let res = Some (getOverallCost tgraph globalSizeComplexities !todo, globalSizeComplexities, getProof initial !input_nums !output_nums !proofs) in
    ChainProc.done_chaining := old_done_chaining;
    todo := old_todo;
    output_nums := old_output_nums;
    input_nums := old_input_nums;
    proofs := old_proofs;
    i := old_i;
    did_ai := old_did_ai;
    res
and getOverallCost tgraph globalSizeComplexities (ctrsobl, _, _, _) =
  let vars = CTRS.getVars ctrsobl.ctrs in
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
      Log.log "Computing RVG.";
      let lscs = LSC.computeLocalSizeComplexities ctrsobl.ctrs.rules in
      if Log.do_debug () then Log.debug (Printf.sprintf "Found the following local size bounds: \n  %s" (String.concat "\n  " (List.map LSC.dumpOneLSC lscs)));
      todo := (ctrsobl, tgraph, Some (RVG.compute lscs tgraph), ini)

and doInitial () =
  doInitialCleaning ();
  doMaybeSeparateLoop ();
and doInitialCleaning () =
  run UnsatProc.process;
  run Cleaf.process;
and doMaybeSeparateLoop () =
  (* This is split from doLoop, as the check if we can separate is rather expensive.
   * When we can successfully separate, we try again (because there might be other things
   * to separate / the program changed sufficiently).
   * However, once this failed, we never need to check again (and will end in doLoop).
   *)
  doUnreachableRemoval ();
  doKnowledgePropagation ();
  doSeparate () ;
and doLoop () =
  doUnreachableRemoval ();
  doKnowledgePropagation ();
  doFarkasConstant ()
and doApronInvariants () =
  did_ai := true;
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
  Log.log "Checking if parts of the problems can be separated out.";
  let (ctrsobl, tgraph, _, _) = !todo in
  let sccs = TGraph.getNontrivialSccs tgraph in
  let rec findSubSCC ctrsobl sccs =
    match sccs with
    | [] -> None
    | scc::restSCCs ->
      match Cseparate.selectSCC ctrsobl scc with
      | Some innerFuns -> Some innerFuns
      | None -> findSubSCC ctrsobl restSCCs
  in
  match findSubSCC ctrsobl sccs with
  | Some innerFuns ->
    (
    (* This can go wrong, in the sense of that we do not end up with a solvable problem. So try, and if we fail, reset. *)
    let old_i = !i
    and old_proofs = !proofs
    and old_input_nums = !input_nums
    and old_output_nums = !output_nums
    and old_todo = !todo
    and old_done_chaining = !ChainProc.done_chaining in
    run_ite (Cseparate.process processInner innerFuns true !done_inner sep) doSeparationCleanup doFarkasConstant;
    let (resobl, _, _, _) = !todo in
    let should_retry =
      if not(CTRSObl.isSolved resobl) then
        true
      else
        (
          insertRVGraphIfNeeded ();
          let (resobl, tgraph, rvgraph, _) = !todo in
          let globalSizeComplexities = GSC.compute resobl (Utils.unboxOption rvgraph) in
          Complexity.Unknown = getOverallCost tgraph globalSizeComplexities !todo
        ) in
    if should_retry then
      (
        Log.debug "Separated analysis failed, going back to std. analysis";
        i := old_i;
        proofs := old_proofs;
        input_nums := old_input_nums;
        output_nums := old_output_nums;
        ChainProc.done_chaining := old_done_chaining;
        todo := old_todo;
        doFarkasConstant ()
      )
    else
      ()
    )
  | None ->
    doFarkasConstant ()
and doSeparationCleanup () =
  doApronInvariants () ; (* We run this even we have generated invariants before -- we changed the system *)
  run UnsatProc.process; (* New invariants may show transitions to be unusable *)
  doMaybeSeparateLoop () ;
and doFarkasConstant () =
  run_ite (Cfarkaspolo.process false false 0) doLoop doFarkasConstantSizeBound
and doFarkasConstantSizeBound () =
  insertRVGraphIfNeeded ();
  run_ite (Cfarkaspolo.process true false 0) doLoop doFarkas
and doFarkas () =
  run_ite (Cfarkaspolo.process false false 1) doLoop doFarkasSizeBound
and doFarkasSizeBound () =
  run_ite (Cfarkaspolo.process true false 1) doLoop doFarkasMinimal
and doFarkasMinimal () =
  run_ite (Cfarkaspolo.process false true 1) doLoop doDesperateMeasures
and doDesperateMeasures () =
IFDEF HAVE_APRON THEN
  if not(!did_ai) then
    (
      did_ai := true;
      doApronInvariants ();
      run UnsatProc.process; (* New invariants may show transitions to be unusable *)
      doLoop ();
    )
  else
    if !ChainProc.done_chaining > 3 then
      doPolo2 ()
    else
      doChain1 ()
ELSE
  if !ChainProc.done_chaining > 3 then
    doPolo2 ()
  else
    doChain1 ()
END
and doPolo2 () =
  run_ite (Cpolo.process 2 false) doLoop doChain1
and doChain1 () =
  run_ite (ChainProc.process 1) doLoop doChain2
and doChain2 () =
  run_ite (ChainProc.process 2) doLoop doNothing
and doNothing () =
  ()
