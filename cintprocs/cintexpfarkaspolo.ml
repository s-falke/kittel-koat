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

module CTRSObl = Ctrsobl.Make(Comrule)
module CTRS = CTRSObl.CTRS
module RVG = Rvgraph.Make(Comrule)
module GSC = GlobalSizeComplexity.Make(Comrule)
module LSC = GSC.LSC
module TGraph = Tgraph.Make(Comrule)

open CTRSObl
open CTRS

(* Find a polynomial interpretation *)
let rec process ctrsobl tgraph rvgraph =
  if CTRSObl.isSolved ctrsobl then
    None
  else
  (
    Log.log (Printf.sprintf "Trying (Farkas-based) processor for exponential RFs ...");
    let allCandidates = Cintfarkaspolo.getRuleSubsetsToOrient tgraph ctrsobl false in
    Cfarkaspolo.findFirst (tryOneS ctrsobl tgraph rvgraph) allCandidates;
  )
and tryOneS ctrsobl tgraph rvgraph s =
  Farkaspolo.lambda_count := 0;
  Farkaspolo.all_lambdas := [];
  let toOrient = ctrsobl.ctrs.rules in
  let (abs, params) = Cintfarkaspolo.create_poly_map toOrient in
  let cwbs_with_rules = get_cwbs toOrient abs in
  let cwbs_with_rules_for_unknowns = Cintfarkaspolo.getOnlyFor cwbs_with_rules toOrient s in
  let weak_with_rules = List.map Cintfarkaspolo.getAllWeak cwbs_with_rules in
  let bound_with_rules = List.map Cintfarkaspolo.getAllBound cwbs_with_rules_for_unknowns in
  let strictDecrease_with_rules = List.map Cintfarkaspolo.getAllStrict (Cintfarkaspolo.getOnlyFor weak_with_rules toOrient s) in
  let boundedAndStrict_with_rules =
    List.map2
      (fun (rB, b) (rS, ss) ->
        assert(Comrule.equal rB rS);
        (rB, b @ (List.flatten ss)))
      bound_with_rules strictDecrease_with_rules
  in
  let allparams = params @ !Farkaspolo.all_lambdas in
  let res = Smt.isSatisfiableFarkasPolo (List.flatten (Utils.concatMap snd weak_with_rules)) (List.map snd boundedAndStrict_with_rules) allparams in
  match res with
  | None -> None
  | Some model ->
    (
      let model' = Polo.fix_model model params in
      let conc = Polo.get_concrete_poly abs model' in
      let c = getC conc ctrsobl in
      let nctrsobl = Cintfarkaspolo.annotate ctrsobl boundedAndStrict_with_rules model' c in
      if CTRSObl.haveSameComplexities ctrsobl nctrsobl then
        None
      else
        (
          if Log.do_debug () then
            Log.debug ("Found the following PRF:\n" ^ (Cintfarkaspolo.pol_to_string conc));
          Log.log (Printf.sprintf "ExpRF synthesis successful, proven complexity %s." (Complexity.toString c));
          Some ((nctrsobl, tgraph, rvgraph), getProof ctrsobl nctrsobl conc toOrient)
        )
    )


and get_cwbs toOrient abs =
  List.map (fun r -> (r, convert_rule_to_leqs r abs)) toOrient
and convert_rule_to_leqs rule abs =
  let lhs = Comrule.getLeft rule in
  let rhss = Comrule.getRights rule in
  let cond = Comrule.getCond rule in
  let lpol = List.assoc (Term.getFun lhs) abs
  and rpols = List.map (fun rhs -> List.assoc (Term.getFun rhs) abs) rhss in
  let lpolinst = Parapoly.instantiate lpol (Polo.getInstBin (Term.getFun lhs) (Term.getArgs lhs) 1)
  and rpolinsts = List.map2 (fun rhs rpol -> Parapoly.instantiate rpol (Polo.getInstBin (Term.getFun rhs) (Term.getArgs rhs) 1)) rhss rpols in
  (
    Farkaspolo.convert_constraint_to_leqs (Pc.dropNonLinearAtoms cond),
    List.map (fun rpolinst -> Parapoly.negate (Parapoly.minus lpolinst rpolinst)) rpolinsts,
    Parapoly.add (Parapoly.negate lpolinst) ([], ([], Big_int.unit_big_int))
  )

and getC conc ctrsobl =
  (* TODO: check correctness of this... *)
  let pol_startFun = Expexp.fromPoly (List.assoc ctrsobl.ctrs.startFun conc) in
  let b = get_max_rhs_arity ctrsobl.ctrs.rules in
  let powterm = getPowTerm b pol_startFun in
  let varBindings = Utils.mapi (fun i v -> ("X_" ^ (string_of_int (i + 1)), Expexp.fromVar v)) (CTRS.getVars ctrsobl.ctrs) in
  Complexity.P (Expexp.abs (Expexp.instantiate powterm varBindings))
and getPowTerm b pol =
  (* Bound should be b * (b^pol - 1))/(b-1). We approximate as b^(pol + 1). *)
  let pol_plus_one = Expexp.add pol Expexp.one in
  Expexp.exp (Expexp.fromConstant (Big_int.big_int_of_int b)) pol_plus_one
and get_max_rhs_arity rules =
  List.fold_left max 0 (List.map (fun r -> List.length (Comrule.getRights r)) rules)

and getProof oldctrsobl newctrsobl pol toOrient ini outi =
  let newlybound = List.filter (fun rule -> not (CTRSObl.hasUnknownComplexity newctrsobl rule)) (CTRSObl.getUnknownComplexityRules oldctrsobl) in
  let moreThanOne = (List.length newlybound) <> 1 in
  "A polynomial rank function for exponential bounds with\n" ^
    (Cintfarkaspolo.pol_to_string pol) ^ "\n" ^
    "orients all transitions weakly and the " ^ (if moreThanOne then "transitions" else "transition") ^ "\n" ^
    (Comrule.listToStringPrefix "\t" newlybound) ^ "\n" ^
    "strictly and produces the following problem:\n" ^
    (CTRSObl.toStringNumber newctrsobl outi)
