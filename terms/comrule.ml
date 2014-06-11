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

type rule = { lhs : Term.term ; rhss : Term.term list ; cond : Pc.cond }

(* Create a comrule. *)
let create l rs c = { lhs = l; rhss = rs; cond = c }

(* Create a string for a rule *)
let rec toString r =
  (Term.toString r.lhs) ^ " -> " ^ (toStringRhss r.rhss) ^
  (if r.cond = [] then "" else " [ " ^ (Pc.toString r.cond) ^ " ]")
and toStringRhss rs =
  "Com_" ^ (string_of_int (List.length rs)) ^ "(" ^
  String.concat ", " (List.map Term.toString rs) ^ ")"

(* Create a string for a rule *)
let toDotString r =
  (Term.toString r.lhs) ^ " -> " ^ (toStringRhss r.rhss) ^
  (if r.cond = [] then "" else " [ " ^ (Pc.toDotString r.cond) ^ " ]")

(* Get lhs of a rule *)
let getLeft r =
  r.lhs

(* Get rhs of a rule *)
let getRights r =
  r.rhss

(* Get cond of a rule *)
let getCond r =
  r.cond

(* Get function symbols from both sides *)
let getFuns r =
  Utils.remdup ((Term.getFun r.lhs)::(List.map Term.getFun r.rhss))

(* Get function symbol from left side *)
let getLeftFun r =
  Term.getFun r.lhs

(* Get function symbols from right side *)
let getRightFuns r =
  Utils.remdup (List.map Term.getFun r.rhss)

(* Return the variables in the right-hand sides *)
let getRightVars r =
  Utils.remdup (Utils.concatMap Term.getVars r.rhss)

(* Return the variables of a rule *)
let getVars r =
  Utils.remdup ((Term.getVars r.lhs) @ (getRightVars r) @ (Pc.getVars r.cond))

(* Renames the variables in a rule *)
let rec renameVars badvars r =
  let vars = getVars r in
    let varmapping = createVarMapping badvars vars in
      { lhs = Term.renameVars varmapping r.lhs;
        rhss = List.map (Term.renameVars varmapping) r.rhss;
        cond = Pc.renameVars varmapping r.cond }
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
let isLinear r =
  (Term.isLinear r.lhs) && (List.for_all Term.isLinear r.rhss) && (Pc.isLinear r.cond)

(* Determines whether right-hand sides of a rule are linear *)
let isRightLinear r =
  List.for_all Term.isLinear r.rhss

(* Determines whether the constraint of a rule is linear *)
let isConstraintLinear r =
  Pc.isLinear r.cond

let rec equal rule1 rule2 =
  rule1 == rule2 || equalInternal rule1 rule2
and equalInternal rule1 rule2 =
  (List.length rule1.rhss) = (List.length rule2.rhss)
    && (Term.equal rule1.lhs rule2.lhs)
    && (List.for_all2 Term.equal rule1.rhss rule2.rhss)
    && (Pc.equal rule1.cond rule2.cond)

(* Determines whether V(rs) is contained V(l) *)
let satisfiesVarCond r =
  Utils.containsAll (Term.getVars r.lhs) (Utils.remdup (List.flatten (List.map Term.getVars r.rhss)))

let rec internalize r =
  let lvars = Term.getVars r.lhs
  and rvars = getRightVars r in
    let newVars = Utils.notIn lvars rvars in
      let (sigma, newC) = getSubstitution newVars r.cond lvars in
        if sigma = [] then
          r
        else
          { lhs = r.lhs;
            rhss = List.map (fun r -> Term.instantiate r sigma) r.rhss;
            cond = newC; }
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
let isUnary r =
  List.length r.rhss = 1

(* Instantiate a rule *)
let instantiate r varmap =
  { lhs = Term.instantiate r.lhs varmap;
    rhss = List.map (fun r -> Term.instantiate r varmap) r.rhss;
    cond = Pc.instantiate r.cond varmap;}

let chainTwoRules rule1 rule2 =
  if (not (isUnary rule1)) then
    failwith "Trying to chain rule1 and rule2 where rule1 is non-unary"
  else
  let args = Term.getArgs (List.hd (getRights rule1))
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
    let args' = Term.getArgs (getLeft rule2') in
      let subby = getSubstitution args args' in
        { lhs = rule1.lhs;
          rhss = List.map (fun r -> Term.instantiate r subby) rule2'.rhss;
          cond = remdupC (rule1.cond @ (Pc.instantiate rule2'.cond subby))}


let removeNeq r =
  let rec removeNeqConstraint c =
    let addIn atom cs = List.map (fun c -> atom::c) cs in
    match c with
    | [] -> [[]]
    | a::rest -> let c's = removeNeqConstraint rest in
      match a with
      | Pc.Neq (l, r) -> (addIn (Pc.Gtr (l, r)) c's) @ (addIn (Pc.Lss (l, r)) c's)
      | _ -> addIn a c's
  in
  let c's = removeNeqConstraint r.cond in
    List.map (fun c' -> {lhs = r.lhs ; rhss = r.rhss ; cond = c' }) c's
