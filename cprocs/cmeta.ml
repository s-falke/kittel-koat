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
let todo = ref (([], "", Big_int.zero_big_int), (Termgraph.G.empty, Array.of_list []), None, 0)

let first (x, _, _) =
  x
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
    if (Termgraph.getPreds tgraph startRules) <> [] then
      raise (Cint_aux.ParseException (0, 0, "Error: Start nodes have incoming edges!"))

let rec process trs maxchaining startfun =
  check trs;
  let tgraph = Termgraph.compute trs in
    checkStartCondition tgraph trs startfun;
    let rvgraph = None in
      let initial = (Cprob.getInitial trs startfun, tgraph, rvgraph, 1) in
        i := 1;
        proofs := [];
        input_nums := [];
        output_nums := [];
        todo := initial;
        Cchain.max_chaining := maxchaining;
        Cchain.done_chaining := 0;
        run Cunsat.process;
        run Cleaf.process;
        doLoop ();
        proofs := List.rev !proofs;
        input_nums := List.rev !input_nums;
        output_nums := List.rev !output_nums;
        Some (getComplexity !todo, getProof initial !input_nums !output_nums !proofs)
and getComplexity (rccgl, _, _, _) =
  Cprob.add (addComplexities (first rccgl)) (getAsComplexity (third rccgl))
and getAsComplexity c =
  Cprob.P (Expexp.fromConstant c)
and addComplexities rcc =
  Cprob.listAdd (List.map getOneComplexity rcc)
and getOneComplexity (_, c, cost) =
  Cprob.mult c (Cprob.P (Expexp.fromConstant cost))
and getProof (rccg, _, _, _) inums onums theproofs =
  fun () -> "Initial complexity problem:\n1:" ^
            (Cprob.toStringG rccg) ^
            "\n\n" ^
            (attachProofs inums onums theproofs)
and attachProofs inums onums tproofs =
  match inums with
    | [] -> ""
    | i::is -> ((List.hd tproofs) i (List.hd onums)) ^ "\n\n" ^ (attachProofs is (List.tl onums) (List.tl tproofs))
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
        if Cprob.isSolved (first rccgl) then
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
        if Cprob.isSolved (first rccgl) then
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
    | (rcggl, tgraph, None, ini) -> let lscs = Clocalsizecomplexity.computeLocalSizeComplexities (List.map first (first rcggl)) in
                                      todo := (rcggl, tgraph, Some (Crvgraph.compute lscs tgraph), ini)
and doLoop () =
  doUnreachableRemoval ();
  doKnowledgePropagation ();
  doFarkasConstant ()
and doUnreachableRemoval () =
  run Cunreachable.process
and doKnowledgePropagation () =
  run Cknowledge.process
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
  run_ite (Cchain.process 1) doLoop doChain2
and doChain2 () =
  run_ite (Cchain.process 2) doLoop doNothing
and doNothing () =
  ()
