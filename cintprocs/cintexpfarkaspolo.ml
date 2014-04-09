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

module CTRS = Ctrs.Make(Comrule)
module RVG = Rvgraph.Make(Comrule)
module LSC = LocalSizeComplexity.Make(Comrule)
module GSC = GlobalSizeComplexity.Make(Comrule)
module TGraph = Tgraph.Make(Comrule)

let first (x, _, _) =
  x

(* Find a polynomial interpretation *)
let rec process degree (rcc, g, l) tgraph rvgraph =
  if degree < 0 || degree > 1 || CTRS.isSolved rcc then
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
                                  and nl = l
                                  and ntgraph = tgraph
                                  and nrvgraph = rvgraph in
                                    if Cintfarkaspolo.equal rcc nrcc then
                                      None
                                    else
                                      Some (((nrcc, ng, nl), ntgraph, nrvgraph), fun ini outi -> getProof ini outi (rcc, g, l) (nrcc, ng, nl) conc toOrient vars)
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
    let powterm = getPowTerm k pol_g in
      let powterm_minus_one = Expexp.minus powterm Expexp.one in
        Complexity.P (Expexp.abs (Expexp.instantiate powterm_minus_one (Cintfarkaspolo.getBindings vars 1)))
and getPowTerm k pol =
  if k = 2 then
    let pol_plus_one = Expexp.add pol Expexp.one in
      let k_pow_pol_plus_one = Expexp.exp (Expexp.fromConstant (Big_int.big_int_of_int 2)) pol_plus_one in
        k_pow_pol_plus_one
  else
    let k_pow_pol = Expexp.exp (Expexp.fromConstant (Big_int.big_int_of_int k)) pol in
      let twice_k_pow_pol = Expexp.mult (Expexp.fromConstant (Big_int.big_int_of_int 2)) k_pow_pol in
        twice_k_pow_pol
and get_max_arity rcc =
  List.fold_left max 0 (List.map (fun (r, _, _) -> List.length (Comrule.getRights r)) rcc)

and getProof ini outi rccgl nrccgl pol toOrient vars =
  let newlybound = List.filter (Cintfarkaspolo.isNewlyBound (first rccgl)) (first nrccgl) in
    let more = (List.length newlybound) <> 1 in
      "A polynomial rank function for exponential bounds with\n" ^
      (Cintfarkaspolo.pol_to_string pol) ^ "\n" ^
      "orients all transitions weakly and the " ^ (if more then "transitions" else "transition") ^ "\n" ^
      (CTRS.toStringPrefix "\t" newlybound) ^ "\n" ^
      "strictly and produces the following problem:\n" ^
      (CTRS.toStringGNumber nrccgl outi)
