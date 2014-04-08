(*
  Polynomial interpretations using Farkas' lemma for exponential runtime

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

let first (x, _, _) =
  x
and second (_, c, _) =
  c

(* Find a polynomial interpretation *)
let rec process degree (rcc, g) tgraph rvgraph =
  if degree < 0 || degree > 1 || Cintprob.isSolved rcc then
    None
  else
  (
    let vars = Cintfarkaspolo.getVars rcc
    and r = List.map first rcc
    and s = List.map first (List.filter (fun (_, c, _) -> c = Complexity.Unknown) rcc) in
      Farkaspolo.lambda_count := 0;
      Farkaspolo.all_lambdas := [];
      let toOrient = r in
        let (abs, params) = Cintfarkaspolo.create_poly_map toOrient in
          let cwbs = get_cwbs toOrient abs in
            let cwbs_for_unknowns = Cintfarkaspolo.getOnlyFor cwbs toOrient s in
              let weak = List.map Cintfarkaspolo.getAllWeak cwbs
              and bound = List.map Cintfarkaspolo.getAllBound cwbs_for_unknowns in
                let strictDecrease = List.map Cintfarkaspolo.getAllStrict (Cintfarkaspolo.getOnlyFor weak toOrient s) in
                  let strict = Farkaspolo.combine bound (List.map List.flatten strictDecrease)
                  and allparams = params @ !Farkaspolo.all_lambdas in
                    let res = Smt.isSatisfiableFarkasPolo (List.flatten (List.flatten weak)) strict allparams in
                      match res with
                        | None -> None
                        | Some model ->
                          (
                            let model' = Polo.fix_model model params in
                              let conc = Polo.get_concrete_poly abs model' in
                                let c = getC conc rcc g vars in
                                  let nrcc = Cintfarkaspolo.annotate rcc s strict model' c
                                  and ng = g
                                  and ntgraph = tgraph
                                  and nrvgraph = rvgraph in
                                    if Cintfarkaspolo.equal rcc nrcc then
                                      None
                                    else
                                      Some (((nrcc, g), ntgraph, nrvgraph), fun ini outi -> getProof ini outi (rcc, g) (nrcc, ng) conc toOrient vars)
                          )
  )

and get_cwbs toOrient abs =
  List.map (fun r -> convert_rule_to_leqs r abs) toOrient
and convert_rule_to_leqs (l, rs, c) abs =
  let lpol = List.assoc (Term.getFun l) abs
  and rpols = List.map (fun r -> List.assoc (Term.getFun r) abs) rs in
    let lpolinst = Parapoly.instantiate lpol (Polo.getInstBin (Term.getFun l) (Term.getArgs l) 1)
    and rpolinsts = List.map2 (fun r rpol -> Parapoly.instantiate rpol (Polo.getInstBin (Term.getFun r) (Term.getArgs r) 1)) rs rpols in
      (
        Farkaspolo.convert_constraint_to_leqs (Pc.dropNonLinearAtoms c),
        List.map (fun rpolinst -> Parapoly.negate (Parapoly.minus lpolinst rpolinst)) rpolinsts,
        Parapoly.add (Parapoly.negate lpolinst) ([], ([], Big_int.unit_big_int))
      )

and getC conc rcc g vars =
  (* TODO: check correctness of this... *)
  let pol_g = Expexp.fromPoly (List.assoc g conc)
  and k = get_max_arity rcc in
    let pol_g_plus_one = Expexp.add pol_g Expexp.one in
      let k_pow_pol_g_plus_one = Expexp.Exp (Expexp.fromConstant (Big_int.big_int_of_int k), pol_g_plus_one) in
        let k_pow_pol_g_plus_one_minus_one = Expexp.Sum (k_pow_pol_g_plus_one, Expexp.negate Expexp.one) in
          let res = k_pow_pol_g_plus_one_minus_one in
            Complexity.P (Expexp.abs (Expexp.instantiate res (Cintfarkaspolo.getBindings vars 1)))
and get_max_arity rcc =
  List.fold_left max 0 (List.map (fun (r, _, _) -> List.length (Comrule.getRights r)) rcc)

and getProof ini outi rccg nrccg pol toOrient vars =
  let newlybound = List.filter (Cintfarkaspolo.isNewlyBound (fst rccg)) (fst nrccg) in
    let more = (List.length newlybound) <> 1 in
      "A polynomial rank function for exponential bounds with\n" ^
      (Cintfarkaspolo.pol_to_string pol) ^ "\n" ^
      "orients all transitions weakly and the " ^ (if more then "transitions" else "transition") ^ "\n" ^
      (Cint.toStringPrefix "\t" (List.map first newlybound)) ^ "\n" ^
      "strictly and produces the following problem:\n" ^
      (Cintprob.toStringGNumber nrccg outi)
