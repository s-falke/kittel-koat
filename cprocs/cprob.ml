(*
  Non-asymptotic complexity function stuff

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

type rulecost = Big_int.big_int (* The future: Expexp.expexp *)

type cRule = (Rule.rule * Complexity.complexity * rulecost)
type cprob = cRule list

let getRule ((r, _, _) : cRule) = r
and getComplexity ((_, compl, _) : cRule) = compl
and getCost ((_, _, cost) : cRule) = cost

let rec toStringPrefix prefix rcc =
  prefix ^ "T:\n" ^
  (
    if rcc = [] then
      "(none)"
    else
      let cstrings = List.map (fun anrcc -> "(" ^ (Complexity.toString (getComplexity anrcc)) ^ ", " ^ (Big_int.string_of_big_int (getCost anrcc)) ^ ")") rcc in
        let cstringlens = List.map String.length cstrings in
          let maxlen = List.fold_left max 1 cstringlens in
            (String.concat "\n" (List.map2 (toStringPrefixOne (prefix ^ "\t") maxlen) rcc cstrings))
  )
and toStringPrefixOne prefix maxlen anrcc cstring =
  let pad = String.make (maxlen - (String.length cstring) + 4) ' ' in
  prefix ^ cstring ^ pad ^ (Rule.toString (getRule anrcc))
and toString rcg =
  toStringPrefix "\t" rcg

let first (r, _, _) =
  r
and second (_, c, _) =
  c
and third (_, _, c) =
  c
let rec toStringGPrefix prefix rccgl =
  (toStringPrefix prefix (first rccgl)) ^ "\n" ^
  prefix ^ "start location:\n" ^ prefix ^ "\t" ^ (second rccgl) ^ "\n" ^
  prefix ^ "leaf cost:\n" ^ prefix ^ "\t" ^ (Big_int.string_of_big_int (third rccgl))
and toStringG rccgl =
  toStringGPrefix "\t" rccgl
and toStringGNumber rccgl i =
  (string_of_int i) ^ ":" ^ (toStringG rccgl)

let getInitial trs g =
  (List.map (fun r -> if (Term.getFun (Rule.getLeft r)) = g then (r, Complexity.P Expexp.one, Big_int.unit_big_int) else (r, Complexity.Unknown, Big_int.unit_big_int)) trs, g, Big_int.zero_big_int)

let isSolved rcc =
  List.for_all (fun (_, c, _) -> c <> Complexity.Unknown) rcc

let rec getComplexity rcc rule =
  match rcc with
    | [] -> failwith "Internal error in Cprob.getComplexity"
    | (r, c, _)::rest -> if Rule.equal r rule then
                           c
                         else
                           getComplexity rest rule

let rec getCost rcc rule =
  match rcc with
    | [] -> failwith "Internal error in Cprob.getCost"
    | (r, _, c)::rest -> if Rule.equal r rule then
                           c
                         else
                           getCost rest rule
