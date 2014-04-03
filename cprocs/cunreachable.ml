(*
  Unreachable removal

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

let first (x, _, _) =
  x

(* Remove unreachable *)
let rec process (rcc, g, l) tgraph rvgraph =
  if Cprob.isSolved rcc then
    None
  else
  (
    let startNodes = getStartNodes rcc g in
      let reachable = Termgraph.computeReachable tgraph startNodes in
        if List.length reachable = List.length rcc then
          None
        else
          let nrcc = keepOnly rcc reachable
          and ng = g
          and nl = l
          and ntgraph = Termgraph.keepNodes tgraph reachable
          and nrvgraph = getNewRVGraph rvgraph reachable in
            Some (((nrcc, ng, nl), ntgraph, nrvgraph), fun ini outi -> getProof ini outi (rcc, g, l) (nrcc, ng, nl))
  )

and getNewRVGraph rvgraph reachable =
  match rvgraph with
    | None -> None
    | Some rvg -> Some (Crvgraph.keepNodes rvg reachable)

and getProof ini outi rccgl nrccgl =
  if first nrccgl = [] then
    "Testing for reachability in the complexity graph removes all transitions from problem " ^
    (string_of_int ini) ^ "."
  else
    let removed = keepOnlyComplement (first rccgl) (List.map first (first nrccgl)) in
      let more = (List.length removed <> 1) in
        "Testing for reachability in the complexity graph removes the following " ^
        (if more then "transitions " else "transition ") ^
        "from problem " ^ (string_of_int ini) ^ ":\n" ^
        (Cprob.toString removed) ^ "\n" ^
        "We thus obtain the following problem:\n" ^
        (Cprob.toStringGNumber nrccgl outi)

and getStartNodes rcc g =
  List.filter (fun rule -> g = (Term.getFun (Rule.getLeft rule))) (List.map first rcc)

and keepOnly rcc rules =
  List.filter (fun (rule, _, _) -> Trs.contains rules rule) rcc

and keepOnlyComplement rcc rules =
  List.filter (fun (rule, _, _) -> not (Trs.contains rules rule)) rcc
