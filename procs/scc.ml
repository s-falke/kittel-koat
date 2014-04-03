(*
  SCC decomposition

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

(* Decompse TRS into SCCs *)
let rec process trs tgraph isScc =
  if isScc then
    None
  else
    let len = List.length trs in
      if len = 0 then
        Some ([], fun i _ -> "The termination graph of problem " ^ (string_of_int i) ^ " contains no nontrivial SCC.")
      else
        let trsSccs = Termgraph.getNontrivialSccs tgraph in
          let res = buildResult tgraph trsSccs in
            Some (res, fun i alli -> getProof i alli trsSccs)

and getProof i alli trsSccs =
  let n = List.length trsSccs in
    if n = 0 then
      "The termination graph of problem " ^ (string_of_int i) ^ " contains no nontrivial SCC."
    else
      let more = n <> 1 in
        "The termination graph of problem " ^ (string_of_int i) ^
        " contains " ^ (string_of_int n) ^ " nontrivial " ^ (if more then "SCCs:\n" else "SCC:\n") ^
        (Procs.getStringSccs alli trsSccs)

and buildResult tgraph trsSccs =
  List.map (buildResultOne tgraph) trsSccs
and buildResultOne tgraph scc =
  (scc, Termgraph.keepNodes tgraph scc, true)
