(*
  Leaf removal

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

(* Remove leaves *)
let rec process (rcc, g, l) tgraph rvgraph =
  if Cprob.isSolved rcc then
    None
  else
  (
    let leaves = Termgraph.computeRulesInTwigs tgraph in
      if (leaves = []) || (List.for_all (fun rule -> (Cprob.getComplexity rcc rule) <> Cprob.Unknown) leaves) then
        None
      else
        let nrcc = removeRules rcc leaves
        and ng = g
        and nl = Big_int.add_big_int l (getNewLeafCost rcc leaves)
        and ntgraph = Termgraph.removeNodes tgraph leaves
        and nrvgraph = getNewRVGraph rvgraph leaves in
          Some (((nrcc, ng, nl), ntgraph, nrvgraph), fun ini outi -> getProof ini outi (rcc, g, l) (nrcc, ng, nl))
  )

and getNewRVGraph rvgraph leaves =
  match rvgraph with
    | None -> None
    | Some rvg -> Some (Crvgraph.removeNodes rvg leaves)

and getProof ini outi rccgl nrccgl =
  "Repeatedly removing leaves of the complexity graph in problem " ^
  (string_of_int ini) ^ " produces the following problem:\n" ^
  (Cprob.toStringGNumber nrccgl outi)

and getNewLeafCost rcc leaves =
  List.fold_left Big_int.add_big_int Big_int.zero_big_int (List.map (Cprob.getCost rcc) leaves)

and removeRules rcc rules =
  List.filter (fun (rule, _, _) -> not (Trs.contains rules rule)) rcc
