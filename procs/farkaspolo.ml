(*
  Polynomial interpretations using Farkas' lemma

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

let lambda_count = ref 0
let all_lambdas = ref []

(* Find a polynomial interpretation *)
let rec process trs tgraph isScc =
  if trs = [] then
    None
  else
  (
    lambda_count := 0;
    all_lambdas := [];
    let (abs, params) = Polo.create_poly_map 1 trs in
      let cwbs = convert_rules_to_leqs trs abs Big_int.zero_big_int in
        let weak = List.map getWeak cwbs
        and bound = List.map getBound cwbs in
          let strictDecrease = List.map getStrict weak in
            let strict = combine bound strictDecrease
            and vars = params @ !all_lambdas in
              match Smt.isSatisfiableFarkasPolo (List.flatten weak) strict vars with
                | None -> None
                | Some model ->
                  (
                    let model' = Polo.fix_model model params in
                      let (ntrs, junk) = get_new_trs trs strict model' in
                        Some ([(ntrs, Termgraph.removeNodes tgraph junk, false)], fun i alli -> Polo.getProof i alli ntrs trs (Polo.get_concrete_poly abs model'))
                  )
  )

(* get <= constraints *)
and convert_rules_to_leqs trs abs lowerbound =
  List.map (fun r -> convert_rule_to_leqs r abs lowerbound) trs
and convert_rule_to_leqs r abs lowerbound =
  let (lhs, rhs, cond) = (Rule.getLeft r, Rule.getRight r, Rule.getCond r) in
  let lpol = List.assoc (Term.getFun lhs) abs
  and rpol = List.assoc (Term.getFun rhs) abs in
    let lpolinst = Parapoly.instantiate lpol (Polo.getInstBin (Term.getFun lhs) (Term.getArgs lhs) 1)
    and rpolinst = Parapoly.instantiate rpol (Polo.getInstBin (Term.getFun rhs) (Term.getArgs rhs) 1) in
      (
        convert_constraint_to_leqs (Pc.dropNonLinearAtoms cond),
        Parapoly.negate (Parapoly.minus lpolinst rpolinst),
        Parapoly.add (Parapoly.negate lpolinst) ([], ([], lowerbound))
    )
and convert_constraint_to_leqs c =
  List.flatten (List.map Pc.getLeqZeroTerms c)

(* get farkas conditions for satisfying w *)
and getWeak (c, w, _) =
  let cvars = Utils.remdup (List.flatten (List.map Poly.getVars c))
  and (linear, nonlinear) = splitPolo w in
    (List.map get_coeff_zero nonlinear) @ (get_farkas_conditions c cvars linear)
and splitPolo (monos, d) =
  let (linearMonos, nonlinearMonos) = splitMonos monos in
    ((linearMonos, d), nonlinearMonos)
and splitMonos monos =
  match monos with
    | [] -> ([], [])
    | m::more -> let (tmp1, tmp2) = splitMonos more in
                   if (Parapoly.isUnivariateLinearMonomial m) then
                     (m::tmp1, tmp2)
                   else
                     (tmp1, m::tmp2)
and get_coeff_zero (pp, _) =
  Pc.Equ (pp, ([], Big_int.zero_big_int))
and get_farkas_conditions c cvars p =
  incr lambda_count;
  let lambdas = getLambdas c 1
  and vars = Utils.remdup (cvars @ (Parapoly.getVars p)) in
    (List.map (fun lambda -> Pc.Geq (lambda, ([], Big_int.zero_big_int))) lambdas) @
    (List.map (get_farkas_condition_for_var lambdas c p) vars) @
    [get_farkas_condition_for_constant lambdas c (Parapoly.getConstant p)]
and getLambdas c i =
  match c with
    | [] -> []
    | cc::c' -> (getLambda !lambda_count i)::(getLambdas c' (i + 1))
and getLambda i j =
  let name = "LAMBDA_" ^ (string_of_int i) ^ "_" ^ (string_of_int j) in
    all_lambdas := name::!all_lambdas;
    Poly.fromVar name
and get_farkas_condition_for_constant lambdas c d =
  Pc.Leq (d, sum_const_column c lambdas)
and sum_const_column c lambdas =
  match c with
    | [] -> ([], Big_int.zero_big_int)
    | cc::c' -> let rest = sum_const_column c' (List.tl lambdas) in
                  Poly.add (Poly.constmult (List.hd lambdas) (Poly.getConstant cc)) rest
and get_farkas_condition_for_var lambdas c p v =
  let vmon = [(v, 1)] in
    Pc.Equ (Parapoly.getCoeff p vmon, sum_var_column c vmon lambdas)
and sum_var_column c vmon lambdas =
  match c with
    | [] -> ([], Big_int.zero_big_int)
    | cc::c' -> let rest = sum_var_column c' vmon (List.tl lambdas) in
                  Poly.add (Poly.constmult (List.hd lambdas) (Poly.getCoeff cc vmon)) rest

(* get farkas conditions for satisfying b *)
and getBound (c, _, b) =
  let cvars = Utils.remdup (List.flatten (List.map Poly.getVars c)) in
    get_farkas_conditions c cvars b

(* get farkas conditions for strictly smaller *)
and getStrict weak =
  let const_cond = (Utils.last weak) in
    [convert_leq_to_lss const_cond]
and convert_leq_to_lss c =
  match c with
    | Pc.Leq (l, r) -> Pc.Lss (l, r)
    | _ -> failwith "Internal error in Farkaspolo.convert_leq_to_lss"

(* combine *)
and combine bound strictDecrease =
  match bound with
    | [] -> []
    | b::bb -> (b @ (List.hd strictDecrease))::(combine bb (List.tl strictDecrease))

(* return new trs *)
and get_new_trs trs strict model =
  match trs with
    | [] -> ([], [])
    | ru::rus -> let (res, junk) = get_new_trs rus (List.tl strict) model in
                   if isStrict (List.hd strict) model then
                     (res, ru::junk)
                   else
                     (ru::res, junk)
and isStrict strict model =
  try
    Pc.isTrue strict model
  with
    | Not_found -> false
