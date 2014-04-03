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

let first (x, _, _) =
  x

let rec process (rcc, g, l) tgraph rvgraph =
  if Cprob.isSolved rcc then
    None
  else
    let (sats, unsats) = Utils.split condIsSatisfiable rcc in
      if unsats = [] then
        None
      else
        let plainUnsats = List.map first unsats in
          let nrcc = sats
          and ng = g
          and nl = l
          and ntgraph = Termgraph.removeNodes tgraph plainUnsats
          and nrvgraph = getNewRVGraph rvgraph plainUnsats in
            Some (((nrcc, ng, nl), ntgraph, nrvgraph), fun ini outi -> getProof ini outi (rcc, g, l) (nrcc, ng, nl) unsats)

and getNewRVGraph rvgraph plainUnsats =
  match rvgraph with
    | None -> None
    | Some rvg -> Some (Crvgraph.removeNodes rvg plainUnsats)

and condIsSatisfiable (rule, _, _) =
  let cond = Rule.getCond rule in
    Smt.isSatisfiable (Pc.dropNonLinearAtoms cond) <> Ynm.No

and getProof ini outi rccgl nrccgl unsats =
  if first nrccgl = [] then
    "Testing for unsatisfiable constraints removes all transitions from problem " ^
    (string_of_int ini) ^ "."
  else
    let more = (List.length unsats) <> 1 in
      "Testing for unsatisfiable constraints removes the following" ^
      (if more then " transitions " else " transition ") ^
      "from problem " ^ (string_of_int ini) ^ ":\n" ^
      (Cprob.toString unsats) ^ "\n" ^
      "We thus obtain the following problem:\n" ^
      (Cprob.toStringGNumber nrccgl outi)
