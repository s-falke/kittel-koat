(*
  Processor stuff

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

type proof = int -> int list -> string

type proc = Trs.trs -> (Trs.trs list * proof) option

(* Return string with new problems for proofs *)
let getStringSccs alli trsSccs =
  String.concat "\n\n" (List.map2 (fun i scc -> (string_of_int i) ^ ":" ^ (Trs.toStringPrefix "\t" scc))
                                  alli trsSccs)
