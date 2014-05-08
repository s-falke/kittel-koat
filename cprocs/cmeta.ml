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

module CTRS = Ctrs.Make(Rule)
module RVG = Rvgraph.Make(Rule)
module LSC = LocalSizeComplexity.Make(Rule)
module GSC = GlobalSizeComplexity.Make(Rule)
module TGraph = Tgraph.Make(Rule)

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
let todo = ref (([], "", Expexp.zero), (TGraph.G.empty, Array.of_list []), None, 0)

let first (x, _, _) =
  x
and second (_, y, _) =
  y
and third (_, _, z) =
  z

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
      let initial = (CTRS.getInitial trs startfun, tgraph, rvgraph, 1) in
        i := 1;
        proofs := [];
        input_nums := [];
        output_nums := [];
        todo := initial;
        ChainProc.max_chaining := maxchaining;
        ChainProc.done_chaining := 0;
        run UnsatProc.process;
        run Cleaf.process;
        doLoop ();
        proofs := List.rev !proofs;
        input_nums := List.rev !input_nums;
        output_nums := List.rev !output_nums;
        insertRVGraphIfNeeded ();
        let (rccgl, tgraph, rvgraph, _) = !todo in
        let globalSizeComplexities = GSC.computeGlobalSizeComplexities (Utils.unboxOption rvgraph) (first rccgl) (second rccgl) vars in
        Some (getComplexity tgraph globalSizeComplexities vars !todo, getProof initial !input_nums !output_nums !proofs)
and processInner rccgltrv =
  let vars = Term.getVars (Rule.getLeft (first (List.hd (first (first rccgltrv)))))
  and initial = (first rccgltrv, second rccgltrv, third rccgltrv, (1 + sep * (!done_inner + 1)))
  and old_i = !i
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
    doLoop ();
    proofs := List.rev !proofs;
    input_nums := List.rev (List.map (fun i -> i + sep * !done_inner) !input_nums);
    output_nums := List.rev (List.map (fun i -> i + sep * !done_inner) !output_nums);
    insertRVGraphIfNeeded ();
    let (rccgl, tgraph, rvgraph, _) = !todo in
    let globalSizeComplexities = GSC.computeGlobalSizeComplexities (Utils.unboxOption rvgraph) (first rccgl) (second rccgl) vars in
    let res = Some (getComplexity tgraph globalSizeComplexities vars !todo, globalSizeComplexities, getProof initial !input_nums !output_nums !proofs) in
    ChainProc.done_chaining := old_done_chaining;
    todo := old_todo;
    output_nums := old_output_nums;
    input_nums := old_input_nums;
    proofs := old_proofs;
    i := old_i;
    res
and getComplexity tgraph globalSizeComplexities vars (rccgl, _, _, _) =
  Complexity.add (addComplexities tgraph globalSizeComplexities vars (first rccgl) (second rccgl)) (Complexity.P (third rccgl))
and addComplexities tgraph globalSizeComplexities vars rcc g =
  Complexity.listAdd (List.map (getOneComplexity tgraph globalSizeComplexities vars g) rcc)
and getOneComplexity tgraph globalSizeComplexities vars g (rule, complexity, cost) =
  if (Term.getFun (Rule.getLeft rule)) = g then
    Complexity.mult complexity (Complexity.P cost)
  else
    let preRules = TGraph.getPreds tgraph [rule] in
    let getCostPerPreRule globalSizeComplexities vars preRule =
      let csmap = GSC.extractSizeMapForRuleForVars globalSizeComplexities preRule 0 vars in
      Complexity.apply cost csmap
    in
      Complexity.mult complexity (Complexity.sup (List.map (getCostPerPreRule globalSizeComplexities vars) preRules))
and getProof (rccg, _, _, i) inums onums theproofs =
  fun () -> "Initial complexity problem:\n" ^ (string_of_int i) ^ ":" ^
            (CTRS.toStringG rccg) ^
            (attachProofs inums onums theproofs)
and attachProofs inums onums tproofs =
  match inums with
    | [] -> ""
    | i::is -> "\n\n" ^ ((List.hd tproofs) i (List.hd onums)) ^ (attachProofs is (List.tl onums) (List.tl tproofs))
and update nrccgl p ini =
  let outi = !i + 1 in
    todo := attachNumber nrccgl outi;
    i := outi;
    proofs := p::!proofs;
    input_nums := ini::!input_nums;
    output_nums := outi::!output_nums
and attachNumber ((nrc, ng, nl), ntgraph, nrvgraph) i =
  ((nrc, ng, nl), ntgraph, nrvgraph, i)

and run proc =
  match !todo with
    | (rccgl, tgraph, rvgraph, ini) ->
      (
        if CTRS.isSolved (first rccgl) then
          ()
        else
          match (proc rccgl tgraph rvgraph) with
            | None -> ()
            | Some (nrccgl, p) -> update nrccgl p ini
      )

and run_ite proc1 proc2 proc3 =
  match !todo with
    | (rccgl, tgraph, rvgraph, ini) ->
      (
        if CTRS.isSolved (first rccgl) then
          ()
        else
          match (proc1 rccgl tgraph rvgraph) with
            | None -> proc3 ()
            | Some (nrccgl, p) -> update nrccgl p ini;
                                  proc2 ()
      )

and insertRVGraphIfNeeded () =
  match !todo with
    | (_, _, Some _, _) -> ()
    | (rcggl, tgraph, None, ini) -> let lscs = LSC.computeLocalSizeComplexities (List.map first (first rcggl)) in
                                      todo := (rcggl, tgraph, Some (RVG.compute lscs tgraph), ini)


and getInnerFuns () =
  match !todo with
    | (rccgl, tgraph, _, _) ->
      (
        let sccs = TGraph.getNontrivialSccs tgraph in
          match sccs with
            | [] -> []
            | [_] -> []
            | scc::_ -> let l' = Utils.remdup (List.flatten (List.map Rule.getFuns scc))
                        and allfuns = Utils.remdup (List.flatten (List.map Rule.getFuns (List.map first (first rccgl)))) in
                          if (List.length l') = (List.length allfuns) then
                            []
                          else
                            l'
      )

and doLoop () =
  doUnreachableRemoval ();
  doKnowledgePropagation ();
  doFarkasConstant ()
and doUnreachableRemoval () =
  run UnreachableProc.process
and doKnowledgePropagation () =
  run KnowledgeProc.process
and doSeparate () =
  let l' = getInnerFuns () in
    run_ite (Cseparate.process processInner l' true (!done_inner + 1) sep) doLoop doFarkasConstant
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
