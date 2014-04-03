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

let i = ref 1
let proofs = ref []
let output_nums = ref []
let input_nums = ref []
let todo = ref (([], ""), (Cintgraph.G.empty, Array.of_list []), None, 0)

let rec check trs =
  if trs = [] then
    raise (Cint_aux.ParseException (0, 0, "Error: Cannot handle empty CINT!"))
  else
    let first = List.hd trs in
      let arity = Term.getArity (Comrule.getLeft first)
      and lvars = Term.getVars (Comrule.getLeft first) in
        checkRules arity lvars trs
and checkRules arity lvars trs =
  match trs with
    | [] -> ()
    | rule::rest -> let lhs = Comrule.getLeft rule in
                      if ((Term.getArity lhs) <> arity) || (Term.getVars lhs <> lvars) then
                        raise (Cint_aux.ParseException (0, 0, "Error: Not all rules have the same variables!"))
                      else if List.exists (fun r -> (Term.getArity r <> arity)) (Comrule.getRights rule) then
                        raise (Cint_aux.ParseException (0, 0, "Error: Not all function symbols have the same arity!"))
                      else
                        checkRules arity lvars rest

and checkStartCondition tgraph trs startfun =
  let startRules = List.filter (fun rule -> (Term.getFun (Comrule.getLeft rule)) = startfun) trs in
    if (Cintgraph.getPreds tgraph startRules) <> [] then
      raise (Cint_aux.ParseException (0, 0, "Error: Start nodes have incoming edges!"))

let rec process cint maxchaining startfun =
  check cint;
  let tgraph = Cintgraph.compute cint in
    checkStartCondition tgraph cint startfun;
    let rvgraph = None in
      let initial = (Cintprob.getInitial cint startfun, tgraph, rvgraph, 1) in
        i := 1;
        proofs := [];
        input_nums := [];
        output_nums := [];
        todo := initial;
        Cintchain.max_chaining := maxchaining;
        Cintchain.done_chaining := 0;
        run Cintunsat.process;
        doLoop ();
        proofs := List.rev !proofs;
        input_nums := List.rev !input_nums;
        output_nums := List.rev !output_nums;
        Some (getComplexity !todo, getProof initial !input_nums !output_nums !proofs)
and getComplexity (rccg, _, _, _) =
  addComplexities (fst rccg)
and addComplexities rcc =
  Cintprob.listAdd (List.map getOneComplexity rcc)
and getOneComplexity (_, c, cost) =
  Cintprob.mult c (Cintprob.P (Expexp.fromConstant cost))
and getProof (rccg, _, _, _) inums onums theproofs =
  fun () -> "Initial complexity problem:\n1:" ^
            (Cintprob.toStringG rccg) ^
            "\n\n" ^
            (attachProofs inums onums theproofs)
and attachProofs inums onums tproofs =
  match inums with
    | [] -> ""
    | i::is -> ((List.hd tproofs) i (List.hd onums)) ^ "\n\n" ^ (attachProofs is (List.tl onums) (List.tl tproofs))
and update nrccg p ini =
  let outi = !i + 1 in
    todo := attachNumber nrccg outi;
    i := outi;
    proofs := p::!proofs;
    input_nums := ini::!input_nums;
    output_nums := outi::!output_nums
and attachNumber ((nrcc, ng), ntgraph, nrvgraph) i =
  ((nrcc, ng), ntgraph, nrvgraph, i)

and run proc =
  match !todo with
    | (rccg, tgraph, rvgraph, ini) ->
      (
        if Cintprob.isSolved (fst rccg) then
          ()
        else
          match (proc rccg tgraph rvgraph) with
            | None -> ()
            | Some (nrccg, p) -> update nrccg p ini
      )

and run_ite proc1 proc2 proc3 =
  match !todo with
    | (rccg, tgraph, rvgraph, ini) ->
      (
        if Cintprob.isSolved (fst rccg) then
          ()
        else
          match (proc1 rccg tgraph rvgraph) with
            | None -> proc3 ()
            | Some (nrccg, p) -> update nrccg p ini;
                                 proc2 ()
      )

and insertRVGraphIfNeeded () =
  match !todo with
    | (_, _, Some _, _) -> ()
    | (rcgg, tgraph, None, ini) -> let lscs = Cintlocalsizecomplexity.computeLocalSizeComplexities (List.map first (fst rcgg)) in
                                     Printf.printf "%s\n" (Cintlocalsizecomplexity.dumpLSCs lscs);
                                     todo := (rcgg, tgraph, Some (Cintrvgraph.compute lscs tgraph), ini)
and first (x, _, _) =
  x

and doLoop () =
  doUnreachableRemoval ();
  doKnowledgePropagation ();
  doFarkasConstant ()
and doUnreachableRemoval () =
  run Cintunreachable.process
and doKnowledgePropagation () =
  run Cintknowledge.process
and doFarkasConstant () =
  run_ite (Cintfarkaspolo.process false 0) doLoop doFarkasConstantSizeBound
and doFarkasConstantSizeBound () =
  insertRVGraphIfNeeded ();
  run_ite (Cintfarkaspolo.process true 0) doLoop doFarkas
and doFarkas () =
  run_ite (Cintfarkaspolo.process false 1) doLoop doFarkasSizeBound
and doFarkasSizeBound () =
  run_ite (Cintfarkaspolo.process true 1) doLoop doChain1
and doChain1 () =
  run_ite (Cintchain.process 1) doLoop doChain2
and doChain2 () =
  run_ite (Cintchain.process 2) doLoop doNothing
and doNothing () =
  ()
