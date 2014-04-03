(*
  Combined processor

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
let todo = ref []

let rec process trs maxchaining =
  i := 1;
  proofs := [];
  input_nums := [];
  output_nums := [];
  todo := [((trs, Termgraph.compute trs, false), 1)];
  Chain.max_chaining := maxchaining;
  Chain.done_chaining := 0;
  run Unsat.process;
  doLoop ();
  proofs := List.rev !proofs;
  input_nums := List.rev !input_nums;
  output_nums := List.rev !output_nums;
  let ret = getRet !todo in
    Some (ret, getProof trs !input_nums !output_nums !proofs)
and getRet tt =
  match tt with
    | [] -> None
    | ((trs, _, _), _)::_ -> Some trs
and getProof trs inums onums tproofs =
  fun () -> "Initial termination problem:\n1:" ^
            (Trs.toStringPrefix "\t" trs) ^
            "\n\n" ^
            (attachProofs inums onums tproofs)
and attachProofs inums onums tproofs =
  match inums with
    | [] -> ""
    | i::is -> ((List.hd tproofs) i (List.hd onums)) ^ "\n\n" ^ (attachProofs is (List.tl onums) (List.tl tproofs))
and update ntrss p ini =
  proofs := p::!proofs;
  input_nums := ini::!input_nums;
  let nonemptys = List.filter (fun (trs, tgraph, scc) -> trs <> []) ntrss in
    let n = List.length nonemptys in
      let olist = Utils.getList (!i + 1) (!i + n) in
        i := !i + n;
        output_nums := olist::!output_nums;
        todo := (List.map2 (fun (trs, tgraph, scc) i -> ((trs, tgraph, scc), i)) nonemptys olist) @ (List.tl !todo)

and run proc =
  match !todo with
    | [] -> ()
    | ((trs, tgraph, scc), ini)::_ ->
      (
        if trs = [] then
          ()
        else
          match (proc trs tgraph scc) with
            | None -> ()
            | Some (ntrss, p) -> update ntrss p ini
      )

and run_ite proc1 proc2 proc3 =
  match !todo with
    | [] -> ()
    | ((trs, tgraph, scc), ini)::_ ->
      (
        if trs = [] then
          ()
        else
          match (proc1 trs tgraph scc) with
            | None -> proc3 ()
            | Some (ntrss, p) -> update ntrss p ini;
                                 proc2 ()
      )

and doLoop () =
  run_ite Scc.process doLoop doFarkasPolo
and doFarkasPolo () =
  run_ite Farkaspolo.process doLoop doPolo1
and doPolo1 () =
  run_ite (Polo.process 1) doLoop doPolo2
and doPolo2 () =
  run_ite (Polo.process 2) doLoop doChain
and doChain () =
  run_ite Chain.process doLoop doNothing
and doNothing () =
  ()
