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

type rule = { lhs : Term.term ; rhs : Term.term ; cond : Pc.cond }

(* Create a rule. *)
let create l r c = { lhs = l; rhs = r; cond = c }

(* Create a string for a rule *)
let toString r =
  (Term.toString r.lhs) ^ " -> " ^ (Term.toString r.rhs) ^
  (if r.cond = [] then "" else " [ " ^ (Pc.toString r.cond) ^ " ]")
let listToStringPrefix prefix rules =
  String.concat "\n" (List.map (fun r -> prefix ^ toString r) rules)

(* Create a string for a rule *)
let toDotString r =
  (Term.toString r.lhs) ^ " -> " ^ (Term.toString r.rhs) ^
  (if r.cond = [] then "" else " [ " ^ (Pc.toDotString r.cond) ^ " ]")

let compare r1 r2 =
  let lComp = Term.compare r1.lhs r2.lhs in
  if lComp <> 0 then
    lComp
  else
    let rComp = Term.compare r1.rhs r2.rhs in
    if rComp <> 0 then
      rComp
    else
      Pc.compare r1.cond r2.cond

(* Get lhs of a rule *)
let getLeft r =
  r.lhs

(* Get rhs of a rule *)
let getRight r =
  r.rhs

(* Get rhs of a rule *)
let getRights r =
  [r.rhs]

(* Get cond of a rule *)
let getCond r =
  r.cond

(* Get function symbols from both sides *)
let getFuns r =
  [Term.getFun r.lhs; Term.getFun r.rhs]

(* Get function symbol from left side *)
let getLeftFun r =
  Term.getFun r.lhs

(* Get function symbol from right side *)
let getRightFun r =
  Term.getFun r.rhs

(* Get function symbols from right side *)
let getRightFuns r =
  [Term.getFun r.rhs]

(* Return the variables of a rule *)
let getVars r =
  Utils.remdup ((Term.getVars r.lhs) @ (Term.getVars r.rhs) @ (Pc.getVars r.cond))

(* Renames the variables in a rule *)
let rec renameVars badvars r =
  let vars = getVars r in
    let varmapping = createVarMapping badvars vars in
      { lhs = Term.renameVars varmapping r.lhs;
        rhs = Term.renameVars varmapping r.rhs;
        cond = Pc.renameVars varmapping r.cond; }
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
  (Term.isLinear r.lhs) && (Term.isLinear r.rhs) && (Pc.isLinear r.cond)

(* Determines whether right-hand side of a rule is linear *)
let isRightLinear r =
  Term.isLinear r.rhs

(* Determines whether the constraint of a rule is linear *)
let isConstraintLinear r =
  Pc.isLinear r.cond

let rec equal rule1 rule2 =
  rule1 == rule2 || equalInternal rule1 rule2
and equalInternal r1 r2 =
  (Term.equal r1.lhs r2.lhs) && (Term.equal r1.rhs r2.rhs) && (Pc.equal r1.cond r2.cond)

(* Determines whether V(r) is contained V(l) *)
let satisfiesVarCond r =
  Utils.containsAll (Term.getVars r.lhs) (Term.getVars r.rhs)

let rec internalize r =
  let lvars = Term.getVars r.lhs in
    let newVars = Utils.notIn lvars (Term.getVars r.rhs) in
      let (sigma, newC) = getSubstitution newVars r.cond lvars in
        if sigma = [] then
          r
        else
          { lhs = r.lhs ; rhs = Term.instantiate r.rhs sigma ; cond = newC }
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

and chainTwoRules rule1 rule2 =
  let (_, args) = rule1.rhs in
  let renamedRule2 = renameVars (getVars rule1) rule2 in
  let (_, args') = renamedRule2.rhs in
  let rec remdupC c =
    match c with
      | [] -> []
      | x::xs -> x::(remdupC (List.filter (fun y -> not (Pc.equalAtom x y)) xs))
  and getSubstitution args args' =
    match args' with
      | [] -> []
      | x::xx -> (getName x, List.hd args)::(getSubstitution (List.tl args) xx)
  and getName poly = List.hd (Poly.getVars poly) in
    let subby = getSubstitution args args' in
    { lhs = rule1.lhs ;
      rhs = Term.instantiate renamedRule2.rhs subby ;
      cond = remdupC (rule1.cond @ (Pc.instantiate renamedRule2.cond subby)) }
and isUnary r =
  true

(* Rename variables on lhs to X_1, ..., X_N, on rhs to X_1', ..., X_M', and in cond to Y_1 ... Y_K *)
let standardize rule =
  let polyGetName p = List.hd (Poly.getVars p) in
  let (_, lhsArgs, lhsSubst) =
    List.fold_left
      (fun (i, args, subst) v -> let newV = Poly.fromVar ("X_" ^ string_of_int i) in (i + 1, args @ [newV], (polyGetName v, newV) :: subst))
      (1, [], [])
      (Term.getArgs rule.lhs) in
  let (_, rhsArgs, rhsCond, rhsSubst) =
    List.fold_left
      (fun (i, args, cond, subst) a ->
        let newV = Poly.fromVar ("X_" ^ string_of_int i ^ "'") in
        (* Do not introduce equality when this is just a var, we'll just replace it by its new name. *)
        if Poly.isVar a then
          if Utils.containsC Poly.equal (Term.getArgs rule.lhs) a then (* if it's a lhs var, we need it. *)
            (i + 1, args @ [newV], (Pc.Equ(a, newV)) :: cond, (polyGetName a, newV) :: subst)
          else
            (i + 1, args @ [newV], cond, (polyGetName a, newV) :: subst)
        else
          (i + 1, args @ [newV], (Pc.Equ(a, newV)) :: cond, subst))
      (1, [], [], [])
      (Term.getArgs rule.rhs) in
  let freshVars =
    Utils.removeAll
      (Utils.remdup ((Pc.getVars rule.cond) @ (Term.getVars rule.rhs)))
      ((Term.getVars rule.lhs) @ (List.map fst rhsSubst)) in
  let condSubst =
    Utils.mapi
      (fun i v -> let newV = Poly.fromVar ("Y_" ^ string_of_int i) in (v, newV))
      freshVars in
  { lhs = (Term.getFun rule.lhs, lhsArgs) ;
    rhs = (Term.getFun rule.rhs, rhsArgs) ;
    cond = Pc.instantiate (Pc.instantiate (rule.cond @ rhsCond) (lhsSubst @ rhsSubst)) condSubst ;
  }
