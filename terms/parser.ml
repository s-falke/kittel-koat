(*
  Picks the "right" parser depending on the suffix of the file

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

let endsWith s suff =
  let sl = String.length s
  and suffl = String.length suff in
    try
      let send = String.sub s (sl - suffl) suffl in
        send = suff
    with
      | Invalid_argument _ -> false

let parse filename combine =
  let inchan = open_in filename in
    let res = if (endsWith filename ".simple") then
                Simple.createTrs combine (Simple_aux.getProgram inchan)
              else if (endsWith filename ".koat") then
                let cint = Cint_aux.getCint inchan in
                  Cint.separate (snd cint)
              else
                Trs_aux.getTrs inchan
              in
      close_in inchan;
      Trs.internalize res

let parseCint filename combine =
  let inchan = open_in filename in
    let res = if (endsWith filename ".simple") then
                Simple.createCint combine (Simple_aux.getProgram inchan)
              else
                Cint_aux.getCint inchan
              in
      close_in inchan;
      res
