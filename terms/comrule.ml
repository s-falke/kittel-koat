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

type rule = Term.term * Term.term list * Pc.cond

(* Create a string for a rule *)
let rec toString (l, rs, c) =
  (Term.toString l) ^ " -> " ^ (toStringRhss rs) ^
  (if c = [] then "" else " [ " ^ (Pc.toString c) ^ " ]")
and toStringRhss rs =
  "Com_" ^ (string_of_int (List.length rs)) ^ "(" ^
  String.concat ", " (List.map Term.toString rs) ^ ")"

(* Create a string for a rule *)
let toDotString (l, rs, c) =
  (Term.toString l) ^ " -> " ^ (toStringRhss rs) ^
  (if c = [] then "" else " [ " ^ (Pc.toDotString c) ^ " ]")

(* Get lhs of a rule *)
let getLeft (l, _, _) =
  l

(* Get rhs of a rule *)
let getRights (_, rs, _) =
  rs

(* Get cond of a rule *)
let getCond (_, _, c) =
  c

(* Get function symbols from both sides *)
let getFuns (l, rs, _) =
  Utils.remdup ((Term.getFun l)::(List.map Term.getFun rs))

(* Get function symbol from left side *)
let getLeftFun (l, _, _) =
  Term.getFun l

(* Get function symbols from right side *)
let getRightFuns (_, rs, _) =
  Utils.remdup (List.map Term.getFun rs)

(* Return the variables in the right-hand sides *)
let getRightVars (_, rs, _) =
  Utils.remdup (List.flatten (List.map Term.getVars rs))

(* Return the variables of a rule *)
let getVars (l, rs, c) =
  Utils.remdup ((Term.getVars l) @ (getRightVars (l, rs, c)) @ (Pc.getVars c))

(* Renames the variables in a rule *)
let rec renameVars badvars (l, rs, c) =
  let vars = getVars (l, rs, c) in
    let varmapping = createVarMapping badvars vars in
      (Term.renameVars varmapping l, List.map (Term.renameVars varmapping) rs, Pc.renameVars varmapping c)
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
let isLinear (l, rs, c) =
  (Term.isLinear l) && (List.for_all Term.isLinear rs) && (Pc.isLinear c)

(* Determines whether right-hand sides of a rule are linear *)
let isRightLinear (_, rs, _) =
  List.for_all Term.isLinear rs

(* Determines whether the constraint of a rule is linear *)
let isConstraintLinear (_, _, c) =
  Pc.isLinear c

let rec equal rule1 rule2 =
  rule1 == rule2 || equalInternal rule1 rule2
and equalInternal (l1, rs1, c1) (l2, rs2, c2) =
  (List.length rs1) = (List.length rs2) && (Term.equal l1 l2) && (List.for_all2 Term.equal rs1 rs2) && (Pc.equal c1 c2)

(* Determines whether V(rs) is contained V(l) *)
let satisfiesVarCond (l, rs, _) =
  Utils.containsAll (Term.getVars l) (Utils.remdup (List.flatten (List.map Term.getVars rs)))

let rec internalize (l, rs, c) =
  let lvars = Term.getVars l
  and rvars = getRightVars (l, rs, c) in
    let newVars = Utils.notIn lvars rvars in
      let (sigma, newC) = getSubstitution newVars c lvars in
        if sigma = [] then
          (l, rs, c)
        else
          (l, List.map (fun r -> Term.instantiate r sigma) rs, newC)
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

(* only one rhs? *)
let isUnary (_, rs, c) =
  List.length rs = 1

(* Instantiate a rule *)
let instantiate (l, rs, c) varmap =
  (Term.instantiate l varmap, List.map (fun r -> Term.instantiate r varmap) rs, Pc.instantiate c varmap)

let chainTwoRules rule1 rule2 =
  if (not (isUnary rule1)) then 
    failwith "Trying to chain rule1 and rule2 where rule1 is non-unary"
  else
  let l = getLeft rule1
  and args = Term.getArgs (List.hd (getRights rule1))
  and c = getCond rule1
  and rule2' = renameVars (getVars rule1) rule2 in
  let rec remdupC c =
    match c with
      | [] -> []
      | x::xs -> x::(remdupC (List.filter (fun y -> not (Pc.equalAtom x y)) xs))
  and getSubstitution args args' =
    match args' with
      | [] -> []
      | x::xx -> (getName x, List.hd args)::(getSubstitution (List.tl args) xx)
  and getName poly =
    List.hd (Poly.getVars poly) in
    let args' = Term.getArgs (getLeft rule2')
    and rs = getRights rule2'
    and c' = getCond rule2' in
      let subby = getSubstitution args args' in
        (l, List.map (fun r -> Term.instantiate r subby) rs, remdupC (c @ (Pc.instantiate c' subby)))

