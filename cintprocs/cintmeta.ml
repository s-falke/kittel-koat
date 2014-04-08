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

module CTRS = Ctrs.Make(Comrule)
module RVG = Rvgraph.Make(Comrule)
module LSC = LocalSizeComplexity.Make(Comrule)
module GSC = GlobalSizeComplexity.Make(Comrule)
module TGraph = Tgraph.Make(Comrule)

module KnowledgeProc = KnowledgePropagationProc.Make(Comrule)
module UnreachableProc = DeleteUnreachableProc.Make(Comrule)
module UnsatProc = DeleteUnsatProc.Make(Comrule)

let i = ref 1
let proofs = ref []
let output_nums = ref []
let input_nums = ref []
(** *)
let todo = ref (([], "", Expexp.zero), (TGraph.G.empty, Array.of_list []), None, 0)
let (_, _, (rvgtmp : (RVG.G.t * (RVG.G.vertex * (Comrule.rule * ((int * int) * (LSC.localcomplexity * int list)))) array) option), _) = !todo

let first (x, _, _) = x
let second(_, y, _) = y
let third (_, _, z) = z

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
  let vars = Term.getVars (Comrule.getLeft (List.hd cint)) in
  let tgraph = TGraph.compute cint in
    checkStartCondition tgraph cint startfun;
    let rvgraph = None in
      let initial = (CTRS.getInitial cint startfun, tgraph, rvgraph, 1) in
        i := 1;
        proofs := [];
        input_nums := [];
        output_nums := [];
        todo := initial;
        Cintchain.max_chaining := maxchaining;
        Cintchain.done_chaining := 0;
        run UnsatProc.process;
        doLoop ();
        proofs := List.rev !proofs;
        input_nums := List.rev !input_nums;
        output_nums := List.rev !output_nums;
        insertRVGraphIfNeeded ();
        let (rccl, tgraph, rvgraph, _) = !todo in
        let rvgraph = Utils.unboxOption rvgraph in 
	(* let tmp2 : ((int * int) * (LSC.localcomplexity * int list)) = snd (snd ((snd rvgraph).(0))) in *)
        let globalSizeComplexities = GSC.computeGlobalSizeComplexities rvgraph (first rccl) (second rccl) vars in
        Some (getComplexity tgraph globalSizeComplexities vars !todo, getProof initial !input_nums !output_nums !proofs)
and getComplexity tgraph globalSizeComplexities vars (rccgl, _, _, _) =
  Complexity.add (addComplexities tgraph globalSizeComplexities vars (first rccgl)) (Complexity.P (third rccgl))
and addComplexities tgraph globalSizeComplexities vars rcc =
  Complexity.listAdd (List.map (getOneComplexity tgraph globalSizeComplexities vars) rcc)
and getOneComplexity tgraph globalSizeComplexities vars (rule, c, cost) =
  (* let preComrules = Termgraph.getPreds tgraph rule in
  let getOneComplexityPerPreComrule (rule, c, cost) preComrule globalSizeComplexities vars =
    let csmap = getCSmap globalSizeComplexities preComrule vars
    None
  in *)
  Complexity.mult c (Complexity.P cost)
and getProof (rccg, _, _, _) inums onums theproofs =
  fun () -> "Initial complexity problem:\n1:" ^
            (CTRS.toStringG rccg) ^
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
    | ((rcc, g, l), tgraph, None, ini) ->  let (rules : Comrule.rule list) = List.map (fun (x,_,_) -> x) rcc in 
                                     let lscs = LSC.computeLocalSizeComplexities rules in
                                     todo := ((rcc, g, l), tgraph, Some (RVG.compute lscs tgraph), ini)

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
  run_ite (Cintfarkaspolo.process true 1) doLoop doExpFarkas
and doExpFarkas () =
  run_ite (Cintexpfarkaspolo.process 1) doLoop doChain1
and doChain1 () =
  run_ite (Cintchain.process 1) doLoop doChain2
and doChain2 () =
  run_ite (Cintchain.process 2) doLoop doNothing
and doNothing () =
  ()
