(*
  Stuff for integer exponential expressions

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

(* Exponential expressions *)
type expexp = Pol of Poly.poly | Sum of expexp * expexp | Mul of expexp * expexp | Exp of expexp * expexp

let eq_big_int b1 b2 =
  (b1 == b2) || (Big_int.eq_big_int b1 b2)

let zero = Pol (Poly.zero)
let one = Pol (Poly.one)

(* Construct a string for an expexp *)
let rec toString e =
  match e with
    | Pol p -> Poly.toString p
    | Sum (e1, e2) -> "(" ^ (toString e1) ^ ") + (" ^ (toString e2) ^ ")"
    | Mul (e1, e2) -> "(" ^ (toString e1) ^ ") * (" ^ (toString e2) ^ ")"
    | Exp (e1, e2) -> "(" ^ (toString e1) ^ ")^(" ^ (toString e2) ^ ")"

(* equality comparison *)
let rec equal e1 e2 =
  e1 == e2 || equalInternal e1 e2
and equalInternal e1 e2 =
  match (e1, e2) with
    | (Pol p1, Pol p2) -> Poly.equal p1 p2
    | (Sum (e1, e2), Sum (e3, e4)) -> equal e1 e3 && equal e2 e4
    | (Mul (e1, e2), Mul (e3, e4)) -> equal e1 e3 && equal e2 e4
    | (Exp (e1, e2), Exp (e3, e4)) -> equal e1 e3 && equal e2 e4
    | _ -> false

let rec isConst e =
  match e with
    | Pol p -> Poly.isConst p
    | _ -> false

let rec getConstant e =
  match e with
    | Pol p -> Poly.getConstant p
    | Sum (e1, e2) -> Big_int.add_big_int (getConstant e1) (getConstant e2)
    | Mul (e1, e2) -> Big_int.mult_big_int (getConstant e1) (getConstant e2)
    | Exp (p, e) -> Big_int.zero_big_int

let rec normalize e =
  match e with
    | Pol _ -> e
    | _ -> let distr = distribute e in
             let summands = getSummands distr in
               let norm_summands = normalizeSummands summands Poly.zero in
                 let res = sumup norm_summands in
                   res
and distribute e =
  match e with
    | Pol _ -> e
    | Sum (e1, e2) -> Sum (distribute e1, distribute e2)
    | Mul (Sum (e1, e2), e3) -> Sum (distribute (Mul (e1, e3)), distribute (Mul (e2, e3)))
    | Mul (e1, Sum (e2, e3)) -> Sum (distribute (Mul (e1, e2)), distribute (Mul (e1, e3)))
    | Mul (e1, e2) -> let e1' = distribute e1
                      and e2' = distribute e2 in
                      (
                        match (e1', e2') with
                          | (Sum (e1'', e2''), e3'') -> Sum (distribute (Mul (e1'', e3'')), distribute (Mul (e2'', e3'')))
                          | (e1'', Sum (e2'', e3'')) -> Sum (distribute (Mul (e1'', e2'')), distribute (Mul (e1'', e3'')))
                          | (e1'', e2'') -> Mul (e1'', e2'')
                      )
    | Exp (e1, e2) -> Exp (distribute e1, distribute e2)
and getSummands e =
  match e with
    | Pol _ -> [e]
    | Sum (e1, e2) -> (getSummands e1) @ (getSummands e2)
    | Mul _ -> [e]
    | Exp _ -> [e]
and normalizeSummands summands accu =
  match summands with
    | [] -> [Pol accu]
    | s::rest ->
      (
        match s with
          | Pol p -> normalizeSummands rest (Poly.add accu p)
          | Sum _ -> failwith "Internal error in normalizeSummands!"
          | Mul (e1, e2) -> let e1' = normalize e1
                            and e2' = normalize e2 in
                              let mul = simplifyMul e1' e2' in
                              (
                                match mul with
                                  | Pol p -> normalizeSummands rest (Poly.add accu p)
                                  | _ -> mul::(normalizeSummands rest accu)
                              )
          | Exp (e1, e2) -> let e1' = normalize e1
                            and e2' = normalize e2 in
                              let exp = simplifyExp e1' e2' in
                              (
                                match exp with
                                  | Pol p -> normalizeSummands rest (Poly.add accu p)
                                  | _ -> exp::(normalizeSummands rest accu)
                              )
      )
and sumup summands =
  let constantPart = Utils.last summands
  and rest = (Utils.dropLast summands) in
    if rest = [] then
      constantPart
    else
      let sum = sumupAux rest in
        if equal constantPart zero then
          sum
        else
          Sum (sum, constantPart)
and sumupAux summands =
  match summands with
    | [] -> zero
    | [x] -> x
    | x::rest -> Sum (x, sumup rest)
and simplifyMul e1' e2' =
  let prods = getMultiplicants (Mul (e1', e2')) in
    mulup (normalizeMultiplicants prods Poly.one)
and normalizeMultiplicants prods accu =
  match prods with
    | [] -> [Pol accu]
    | s::rest ->
      (
        match s with
          | Pol p -> normalizeMultiplicants rest (Poly.mult accu p)
          | Sum (e1, e2) -> failwith "Internal error in normalizeMultiplicants!"
          | Mul (e1, e2) -> failwith "Internal error in normalizeMultiplicants!"
          | Exp (e1, e2) -> let e1' = normalize e1
                            and e2' = normalize e2 in
                              let exp = simplifyExp e1' e2' in
                              (
                                match exp with
                                  | Pol p -> normalizeMultiplicants rest (Poly.mult accu p)
                                  | _ -> exp::(normalizeMultiplicants rest accu)
                              )
      )
and getMultiplicants e =
  match e with
    | Pol _ -> [e]
    | Sum _ -> [e]
    | Mul (e1, e2) -> (getMultiplicants e1) @ (getMultiplicants e2)
    | Exp _ -> [e]
and mulup prods =
  let constantPart = Utils.last prods
  and rest = Utils.dropLast prods in
    if rest = [] then
      constantPart
    else if equal constantPart zero then
      zero
    else
      let mul = mulupAux rest in
        if equal constantPart one then
          mul
        else
          Mul (mul, constantPart)
and mulupAux prods =
  match prods with
    | [] -> one
    | [x] -> x
    | x::rest -> Mul (x, mulup rest)
and simplifyExp e1' e2' =
  if equal e2' zero then
    one
  else if equal e2' one then
    e1'
  else if equal e1' zero then
    zero
  else if equal e1' one then
    one
  else
    Exp (e1', e2')

(* Adds two expexps *)
let rec add e1 e2 =
  match (e1, e2) with
    | (Pol p, Pol q) -> Pol (Poly.add p q)
    | _ -> normalize (Sum (e1, e2))

(* Multiply an expexp by a constant *)
let rec constmult e d =
  if eq_big_int d Big_int.zero_big_int then
    zero
  else
    match e with
      | Pol p -> Pol (Poly.constmult p d)
      | Sum (e1, e2) -> normalize (Sum (constmult e1 d, constmult e2 d))
      | Mul (e1, e2) -> normalize (Mul (constmult e1 d, e2))
      | Exp (e1, e2) -> normalize (Mul (Pol (Poly.fromConstant d), e))

(* Subtract an expexp from an expexp *)
let minus e1 e2 =
  add e1 (constmult e2 (Big_int.minus_big_int Big_int.unit_big_int))

(* Negate an expexp *)
let negate e =
  constmult e (Big_int.minus_big_int Big_int.unit_big_int)

(* Multiplies two expexps *)
let mult e1 e2 =
  match (e1, e2) with
    | (Pol p, Pol q) -> Pol (Poly.mult p q)
    | _ -> normalize (Mul (e1, e2))

let fromConstant c =
  Pol (Poly.fromConstant c)

let fromVar v =
  Pol (Poly.fromVar v)

let fromPoly p =
  Pol p

let toPoly e =
  match e with
    | Pol p -> p
    | _ -> failwith "Cannot convert Expexp to Poly!"

let rec getVars e =
  match e with
    | Pol p -> Poly.getVars p
    | Sum (e1, e2) -> Utils.remdup ((getVars e1) @ (getVars e2))
    | Mul (e1, e2) -> Utils.remdup ((getVars e1) @ (getVars e2))
    | Exp (e1, e2) -> Utils.remdup ((getVars e1) @ (getVars e2))

let isSumOfVarsPlusConstant e =
  match e with
    | Pol p -> Poly.isSumOfVarsPlusConstant p
    | _ -> false

let isScaledSumOfVarsPlusConstant e =
  match e with
    | Pol p -> Poly.isScaledSumOfVarsPlusConstant p
    | _ -> false

let getScaleFactor e =
  match e with
    | Pol p -> Poly.getScaleFactor p
    | _ -> failwith "Cannot get scale factor!"

let rec abs e =
  match e with
    | Pol p -> Pol (Poly.abs p)
    | Sum (e1, e2) -> Sum (abs e1, abs e2)
    | Mul (e1, e2) -> Mul (abs e1, abs e2)
    | Exp (e1, e2) -> Exp (abs e1, abs e2)

let rec instantiate e map =
  match e with
    | Pol p -> let polmap = getPolMap map in
               (
                 match polmap with
                   | None -> normalize (instantiateAux e map)
                   | Some pm -> Pol (Poly.instantiate p pm)
               )
    | _ -> normalize (instantiateAux e map)
and getPolMap map =
  getPolMapAux map []
and getPolMapAux map accu =
  match map with
    | [] -> Some accu
    | (x, e)::rest -> (
                        match e with
                          | Pol p -> getPolMapAux rest ((x, p)::accu)
                          | _ -> None
                      )
and instantiateAux e map =
  match e with
    | Pol p -> instantiateAuxPol p map
    | Sum (e1, e2) -> Sum (instantiate e1 map, instantiate e2 map)
    | Mul (e1, e2) -> Mul (instantiate e1 map, instantiate e1 map)
    | Exp (e1, e2) -> Exp (instantiate e1 map, instantiate e2 map)
and instantiateAuxPol (monos, c) map =
  let tmp = (List.map (instantiateAuxMono map) monos) @ [fromConstant c] in
    List.fold_left (fun e1 e2 -> Sum (e1, e2)) (Pol Poly.zero) tmp
and instantiateAuxMono map (c, xp) =
  let tmp = (fromConstant c)::(List.map (instantiateAuxVarPower map) xp) in
    List.fold_left (fun e1 e2 -> Mul (e1, e2)) (Pol Poly.one) tmp
and instantiateAuxVarPower map (x, i) =
  try
    let value = List.assoc x map in
      let tmp = Utils.getCopies value i in
        List.fold_left (fun e1 e2 -> Mul (e1, e2)) (Pol Poly.one) tmp
  with
    | Not_found -> Pol (Poly.fromVarPower x i)

let rec max e1 e2 =
  match (e1, e2) with
    | (Pol p, Pol q) -> Pol (Poly.max p q)
    | _ -> let e1' = normalize (distribute e1)
           and e2' = normalize (distribute e2) in
             normalize (getMax e1' e2')
and getMax e1' e2' =
  let s1 = getSummands e1'
  and s2 = getSummands e2' in
    let s = remdup (s1 @ s2) in
      List.fold_left (fun e1 e2 -> Sum (e1, e2)) (Pol Poly.zero) s
and remdup s =
  match s with
    | [] -> []
    | e::rest -> e::(remdup (List.filter (fun e' -> not (equal e e')) rest))
