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

let toStringCompetitionStyle c =
  match c with
    | Unknown -> "MAYBE"
    | P p -> "YES(?, " ^ (Expexp.toString p) ^ ")"
and toString c =
  match c with
    | Unknown -> "?"
    | P p -> Expexp.toString p

let equal c d =
  match (c, d) with
    | (Unknown, Unknown) -> true
    | (P p, P q) -> Expexp.equal p q
    | _ -> false

let add c1 c2 =
  match (c1, c2) with
    | (Unknown, _) -> Unknown
    | (_, Unknown) -> Unknown
    | (P p, P q) -> P (Expexp.add p q)

let listAdd list =
  List.fold_left add (P Expexp.zero) list

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
    | Unknown -> failwith "Internal error in Cintprob.getExpexp"

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

(** Get upper bound on all complexities in xs *)
let rec sup cs =
  if List.exists (fun c -> c = Unknown) cs then
    Unknown
  else
    let plaincs = List.map strip cs in
      P (List.fold_left Expexp.max Expexp.zero plaincs)
and strip c =
  match c with
    | P cc -> cc
    | Unknown -> failwith "Cannot strip an Unknown!"
