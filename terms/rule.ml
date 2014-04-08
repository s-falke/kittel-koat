(*
  Rules

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

type rule = Term.term * Term.term * Pc.cond

(* Create a string for a rule *)
let toString (l, r, c) =
  (Term.toString l) ^ " -> " ^ (Term.toString r) ^
  (if c = [] then "" else " [ " ^ (Pc.toString c) ^ " ]")

(* Create a string for a rule *)
let toDotString (l, r, c) =
  (Term.toString l) ^ " -> " ^ (Term.toString r) ^
  (if c = [] then "" else " [ " ^ (Pc.toDotString c) ^ " ]")

(* Get lhs of a rule *)
let getLeft (l, _, _) =
  l

(* Get rhs of a rule *)
let getRight (_, r, _) =
  r

(* Get rhs of a rule *)
let getRights (_, r, _) =
  [r]

(* Get cond of a rule *)
let getCond (_, _, c) =
  c

(* Get function symbols from both sides *)
let getFuns (l, r, _) =
  [Term.getFun l; Term.getFun r]

(* Get function symbol from left side *)
let getLeftFun (l, _, _) =
  Term.getFun l

(* Get function symbol from right side *)
let getRightFuns (_, r, _) =
  [Term.getFun r]

(* Return the variables of a rule *)
let getVars (l, r, c) =
  Utils.remdup ((Term.getVars l) @ (Term.getVars r) @ (Pc.getVars c))

(* Renames the variables in a rule *)
let rec renameVars badvars (l, r, c) =
  let vars = getVars (l, r, c) in
    let varmapping = createVarMapping badvars vars in
      (Term.renameVars varmapping l, Term.renameVars varmapping r, Pc.renameVars varmapping c)
and createVarMapping badvars vars =
  match vars with
    | [] -> []
    | v::vv -> let vnew = getNewVarName badvars v in
                 (v, vnew)::(createVarMapping (vnew::badvars) vv)
and getNewVarName badvars v =
  if (Utils.contains badvars v) then
    getNewVarName badvars (v ^ "'")
  else
    v

(* Determines whether a rule is linear *)
let isLinear (l, r, c) =
  (Term.isLinear l) && (Term.isLinear r) && (Pc.isLinear c)

(* Determines whether right-hand side of a rule is linear *)
let isRightLinear (_, r, _) =
  Term.isLinear r

(* Determines whether the constraint of a rule is linear *)
let isConstraintLinear (_, _, c) =
  Pc.isLinear c

let rec equal rule1 rule2 =
  rule1 == rule2 || equalInternal rule1 rule2
and equalInternal (l1, r1, c1) (l2, r2, c2) =
  (Term.equal l1 l2) && (Term.equal r1 r2) && (Pc.equal c1 c2)

(* Determines whether V(r) is contained V(l) *)
let satisfiesVarCond (l, r, _) =
  Utils.containsAll (Term.getVars l) (Term.getVars r)

let rec internalize (l, r, c) =
  let lvars = Term.getVars l in
    let newVars = Utils.notIn lvars (Term.getVars r) in
      let (sigma, newC) = getSubstitution newVars c lvars in
        if sigma = [] then
          (l, r, c)
        else
          (l, Term.instantiate r sigma, newC)
and getSubstitution newVars c lvars =
  match newVars with
    | [] -> ([], c)
    | x::rest -> match findDefinition x lvars c None with
                   | None -> getSubstitution rest c lvars
                   | Some d -> let (sigma, newc) = getSubstitution rest (remove c d) lvars in
                                 ((x, extract x d)::sigma, newc)
and findDefinition x lvars c cand =
  match c with
    | [] -> cand
    | d::rest -> let dvars = Pc.getVarsAtom d in
                   if Utils.contains dvars x then
                     if (isEqu d) && (hasUnitCoeff d x) && (Utils.containsAll (x::lvars) dvars) then
                       if cand = None then
                         findDefinition x lvars rest (Some d)
                       else
                         None
                     else
                       None
                   else
                     findDefinition x lvars rest cand
and isEqu c =
  match c with
    | Pc.Equ _ -> true
    | _ -> false
and hasUnitCoeff c x =
  match c with
    | Pc.Equ (s, t) -> let sub = Poly.minus s t in
                         let coeff = Poly.getCoeff sub [(x, 1)] in
                           if Poly.eq_big_int (Big_int.abs_big_int coeff) Big_int.unit_big_int then
                             let sub' = Poly.minus sub (Poly.constmult (Poly.fromVar x) coeff) in
                               not (Utils.contains (Poly.getVars sub') x)
                           else
                             false
    | _ -> failwith "Internal error in Rule.hasUnitCoeff"
and extract x d =
  match d with
    | Pc.Equ (s, t) -> let sub = Poly.minus s t in
                         let coeff = Poly.getCoeff sub [(x, 1)] in
                           if Poly.eq_big_int coeff Big_int.unit_big_int then
                             Poly.constmult (Poly.minus sub (Poly.fromVar x)) (Big_int.minus_big_int Big_int.unit_big_int)
                           else
                             Poly.minus sub (Poly.fromVar x)

    | _ -> failwith "Internal error in Rule.extract"
and remove c d =
  match c with
    | [] -> []
    | d'::rest -> if Pc.equalAtom d d' then
                    rest
                  else
                    d'::(remove rest d)
