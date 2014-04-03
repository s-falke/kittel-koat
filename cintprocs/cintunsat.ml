(*
  Unsatisfiable constraints

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

let rec process (rcc, g) tgraph rvgraph =
  if Cintprob.isSolved rcc then
    None
  else
    let (sats, unsats) = Utils.split condIsSatisfiable rcc in
      if unsats = [] then
        None
      else
        let plainUnsats = List.map first unsats in
          let nrcc = sats
          and ng = g
          and ntgraph = Cintgraph.removeNodes tgraph plainUnsats
          and nrvgraph = getNewRVGraph rvgraph plainUnsats in
            Some (((nrcc, ng), ntgraph, nrvgraph), fun ini outi -> getProof ini outi (rcc, g) (nrcc, ng) unsats)

and first (x, _, _) =
  x

and getNewRVGraph rvgraph plainUnsats =
  match rvgraph with
    | None -> None
    | Some rvg -> Some (Cintrvgraph.removeNodes rvg plainUnsats)

and condIsSatisfiable (rule, _, _) =
  let cond = Rule.getCond rule in
    Smt.isSatisfiable (Pc.dropNonLinearAtoms cond) <> Ynm.No

and getProof ini outi rccg nrccg unsats =
  if fst nrccg = [] then
    "Testing for unsatisfiable constraints removes all transitions from problem " ^
    (string_of_int ini) ^ "."
  else
    let more = (List.length unsats) <> 1 in
      "Testing for unsatisfiable constraints removes the following" ^
      (if more then " transitions " else " transition ") ^
      "from problem " ^ (string_of_int ini) ^ ":\n" ^
      (Cintprob.toString unsats) ^ "\n" ^
      "We thus obtain the following problem:\n" ^
      (Cintprob.toStringGNumber nrccg outi)
