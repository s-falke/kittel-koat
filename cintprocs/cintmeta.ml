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

module RVG = Rvgraph.Make(Comrule)
module LSC = LocalSizeComplexity.Make(Comrule)
module GSC = GlobalSizeComplexity.Make(Comrule)
module TGraph = Tgraph.Make(Comrule)
module CTRSObl = Ctrsobl.Make(Comrule)
module CTRS = CTRSObl.CTRS
open CTRSObl
open CTRS

module KnowledgeProc = KnowledgePropagationProc.Make(Comrule)
module UnreachableProc = DeleteUnreachableProc.Make(Comrule)
module UnsatProc = DeleteUnsatProc.Make(Comrule)
module ChainProc = ComplexityChainProc.Make(Comrule)
module SlicingProc = SlicingProc.Make(Comrule)

IFDEF HAVE_APRON THEN
module ApronInvariantsProc = ApronInvariantsProcessor.Make(Comrule)
END

let i = ref 1
let proofs = ref []
let output_nums = ref []
let input_nums = ref []
let did_ai = ref false
let todo = ref (CTRSObl.getInitialObl [] "", (TGraph.G.empty, TGraph.RuleMap.empty), None, 0)

let rec check trs =
  if trs = [] then
    raise (Cint_aux.ParseException (0, 0, "Error: Cannot handle empty CINT!"))
  else
    let first = List.hd trs in
    let arity = Term.getArity (Comrule.getLeft first)
    and lvars = Term.getVars (Comrule.getLeft first) in
    checkComrules arity lvars trs
and checkComrules arity lvars trs =
  match trs with
    | [] -> ()
    | rule::rest -> let lhs = Comrule.getLeft rule in
                      if ((Term.getArity lhs) <> arity) || (Term.getVars lhs <> lvars) then
                        raise (Cint_aux.ParseException (0, 0, "Error: Not all rules have the same variables!"))
                      else if List.exists (fun r -> (Term.getArity r <> arity)) (Comrule.getRights rule) then
                        raise (Cint_aux.ParseException (0, 0, "Error: Not all function symbols have the same arity!"))
                      else
                        checkComrules arity lvars rest

and checkStartCondition tgraph trs startfun =
  let startComrules = List.filter (fun rule -> (Term.getFun (Comrule.getLeft rule)) = startfun) trs in
    if (TGraph.getPreds tgraph startComrules) <> [] then
      raise (Cint_aux.ParseException (0, 0, "Error: Start nodes have incoming edges!"))

let rec process cint maxchaining startfun =
  check cint;
  i := 1;
  proofs := [];
  input_nums := [];
  output_nums := [];
  ChainProc.max_chaining := maxchaining;
  ChainProc.done_chaining := 0;
  let initObl = CTRSObl.getInitialObl cint startfun in
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
  doLoop ();
  proofs := List.rev !proofs;
  input_nums := List.rev !input_nums;
  output_nums := List.rev !output_nums;
  insertRVGraphIfNeeded ();
  let (ctrsobl, tgraph, rvgraph, _) = !todo in
  let rvgraph = Utils.unboxOption rvgraph in
  let globalSizeComplexities = GSC.compute ctrsobl rvgraph in
  Some (getOverallCost tgraph globalSizeComplexities !todo, getProof (initObl, tgraph, rvgraph, 1) !input_nums !output_nums !proofs)
and getOverallCost tgraph globalSizeComplexities (ctrsobl, _, _, _) =
  let vars = CTRS.getVars ctrsobl.ctrs in
  let getCostForRule tgraph globalSizeComplexities vars rule =
    let preRules = TGraph.getPreds tgraph [rule] in
    let getCostPerPreRule ruleCost globalSizeComplexities vars preRule =
      let csmap = GSC.extractSizeMapForRule globalSizeComplexities preRule 0 vars in
      Complexity.apply ruleCost csmap
    in
    let ruleComplexity = CTRSObl.getComplexity ctrsobl rule in
    let ruleCost = CTRSObl.getCost ctrsobl rule in
    Complexity.mult ruleComplexity (Complexity.sup (List.map (getCostPerPreRule ruleCost globalSizeComplexities vars) preRules)) in
  Complexity.add
    (Complexity.listAdd (List.map (getCostForRule tgraph globalSizeComplexities vars) ctrsobl.ctrs.rules))
    (Complexity.P ctrsobl.leafCost)
and getProof (ctrsobl, _, _, _) inums onums theproofs =
  fun () -> "Initial complexity problem:\n1:" ^
            (CTRSObl.toString ctrsobl) ^
            "\n\n" ^
            (attachProofs inums onums theproofs)
and attachProofs inums onums tproofs =
  match inums with
  | [] -> ""
  | i::is -> ((List.hd tproofs) i (List.hd onums)) ^ "\n\n" ^ (attachProofs is (List.tl onums) (List.tl tproofs))
and update (newctrsobl, newTGraph, newRVGraph) proof ini =
  let outi = !i + 1 in
  todo := (newctrsobl, newTGraph, newRVGraph, outi);
  i := outi;
  proofs := proof::!proofs;
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
            | Some (newData, p) ->
              update newData p ini;
              proc2 ()
      )

and insertRVGraphIfNeeded () =
  match !todo with
    | (_, _, Some _, _) -> ()
    | (ctrsobl, tgraph, None, ini) ->
      let lscs = LSC.computeLocalSizeComplexities ctrsobl.ctrs.rules in
      todo := (ctrsobl, tgraph, Some (RVG.compute lscs tgraph), ini)

and doLoop () =
  doUnreachableRemoval ();
  doKnowledgePropagation ();
  doFarkasConstant ()
and doUnreachableRemoval () =
  run UnreachableProc.process
and doKnowledgePropagation () =
  run KnowledgeProc.process
and doFarkasConstant () =
  run_ite (Cintfarkaspolo.process false 0) doLoop doFarkasConstantSizeBound
and doFarkasConstantSizeBound () =
  insertRVGraphIfNeeded ();
  run_ite (Cintfarkaspolo.process true 0) doLoop doFarkas
and doFarkas () =
  run_ite (Cintfarkaspolo.process false 1) doLoop doFarkasSizeBound
and doFarkasSizeBound () =
  run_ite (Cintfarkaspolo.process true 1) doLoop doDesperateMeasures
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
    doChain1 ()
ELSE
  doChain1 ()
END
and doApronInvariants () =
  did_ai := true;
IFDEF HAVE_APRON THEN
  run ApronInvariantsProc.process_koat
ELSE
  ()
END
and doChain1 () =
  run_ite (ChainProc.process 1) doLoop doChain2
and doChain2 () =
  run_ite (ChainProc.process 2) doLoop doExpFarkas
and doExpFarkas () =
  run_ite Cintexpfarkaspolo.process doLoop doNothing
and doNothing () =
  ()
