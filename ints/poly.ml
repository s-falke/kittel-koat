(*
  Stuff for integer polynomials

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

(* A monomial, i.e., a product of powers *)
type monomial = (string * int) list

(* A polynomial, i.e., a linear combination of monomials *)
type poly = (Big_int.big_int * monomial) list * Big_int.big_int

let eq_big_int b1 b2 =
  (b1 == b2) || (Big_int.eq_big_int b1 b2)

(* equality comparison *)
let rec equal p q =
  p == q || equalInternal p q
and equalInternal (poly1, c1) (poly2, c2) =
  (eq_big_int c1 c2) && ((poly1 == poly2) || ((List.length poly1 = List.length poly2) && (List.for_all2 (fun mon1 mon2 -> (mon1 == mon2) || (equalMono mon1 mon2)) poly1 poly2)))
and equalMono (c1, m1) (c2, m2) =
  (eq_big_int c1 c2) && (equalMonoList m1 m2)
and equalMonoList m1 m2 =
  (m1 == m2) || ((List.length m1 = List.length m2) && (List.for_all2 (fun vp1 vp2 -> (vp1 == vp2) || (equalVarPower vp1 vp2)) m1 m2))
and equalVarPower (x, p) (x', p') =
  (p = p') && (x == x' || x = x')

(* Construct a polynomial from list of monomials produced by parser *)
let rec construct_poly monolist =
  get_constant (filter_null (merge (sort_monos (norm_monos monolist)))) []
and norm_monos monolist =
  List.map normMonomial monolist
and normMonomial (c, mon) =
  (c, getNewMonomial mon [])
and getNewMonomial mon accu =
  match mon with
    | [] -> accu
    | (x, p)::l -> getNewMonomial l (updateAccu x p accu)
and updateAccu x p accu =
  match accu with
    | [] -> [(x, p)]
    | (y, q)::l -> if x == y || x = y then
                     (x, p + q)::l
                   else
                     (y, q)::(updateAccu x p l)
and sort_monos monolist =
  List.map sortMonomial monolist
and sortMonomial (c, mon) =
  (c, List.sort (fun (x, _) (y, _) -> String.compare x y) mon)
and merge monolist =
  match monolist with
    | [] -> []
    | (c, mon)::l -> let (c', l') = collect mon l in
                       (Big_int.add_big_int c c', mon)::(merge l')
and collect mon l =
  match l with
    | [] -> (Big_int.zero_big_int, [])
    | (c, mon')::l' -> let (d, l'') = collect mon l' in
                         if equalMonoList mon mon' then
                           (Big_int.add_big_int c d, l'')
                         else
                           (d, (c, mon')::l'')
and filter_null =
  List.filter (fun (c, mon) -> (not (eq_big_int c Big_int.zero_big_int)) || (List.length mon = 1 && fst (List.hd mon) = "$!@" && (snd (List.hd mon) = 1)))
and get_constant monolist accu =
  match monolist with
    | [] -> (accu, Big_int.zero_big_int)
    | (c, mon)::l -> if (List.length mon = 1 && fst (List.hd mon) = "$!@" && snd (List.hd mon) = 1) then
                       (accu @ l, c)
                     else
                       get_constant l (accu @ [(c, mon)])

(* Returns a variable as a polynomial *)
let fromVarPower x i =
  ([(Big_int.unit_big_int, [(x, i)])], Big_int.zero_big_int)

let fromVar x =
  fromVarPower x 1

(* Return "zero" as a polynomial *)
let zero =
  ([], Big_int.zero_big_int)

(* Return "one" as a polynomial *)
let one =
  ([], Big_int.unit_big_int)

(* Gets the coefficient of a monomial *)
let rec getCoeff (poly, _) mon =
  find_it poly mon
and find_it mlist mon =
  match mlist with
    | [] -> Big_int.zero_big_int
    | (a, mon')::mlist' -> if equalMonoList mon mon' then
                             a
                           else
                             find_it mlist' mon

(* Gets the constant *)
let getConstant (_, c) =
  c

let fromConstant c =
  ([], c)

(* Checks whether a polynomial is a single variable *)
let rec isVar (poly, c) =
  if not (eq_big_int c Big_int.zero_big_int) then
    false
  else
  (
    match poly with
      | [(a, mon)] -> (eq_big_int a Big_int.unit_big_int) && (isUnivariateLinearMonomial mon)
      | _ -> false
  )
and isUnivariateLinearMonomial mon =
  match mon with
    | [(x, e)] -> e = 1
    | _ -> false

(* Checks whether a polynomial is a single variable plus a constant *)
let isVarPlusConstant (poly, _) =
  match poly with
    | [(a, mon)] -> (eq_big_int a Big_int.unit_big_int) && (isUnivariateLinearMonomial mon)
    | _ -> false

(* Checks whether a polynomial is a sum of variables plus a constant *)
let isSumOfVarsPlusConstant (poly, _) =
  List.for_all (fun (a, mon) -> (eq_big_int a Big_int.unit_big_int) && (isUnivariateLinearMonomial mon)) poly

(* Checks whether a polynomial is a sclaed sum of variables plus a constant *)
let isScaledSumOfVarsPlusConstant (poly, _) =
  List.for_all (fun (_, mon) -> isUnivariateLinearMonomial mon) poly

let getScaleFactor (poly, _) =
  List.fold_left Big_int.max_big_int Big_int.zero_big_int (List.map fst poly)

(* Checks whether a polynomial is univariate linear *)
let isUnivariateLinear (poly, _) =
  match poly with
    | [(_, mon)] -> isUnivariateLinearMonomial mon
    | _ -> false

(* Checks whether a polynomial is a constant *)
let isConst (poly, _) =
  poly = []

(* Checks whether a polynomial is linear *)
let isLinear (poly, _) =
  List.for_all (fun (_, mon) -> isUnivariateLinearMonomial mon) poly

(* Construct a string for a polynomial *)
let rec toString (poly, d) =
  match poly with
    | [] -> Big_int.string_of_big_int d
    | (c, m)::l -> String.concat "" (construct_strings c m l d)
and toStringMonomial mon =
  String.concat "*" (List.map (fun (x, c) -> if c = 1 then x else (x ^ "^" ^ (string_of_int c))) mon)
and construct_strings c m l d =
  ( ((my_string_of_big_int c) ^ (toStringMonomial m)) ::
    (List.map (fun (c', mon') -> (if (Big_int.lt_big_int c' Big_int.zero_big_int) then " - " else " + ") ^
                                 (my_string_of_big_int (Big_int.abs_big_int c')) ^ (toStringMonomial mon'))
              l) ) @
  [ (if (eq_big_int d Big_int.zero_big_int) then "" else
    (if (Big_int.lt_big_int d Big_int.zero_big_int) then " - " else " + ") ^ (Big_int.string_of_big_int (Big_int.abs_big_int d))) ]
and my_string_of_big_int c =
  if (eq_big_int c Big_int.unit_big_int) then
    ""
  else if (eq_big_int c (Big_int.minus_big_int Big_int.unit_big_int)) then
    "-"
  else
    ((Big_int.string_of_big_int c) ^ "*")

(* Construct a string for a polynomial in Simple format *)
let rec toStringSimple (poly, d) =
  match poly with
    | [] -> Big_int.string_of_big_int d
    | (c, m)::l -> String.concat "" (construct_strings_simple c m l d)
and toStringMonomialSimple mon =
  String.concat "*" (List.map (fun (x, c) -> getPowerSimple x c) mon)
and getPowerSimple x c =
  if c = 0 then
    ""
  else if c = 1 then
    x
  else
    x ^ "*" ^ (getPowerSimple x (c - 1))
and construct_strings_simple c m l d =
  ( ((my_string_of_big_int c) ^ (toStringMonomialSimple m)) ::
    (List.map (fun (c', mon') -> (if (Big_int.lt_big_int c' Big_int.zero_big_int) then " - " else " + ") ^
                                 (my_string_of_big_int (Big_int.abs_big_int c')) ^ (toStringMonomialSimple mon'))
              l) ) @
  [ (if (eq_big_int d Big_int.zero_big_int) then "" else
    (if (Big_int.lt_big_int d Big_int.zero_big_int) then " - " else " + ") ^ (Big_int.string_of_big_int (Big_int.abs_big_int d))) ]

(* Replace coefficients by their absolute values *)
let abs (l, d) =
  (List.map (fun (c, m) -> (Big_int.abs_big_int c, m)) l, Big_int.abs_big_int d)

(* Transforms a polynomial to SMT format *)
let rec toSMT (l, d) =
  match l with
    | [] -> const_to_string d
    | xs -> let summands' = if eq_big_int d Big_int.zero_big_int then [] else [(const_to_string d)] in
              let summands = summands' @ (List.map toSMTone xs) in
                if List.length summands > 1 then
                  "(+ " ^ (String.concat " " summands) ^ ")"
                else
                  List.hd summands
and toSMTone (c, mon) =
  let prods = List.flatten (List.map expand mon) in
    if eq_big_int c (Big_int.unit_big_int) then
      toSMTprods prods
    else if eq_big_int c (Big_int.minus_big_int Big_int.unit_big_int) then
      "(~ " ^ (toSMTprods prods) ^ ")"
    else
      toSMTprods ((const_to_string c)::prods)
and toSMTprods prods =
  if List.length prods > 1 then
    "(* " ^ (String.concat " " prods) ^ ")"
  else
    List.hd prods
and expand (x, p) =
  if p = 0 then
    []
  else
    x::(expand (x, p - 1))
and const_to_string d =
  let isNeg = Big_int.lt_big_int d Big_int.zero_big_int in
    (if isNeg then "(- " else "") ^ (Big_int.string_of_big_int (Big_int.abs_big_int d)) ^ (if isNeg then ")" else "")

(* Renames a polynomial *)
let rec renameVars varmapping (poly, d) =
  (List.map (fun (c, mon) -> (c, renameMonomial varmapping mon)) poly, d)
and renameMonomial varmapping mon =
  List.map (fun (x, p) -> (getNewVarName varmapping x, p)) mon
and getNewVarName varmapping x =
  match varmapping with
    | [] -> x
    | (y, z)::vv -> if x == y || x = y then
                      z
                    else
                      getNewVarName vv x

(* Get the variables from a polynomial *)
let rec getVars (poly, _) =
  Utils.remdup (List.flatten (List.map (fun (_, mon) -> getVarsMonomial mon) poly))
and getVarsMonomial mon =
  List.map (fun (x, _) -> x) mon

(* Multiply a polynomial by a constant *)
let constmult (poly, c) d =
  if eq_big_int d Big_int.zero_big_int then
    ([], Big_int.zero_big_int)
  else
    (List.map (fun (c, mon) -> (Big_int.mult_big_int c d, mon)) poly, Big_int.mult_big_int c d)

(* Adds two polynomials *)
let rec add (poly1, c1) (poly2, c2) =
  let p = remove_null (merge (poly1 @ poly2)) in
    (p, Big_int.add_big_int c1 c2)
and remove_null =
  List.filter (fun (c, mon) -> (not (eq_big_int c Big_int.zero_big_int)))

(* Subtract a polynomial from a polynomial *)
let minus poly1 poly2 =
  add poly1 (constmult poly2 (Big_int.minus_big_int Big_int.unit_big_int))

(* Negate a polynomial *)
let negate poly =
  constmult poly (Big_int.minus_big_int Big_int.unit_big_int)

(* Multiply two polynomials *)
let rec mult (poly1, c1) (poly2, c2) =
  let pp = construct_poly (List.flatten (List.map (monomialmult poly1) poly2))
  and cp = constmult (poly2, Big_int.zero_big_int) c1
  and pc = constmult (poly1, Big_int.zero_big_int) c2
  and cc = ([], Big_int.mult_big_int c1 c2) in
    add pp (add cp (add pc cc))
and monomialmult poly mon =
  List.map (momomu mon) poly
and momomu (c1, mon1) (c2, mon2) =
  normMonomial (Big_int.mult_big_int c1 c2, mon1 @ mon2)

(* Pow of a polynomial with a constant *)
let rec pow p d =
  let list = Utils.getCopies p (Big_int.int_of_big_int d) in
    List.fold_left mult one list

(* Instantiates variables in a polynomial *)
let rec instantiate (poly, c) bindings =
  let (p, c') = List.fold_left add zero (List.map (fun mmon -> instantiate_monomial mmon bindings one) poly) in
    (p, Big_int.add_big_int c c')
and instantiate_monomial (c, mon) bindings accu =
  match mon with
    | [] -> constmult accu c
    | (x, 0)::l -> instantiate_monomial (c, l) bindings accu
    | (x, p)::l -> instantiate_monomial (c, (x, p - 1)::l) bindings (mult accu (safeAssoc x bindings))
and safeAssoc x bindings =
  match bindings with
    | [] -> fromVar x
    | (y, p)::rest -> if x == y || x = y then
                        p
                      else
                        safeAssoc x rest

(* Evaluate an int_term for a given variable assignment *)
let rec evaluate (poly, c) assignment =
  Big_int.add_big_int (evaluate_aux poly assignment Big_int.zero_big_int) c
and evaluate_aux poly assignment accu =
   match poly with
    | [] -> accu
    | (c, mon)::l -> evaluate_aux l assignment (Big_int.add_big_int accu (Big_int.mult_big_int c (evaluate_mono mon assignment)))
and evaluate_mono mon assignment =
  match mon with
    | [] -> Big_int.unit_big_int
    | (x, p)::l -> Big_int.mult_big_int (power (myAssoc x assignment) p) (evaluate_mono l assignment)
and power x p =
  if p = 0 then
    Big_int.unit_big_int
  else
    Big_int.mult_big_int x (power x (p - 1))
and myAssoc x assignment =
  match assignment with
    | [] -> raise Not_found
    | (y, v)::rest  -> if x == y || x = y then
                         v
                       else
                         myAssoc x rest

(* Replace variable powers *)
let rec replaceVarPower (poly, c) (x, i) q =
  let (p, c') = List.fold_left add ([], Big_int.zero_big_int) (List.map (fun mmon -> instantiate_monomial_power mmon (x, i) q ([], Big_int.unit_big_int)) poly) in
    (p, Big_int.add_big_int c c')
and instantiate_monomial_power (c, mon) (x, i) q accu =
  match mon with
    | [] -> constmult accu c
    | (y, 0)::l -> instantiate_monomial_power (c, l) (x, i) q accu
    | (y, p)::l -> if (x == y || x = y) && p >= i then
                     instantiate_monomial_power (c, (y, p - i)::l) (x, i) q (mult accu q)
                   else
                     instantiate_monomial_power (c, l) (x, i) q (mult accu ([(Big_int.unit_big_int, [(y, p)])], Big_int.zero_big_int))

(* compute (mixed) degree *)
let rec getDegree (pol, c) =
  match (List.map getDegreeMono (List.map snd pol)) with
    | [] -> 0
    | d::ds -> List.fold_left max d ds
and getDegreeMono mon =
  List.fold_left (+) 0 (List.map snd mon)

let rec max (pol, c) (pol', c') =
  (getMaxMonos (pol, c) (pol', c'), Big_int.max_big_int c c')
and getMaxMonos (pol, c) (pol', c') =
  let monos = Utils.remdup ((List.map snd pol) @ (List.map snd pol')) in
    List.map (getMaxCoeff (pol, c) (pol', c')) monos
and getMaxCoeff (pol, c) (pol', c') mon =
  (Big_int.max_big_int (getCoeff (pol, c) mon) (getCoeff (pol', c') mon), mon)
