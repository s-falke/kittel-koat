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

let rec process trs tgraph isScc =
  if isScc || trs = [] then
    None
  else
    let (ntrs, junk) = splitIsSatisfiable trs in
      if junk = [] then
          None
        else
          Some ([(ntrs, Termgraph.removeNodes tgraph junk, false)], fun i alli -> getProof i alli trs ntrs)
and getProof i alli trs ntrs =
  if ntrs = [] then
    "Testing for unsatisfiable constraints removes all rules from problem " ^ (string_of_int i) ^ "."
  else
    let remo = List.filter (fun ru -> not (Trs.contains ntrs ru)) trs in
      let more = (List.length remo) <> 1 in
        "Testing for unsatisfiable constraints removes the following" ^
        (if more then " rules " else " rule ") ^
        "from problem " ^ (string_of_int i) ^ ":\n" ^
        (Trs.toStringPrefix "\t" remo) ^ "\n" ^
        "We thus obtain the following problem:\n" ^
        (Procs.getStringSccs alli [ntrs])

and splitIsSatisfiable rules =
  match rules with
    | [] -> ([], [])
    | ru::more -> let (tmp1, tmp2) = splitIsSatisfiableOne ru
                  and (res1, res2) = splitIsSatisfiable more in
                    (tmp1 @ res1, tmp2 @ res2)
and splitIsSatisfiableOne rule =
  let cond = Rule.getCond rule in
    if Smt.isSatisfiable (Pc.dropNonLinearAtoms cond) <> Ynm.No then
      ([rule], [])
    else
      ([], [rule])
