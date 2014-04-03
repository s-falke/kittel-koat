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

type complexity = P of Expexp.expexp | Unknown

type mcfprob = (Rule.rule * complexity) list * string list

let equal c d =
  match (c, d) with
    | (Unknown, Unknown) -> true
    | (P p, P q) -> Expexp.equal p q
    | _ -> false

let first (r, _, _) =
  r
and second (_, c, _) =
  c
and third (_, _, c) =
  c

let rec toStringPrefix prefix rcc =
  prefix ^ "T:\n" ^
  (
    if rcc = [] then
      "(none)"
    else
      let cstrings = List.map (fun anrcc -> "(" ^ (toStringComplexity (second anrcc)) ^ ", " ^ (Big_int.string_of_big_int (third anrcc)) ^ ")") rcc in
        let cstringlens = List.map String.length cstrings in
          let maxlen = List.fold_left max 1 cstringlens in
            (String.concat "\n" (List.map2 (toStringPrefixOne (prefix ^ "\t") maxlen) rcc cstrings))
  )
and toStringPrefixOne prefix maxlen anrcc cstring =
  let pad = String.make (maxlen - (String.length cstring) + 4) ' ' in
  prefix ^ cstring ^ pad ^ (Rule.toString (first anrcc))
and toStringComplexity c =
  match c with
    | Unknown -> "?"
    | P p -> Expexp.toString p
and toString rcg =
  toStringPrefix "\t" rcg

let rec toStringGPrefix prefix rccgl =
  (toStringPrefix prefix (first rccgl)) ^ "\n" ^
  prefix ^ "start location:\n" ^ prefix ^ "\t" ^ (second rccgl) ^ "\n" ^
  prefix ^ "leaf cost:\n" ^ prefix ^ "\t" ^ (Big_int.string_of_big_int (third rccgl))
and toStringG rccgl =
  toStringGPrefix "\t" rccgl
and toStringGNumber rccgl i =
  (string_of_int i) ^ ":" ^ (toStringG rccgl)

let toStringComplexityCompetitionStyle c =
  match c with
    | Unknown -> "MAYBE"
    | P p -> "YES(?, " ^ (Expexp.toString p) ^ ")"

let getInitial trs g =
  (List.map (fun r -> if (Term.getFun (Rule.getLeft r)) = g then (r, P Expexp.one, Big_int.unit_big_int) else (r, Unknown, Big_int.unit_big_int)) trs, g, Big_int.zero_big_int)

let isSolved rcc =
  List.for_all (fun (_, c, _) -> c <> Unknown) rcc

let rec getComplexity rcc rule =
  match rcc with
    | [] -> failwith "Internal error in Cprob.getComplexity"
    | (r, c, _)::rest -> if Rule.equal r rule then
                           c
                         else
                           getComplexity rest rule

let rec getCost rcc rule =
  match rcc with
    | [] -> failwith "Internal error in Cprob.getComplexity"
    | (r, _, c)::rest -> if Rule.equal r rule then
                           c
                         else
                           getCost rest rule

let add c1 c2 =
  match (c1, c2) with
    | (Unknown, _) -> Unknown
    | (_, Unknown) -> Unknown
    | (P p, P q) -> P (Expexp.add p q)

let rec listAdd list =
  match list with
    | [] -> P Expexp.zero
    | [x] -> x
    | x::y::rest -> listAdd ((add x y)::rest)

let mult c1 c2 =
  match (c1, c2) with
    | (Unknown, Unknown) -> Unknown
    | (P p, Unknown) -> if Expexp.equal p Expexp.zero then
                          P p
                        else
                          Unknown
    | (Unknown, P q) -> if Expexp.equal q Expexp.zero then
                          P q
                        else
                          Unknown
    | (P p, P q) -> P (Expexp.mult p q)

let rec apply pol csmap =
  let csmap' = List.map (fun (x, c) -> (x, getExpexp c)) (List.filter (fun (x, c) -> c <> Unknown) csmap) in
    if dependsOnUnknown pol csmap' then
      Unknown
    else
      P (Expexp.instantiate pol csmap')
and getExpexp c =
  match c with
    | P p -> p
    | Unknown -> failwith "Internal error in Cprob.getExpexp"
and dependsOnUnknown pol csmap' =
  let vars = Expexp.getVars pol in
    List.exists (mappedToUnknown csmap') vars
and mappedToUnknown csmap' v =
  match csmap' with
    | [] -> true
    | (v', _)::rest -> if v = v' then
                         false
                       else
                         mappedToUnknown rest v
