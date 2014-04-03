(*
  Stuff for parametric polynomials

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

(* A parametric polynomial *)
type parapoly = ((Poly.poly * Poly.monomial) list) * Poly.poly

let toString (poly, c) =
  String.concat " + " ( (List.map (fun (pp, x) -> "(" ^ (Poly.toString pp) ^ ")*" ^ (Poly.toStringMonomial x)) poly) @ [Poly.toString c] )

(* Construct a parampoly of param monomials *)
let rec construct_poly monolist c =
  let res = filter_null (merge (sort_monos (norm_monos monolist))) in
    (res, c)
and norm_monos monolist =
  List.map normMonomial monolist
and normMonomial (c, mon) =
  (c, Poly.getNewMonomial mon [])
and sort_monos monolist =
  List.map sortMonomial monolist
and sortMonomial (c, mon) =
  (c, List.sort (fun (x, _) (y, _) -> String.compare x y) mon)
and merge monolist =
  match monolist with
    | [] -> []
    | (c, mon)::l -> let (c', l') = collect mon l in
                       (Poly.add c c', mon)::(merge l')
and collect mon l =
  match l with
    | [] -> (([], Big_int.zero_big_int), [])
    | (c, mon')::l' -> let (d, l'') = collect mon l' in
                         if mon = mon' then
                           (Poly.add c d, l'')
                         else
                           (d, (c, mon')::l'')
and filter_null =
  List.filter (fun (c, mon) -> ((fst c <> []) || (not (Poly.eq_big_int (snd c) Big_int.zero_big_int))))

(* Get the variables from a param polynomial *)
let rec getVars (poly, _) =
  Utils.remdup (List.flatten (List.map (fun (_, mon) -> getVarsMonomial mon) poly))
and getVarsMonomial mon =
  List.map (fun (x, _) -> x) mon

(* Linear in the variables? *)
let rec isLinear (poly, _) =
  List.for_all isUnivariateLinearMonomial poly
and isUnivariateLinearMonomial (_, mon) =
  Poly.isUnivariateLinearMonomial mon

(* Gets the coefficient of a param monomial *)
let rec getCoeff (poly, _) mon =
  find_it poly mon
and find_it mlist mon =
  match mlist with
    | [] -> ([], Big_int.zero_big_int)
    | (a, mon')::mlist' -> if mon = mon' then
                             a
                           else
                             find_it mlist' mon

(* Gets the constant *)
let getConstant (_, c) =
  c

(* Multiply a parampoly by a constant integer *)
let constmult (poly, c) i =
  if (Poly.eq_big_int i Big_int.zero_big_int) then
    ([], ([], Big_int.zero_big_int))
  else
    (List.map (fun (c, mon) -> (Poly.constmult c i, mon)) poly, Poly.constmult c i)

let negate =
  fun x -> constmult x (Big_int.minus_big_int Big_int.unit_big_int)

(* Multiply a parampoly by a polynomial over the parameters *)
let parapolymult (poly, c) d =
  if (fst d = [] && (Poly.eq_big_int (snd d) Big_int.zero_big_int)) then
    ([], ([], Big_int.zero_big_int))
  else
    (List.map (fun (c, mon) -> (Poly.mult c d, mon)) poly, Poly.mult c d)

(* Adds two polynomials *)
let add (poly1, c1) (poly2, c2) =
  construct_poly (poly1 @ poly2) (Poly.add c1 c2)

(* Subtract a parampoly from a parampoly *)
let minus poly1 poly2 =
  add poly1 (constmult poly2 (Big_int.minus_big_int Big_int.unit_big_int))

(* Multiply two parampolys *)
let rec mult (poly1, c1) (poly2, c2) =
  let pp = construct_poly (List.flatten (List.map (monomialmult poly1) poly2)) ([], Big_int.zero_big_int)
  and cp = parapolymult (poly2, ([], Big_int.zero_big_int)) c1
  and pc = parapolymult (poly1, ([], Big_int.zero_big_int)) c2
  and cc = ([], Poly.mult c1 c2) in
    add pp (add cp (add pc cc))
and monomialmult poly mon =
  List.map (momomu mon) poly
and momomu (c1, mon1) (c2, mon2) =
  normMonomial (Poly.mult c1 c2, mon1 @ mon2)

(* Instantiates variables in a parampoly *)
let rec instantiate (poly, c) bindings =
  let (p, c') = List.fold_left add ([], ([], Big_int.zero_big_int)) (List.map (fun mmon -> instantiate_monomial mmon bindings ([], ([], Big_int.unit_big_int))) poly) in
    (p, Poly.add c c')
and instantiate_monomial (c, mon) bindings accu =
  match mon with
    | [] -> parapolymult accu c
    | (x, 0)::l -> instantiate_monomial (c, l) bindings accu
    | (x, p)::l -> instantiate_monomial (c, (x, p - 1)::l) bindings (mult accu (safeAssoc x bindings))
and safeAssoc x bindings =
  try
    List.assoc x bindings
  with Not_found ->
    ([(([], Big_int.unit_big_int), [(x, 1)])], ([], Big_int.zero_big_int))

(* Replace variable powers *)
let rec replaceVarPower (poly, c) (x, i) q =
  let (p, c') = List.fold_left add ([], ([], Big_int.zero_big_int)) (List.map (fun mmon -> instantiate_monomial_power mmon (x, i) q ([], ([], Big_int.unit_big_int))) poly) in
    (p, Poly.add c c')
and instantiate_monomial_power (c, mon) (x, i) q accu =
  match mon with
    | [] -> parapolymult accu c
    | (y, 0)::l -> instantiate_monomial_power (c, l) (x, i) q accu
    | (y, p)::l -> if x = y && p >= i then
                     instantiate_monomial_power (c, (y, p - i)::l) (x, i) q (mult accu q)
                   else
                     instantiate_monomial_power (c, l) (x, i) q (mult accu (varPowerAsParapoly (y, p)))
and varPowerAsParapoly (x, i) =
  ([(([], Big_int.unit_big_int), [(x, i)])], ([], Big_int.zero_big_int))

(* equality check *)
let equal p q =
  (p == q) || (let (m, (l, d)) = minus p q in m = [] && l = [] && (Poly.eq_big_int d Big_int.zero_big_int))

(* equality check for monomial *)
let rec equalMono mon1 mon2 =
  mon1 == mon2 || equalMonoInternal mon1 mon2
and equalMonoInternal (c1, m1) (c2, m2) =
  (Poly.equal c1 c2) && (m1 = m2)
