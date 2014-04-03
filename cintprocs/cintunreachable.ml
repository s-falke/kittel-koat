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

(* Remove unreachable *)
let rec process (rcc, g) tgraph rvgraph =
  if Cintprob.isSolved rcc then
    None
  else
  (
    let startNodes = getStartNodes rcc g in
      let reachable = Cintgraph.computeReachable tgraph startNodes in
        if List.length reachable = List.length rcc then
          None
        else
          let nrcc = keepOnly rcc reachable
          and ng = g
          and ntgraph = Cintgraph.keepNodes tgraph reachable
          and nrvgraph = getNewRVGraph rvgraph reachable in
            Some (((nrcc, ng), ntgraph, nrvgraph), fun ini outi -> getProof ini outi (rcc, g) (nrcc, ng))
  )

and first (x, _, _) =
  x

and getNewRVGraph rvgraph reachable =
  match rvgraph with
    | None -> None
    | Some rvg -> Some (Cintrvgraph.keepNodes rvg reachable)

and getProof ini outi rccg nrccg =
  if fst nrccg = [] then
    "Testing for reachability in the complexity graph removes all transitions from problem " ^
    (string_of_int ini) ^ "."
  else
    let removed = keepOnlyComplement (fst rccg) (List.map first (fst nrccg)) in
      let more = (List.length removed <> 1) in
        "Testing for reachability in the complexity graph removes the following " ^
        (if more then "transitions " else "transition ") ^
        "from problem " ^ (string_of_int ini) ^ ":\n" ^
        (Cintprob.toString removed) ^ "\n" ^
        "We thus obtain the following problem:\n" ^
        (Cintprob.toStringGNumber nrccg outi)

and getStartNodes rcc g =
  List.filter (fun rule -> g = (Term.getFun (Rule.getLeft rule))) (List.map first rcc)

and keepOnly rcc rules =
  List.filter (fun (rule, _, _) -> Cint.contains rules rule) rcc

and keepOnlyComplement rcc rules =
  List.filter (fun (rule, _, _) -> not (Cint.contains rules rule)) rcc
