(*
  Stuff for polynomial constraints

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

(* A PC atom *)
type atom = Equ of Poly.poly * Poly.poly
          | Neq of Poly.poly * Poly.poly
          | Geq of Poly.poly * Poly.poly
          | Gtr of Poly.poly * Poly.poly
          | Leq of Poly.poly * Poly.poly
          | Lss of Poly.poly * Poly.poly

(* A PC constraint *)
type cond = atom list

(* create a PC constraint from what the parser gives *)
let rec create arglist =
  List.map (fun (p, l, r) -> construct_atom p (Poly.construct_poly l)
                                              (Poly.construct_poly r))
           arglist
and construct_atom p l r =
  match p with
    | "Geq" -> Geq (l, r)
    | "Gtr" -> Gtr (l, r)
    | "Leq" -> Leq (l, r)
    | "Lss" -> Lss (l, r)
    | "Equ" -> Equ (l, r)
    | "Neq" -> Neq (l, r)
    | _ -> failwith "Unexpected atom kind!"

(* Checks whether a PC constraint is linear *)
let rec isLinear cond =
  List.for_all isLinearAtom cond
and isLinearAtom a =
  match a with
    | Equ (l, r) -> (Poly.isLinear l) && (Poly.isLinear r)
    | Neq (l, r) -> (Poly.isLinear l) && (Poly.isLinear r)
    | Geq (l, r) -> (Poly.isLinear l) && (Poly.isLinear r)
    | Gtr (l, r) -> (Poly.isLinear l) && (Poly.isLinear r)
    | Leq (l, r) -> (Poly.isLinear l) && (Poly.isLinear r)
    | Lss (l, r) -> (Poly.isLinear l) && (Poly.isLinear r)

(* Drops all non-linear atoms from a PC constraint *)
let dropNonLinearAtoms cond =
  List.filter isLinearAtom cond

(* Create a string from a PC constraint *)
let rec toString cond =
  String.concat " /\\ " (List.map toStringAtom cond)
and toStringAtom a =
  match a with
    | Equ (l, r) -> (Poly.toString l) ^ " = " ^ (Poly.toString r)
    | Neq (l, r) -> (Poly.toString l) ^ " != " ^ (Poly.toString r)
    | Geq (l, r) -> (Poly.toString l) ^ " >= " ^ (Poly.toString r)
    | Gtr (l, r) -> (Poly.toString l) ^ " > " ^ (Poly.toString r)
    | Leq (l, r) -> (Poly.toString l) ^ " <= " ^ (Poly.toString r)
    | Lss (l, r) -> (Poly.toString l) ^ " < " ^ (Poly.toString r)

let compareAtom a1 a2 =
  let t (l1, l2) (r1, r2) =
    let lComp = Poly.compare l1 l2 in
    if lComp <> 0 then
      lComp
    else
      Poly.compare r1 r2 in
  match a1 with
  | Equ (l1, r1) ->
    (
      match a2 with
      | Equ (l2, r2) -> t (l1, l2) (r1, r2)
      | _ -> -1
    )
  | Neq (l1, r1) ->
    (
      match a2 with
      | Equ _ -> 1
      | Neq (l2, r2) -> t (l1, l2) (r1, r2)
      | _ -> -1
    )
  | Geq (l1, r1) ->
    (
      match a2 with
      | Equ _ | Neq _ -> 1
      | Geq (l2, r2) -> t (l1, l2) (r1, r2)
      | _ -> -1
    )
  | Gtr (l1, r1) ->
    (
      match a2 with
      | Equ _ | Neq _ | Geq _ -> 1
      | Gtr (l2, r2) -> t (l1, l2) (r1, r2)
      | _ -> -1
    )
  | Leq (l1, r1) ->
    (
      match a2 with
      | Equ _ | Neq _ | Geq _ | Gtr _ -> 1
      | Leq (l2, r2) -> t (l1, l2) (r1, r2)
      | _ -> -1
    )
  | Lss (l1, r1) ->
    (
      match a2 with
      | Equ _ | Neq _ | Geq _ | Gtr _ | Leq _ -> 1
      | Lss (l2, r2) -> t (l1, l2) (r1, r2)
    )

let compare pc1 pc2 =
  let pcNum1 = List.length pc1 in
  let pcNum2 = List.length pc2 in
  if pcNum1 < pcNum2 then
    -1
  else if pcNum1 > pcNum2 then
    1
  else
    List.fold_left2
      (fun acc a1 a2 -> if acc <> 0 then acc else compareAtom a1 a2) 0 pc1 pc2

(* Create a string from a PC constraint *)
let toDotString cond =
  String.concat " && " (List.map toStringAtom cond)

(* Transforms a formula into the SMT format *)
let rec toSMT f =
  match (List.map atomSMT f) with
    | [] -> "true"
    | [x] -> x
    | xs -> "(and " ^ (String.concat " " xs) ^ ")"
and atomSMT atom =
  match atom with
    | Equ (l, r) -> "(= " ^ (Poly.toSMT l) ^ " " ^ (Poly.toSMT r) ^ ")"
    | Neq (l, r) -> "(not (= " ^ (Poly.toSMT l) ^ " " ^ (Poly.toSMT r) ^ "))"
    | Geq (l, r) -> "(>= " ^ (Poly.toSMT l) ^ " " ^ (Poly.toSMT r) ^ ")"
    | Gtr (l, r) -> "(> " ^ (Poly.toSMT l) ^ " " ^ (Poly.toSMT r) ^ ")"
    | Leq (l, r) -> "(<= " ^ (Poly.toSMT l) ^ " " ^ (Poly.toSMT r) ^ ")"
    | Lss (l, r) -> "(< " ^ (Poly.toSMT l) ^ " " ^ (Poly.toSMT r) ^ ")"

(* Renames variables by suffixing *)
let rec renameVars varmapping f =
  List.map (renameAtom varmapping) f
and renameAtom varmapping atom =
  match atom with
    | Equ (l, r) -> Equ (Poly.renameVars varmapping l, Poly.renameVars varmapping r)
    | Neq (l, r) -> Neq (Poly.renameVars varmapping l, Poly.renameVars varmapping r)
    | Geq (l, r) -> Geq (Poly.renameVars varmapping l, Poly.renameVars varmapping r)
    | Gtr (l, r) -> Gtr (Poly.renameVars varmapping l, Poly.renameVars varmapping r)
    | Leq (l, r) -> Leq (Poly.renameVars varmapping l, Poly.renameVars varmapping r)
    | Lss (l, r) -> Lss (Poly.renameVars varmapping l, Poly.renameVars varmapping r)

(* Get the variables in a constraint *)
let rec getVars f =
  Utils.remdup (Utils.concatMap getVarsAtom f)
and getVarsAtom atom =
  match atom with
    | Equ (l, r) -> (Poly.getVars l) @ (Poly.getVars r)
    | Neq (l, r) -> (Poly.getVars l) @ (Poly.getVars r)
    | Geq (l, r) -> (Poly.getVars l) @ (Poly.getVars r)
    | Gtr (l, r) -> (Poly.getVars l) @ (Poly.getVars r)
    | Leq (l, r) -> (Poly.getVars l) @ (Poly.getVars r)
    | Lss (l, r) -> (Poly.getVars l) @ (Poly.getVars r)

(* Determines whether a list of atoms is true for a given assignment *)
let rec isTrue f assignment =
  List.for_all (isTrueAtom assignment) f
and isTrueAtom assignment atom =
  match atom with
    | Equ (l, r) -> Poly.eq_big_int (Poly.evaluate l assignment) (Poly.evaluate r assignment)
    | Neq (l, r) -> not (Poly.eq_big_int (Poly.evaluate l assignment) (Poly.evaluate r assignment))
    | Geq (l, r) -> Big_int.ge_big_int (Poly.evaluate l assignment) (Poly.evaluate r assignment)
    | Gtr (l, r) -> Big_int.gt_big_int (Poly.evaluate l assignment) (Poly.evaluate r assignment)
    | Leq (l, r) -> Big_int.le_big_int (Poly.evaluate l assignment) (Poly.evaluate r assignment)
    | Lss (l, r) -> Big_int.lt_big_int (Poly.evaluate l assignment) (Poly.evaluate r assignment)

(* Instantiates a cond *)
let rec instantiate f bindings =
  List.map (fun atom -> instantiateOne atom bindings) f
and instantiateOne atom bindings =
  match atom with
    | Equ (l, r) -> Equ (Poly.instantiate l bindings, Poly.instantiate r bindings)
    | Neq (l, r) -> Neq (Poly.instantiate l bindings, Poly.instantiate r bindings)
    | Geq (l, r) -> Geq (Poly.instantiate l bindings, Poly.instantiate r bindings)
    | Gtr (l, r) -> Gtr (Poly.instantiate l bindings, Poly.instantiate r bindings)
    | Leq (l, r) -> Leq (Poly.instantiate l bindings, Poly.instantiate r bindings)
    | Lss (l, r) -> Lss (Poly.instantiate l bindings, Poly.instantiate r bindings)

let rec equal f1 f2 =
  f1 == f2 || ((List.length f1 = List.length f2) && (List.for_all2 equalAtom f1 f2))
and equalAtom a1 a2 =
  a1 == a2 || equalInternal a1 a2
and equalInternal a1 a2 =
  match (a1, a2) with
    | (Equ (l1, r1), Equ (l2, r2)) -> (Poly.equal l1 l2) && (Poly.equal r1 r2)
    | (Neq (l1, r1), Neq (l2, r2)) -> (Poly.equal l2 l2) && (Poly.equal r1 r2)
    | (Geq (l1, r1), Geq (l2, r2)) -> (Poly.equal l1 l2) && (Poly.equal r1 r2)
    | (Gtr (l1, r1), Gtr (l2, r2)) -> (Poly.equal l1 l2) && (Poly.equal r1 r2)
    | (Leq (l1, r1), Leq (l2, r2)) -> (Poly.equal l1 l2) && (Poly.equal r1 r2)
    | (Lss (l1, r1), Lss (l2, r2)) -> (Poly.equal l1 l2) && (Poly.equal r1 r2)
    | _ -> false

let getLeqZeroTerms a =
  match a with
    | Equ (l, r) -> [Poly.minus l r; Poly.minus r l]
    | Neq (l, r) -> failwith "cannot do this!"
    | Geq (l, r) -> [Poly.minus r l]
    | Gtr (l, r) -> [Poly.add (Poly.minus r l) ([], Big_int.unit_big_int)]
    | Leq (l, r) -> [Poly.minus l r]
    | Lss (l, r) -> [Poly.add (Poly.minus l r) ([], Big_int.unit_big_int)]

let negateAtom a =
  match a with
  | Equ (l, r) -> Neq (l, r)
  | Neq (l, r) -> Geq (l, r)
  | Geq (l, r) -> Lss (l, r)
  | Lss (l, r) -> Geq (l, r)
  | Gtr (l, r) -> Leq (l, r)
  | Leq (l, r) -> Gtr (l, r)
