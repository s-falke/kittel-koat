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

let rec getOnlyFor xx r s =
  match xx with
    | [] -> []
    | x::xs -> let rule = List.hd r in
                 if (Cint.contains s rule) then
                   x::(getOnlyFor xs (List.tl r) s)
                 else
                   getOnlyFor xs (List.tl r) s

let first (x, _, _) =
  x
and second (_, c, _) =
  c

(* Find a polynomial interpretation *)
let rec process useSizeComplexities degree (rcc, g) tgraph rvgraph =
  if degree < 0 || degree > 1 || Cintprob.isSolved rcc then
    None
  else
  (
    let vars = getVars rcc in
      let globalSizeComplexities = if useSizeComplexities then Cintrvgraph.computeGlobalSizeComplexities (Cfarkaspolo.getOut rvgraph) rcc g vars else [] in
        let r = List.map first rcc
        and s = if useSizeComplexities then (constructAllS (getS4SizeComplexities tgraph rcc)) else [(List.map first (List.filter (fun (_, c, _) -> c = Complexity.Unknown) rcc))] in
          doLoop useSizeComplexities degree (rcc, g) tgraph rvgraph vars globalSizeComplexities r s
  )
and constructAllS s =
  match s with
    | [] -> [[]]
    | e::rest -> let tmp = constructAllS rest in
                   List.flatten (List.map (fun l -> [e::l; l]) tmp)
and doLoop useSizeComplexities degree (rcc, g) tgraph rvgraph vars globalSizeComplexities r alls =
  if alls = [] then
    None
  else
    let s = List.hd alls in
      Farkaspolo.lambda_count := 0;
      Farkaspolo.all_lambdas := [];
      let toOrient = if useSizeComplexities then s else r in
        if toOrient = [] then
          doLoop useSizeComplexities degree (rcc, g) tgraph rvgraph vars globalSizeComplexities r (List.tl alls)
        else
          let (abs, params) = create_poly_map toOrient in
            let cwbs = get_cwbs toOrient abs in
              let cwbs_for_unknowns = getOnlyFor cwbs toOrient s in
                let weak = List.map getAllWeak cwbs
                and bound = List.map getAllBound cwbs_for_unknowns in
                  let strictDecrease = List.map getAllStrict (getOnlyFor weak toOrient s) in
                    let strict = Farkaspolo.combine bound (List.map List.flatten strictDecrease)
                    and allparams = params @ !Farkaspolo.all_lambdas in
                      let res = Smt.isSatisfiableFarkasPolo (List.flatten (List.flatten weak)) strict allparams in
                        match res with
                          | None -> None
                          | Some model ->
                            (
                              let model' = Polo.fix_model model params in
                                let conc = Polo.get_concrete_poly abs model' in
                                  let c = getC useSizeComplexities tgraph conc rcc g toOrient globalSizeComplexities vars in
                                    let nrcc = annotate rcc s strict model' c
                                    and ng = g
                                    and ntgraph = tgraph
                                    and nrvgraph = rvgraph in
                                      if equal rcc nrcc then
                                        if useSizeComplexities then
                                          doLoop useSizeComplexities degree (rcc, g) tgraph rvgraph vars globalSizeComplexities r (List.tl alls)
                                        else
                                          None
                                      else
                                        Some (((nrcc, g), ntgraph, nrvgraph), fun ini outi -> getProof ini outi (rcc, g) (nrcc, ng) conc useSizeComplexities globalSizeComplexities toOrient vars)
                            )

(* set up parametric polynomials *)
and create_poly_map cint =
  let funs = Utils.remdup (List.flatten (List.map (fun rule -> (Comrule.getFuns rule)) cint)) in
    let abs = List.map (create_poly_map_one cint) funs in
      (abs, Polo.getParams abs)
and create_poly_map_one cint f =
  (f, Polo.getPoly 1 (Cint.getArityOf f cint) f)

and get_cwbs toOrient abs =
  List.map (fun r -> convert_rule_to_leqs r abs) toOrient
and convert_rule_to_leqs (l, rs, c) abs =
  let lpol = List.assoc (Term.getFun l) abs
  and rpols = List.map (fun r -> List.assoc (Term.getFun r) abs) rs in
    let lpolinst = Parapoly.instantiate lpol (Polo.getInstBin (Term.getFun l) (Term.getArgs l) 1)
    and rpolinsts = List.map2 (fun r rpol -> Parapoly.instantiate rpol (Polo.getInstBin (Term.getFun r) (Term.getArgs r) 1)) rs rpols in
      if List.length rs = 1 then
        (
          Farkaspolo.convert_constraint_to_leqs (Pc.dropNonLinearAtoms c),
          [Parapoly.negate (Parapoly.minus lpolinst (List.hd rpolinsts))],
          Parapoly.add (Parapoly.negate lpolinst) ([], ([], Big_int.unit_big_int))
        )
      else
        let rights = getAllRights rpolinsts in
          (
            Farkaspolo.convert_constraint_to_leqs (Pc.dropNonLinearAtoms c),
            List.map (fun right -> Parapoly.negate (Parapoly.minus lpolinst right)) rights,
            Parapoly.add (Parapoly.negate lpolinst) ([], ([], Big_int.unit_big_int))
          )
and getAllRights rpolinsts =
  let lists = getAllLists rpolinsts in
    List.map addThem lists
and addThem list =
  match list with
    | [] -> ([], ([], Big_int.zero_big_int))
    | [x] -> x
    | x::y::rest -> addThem ((Parapoly.add x y)::rest)
and getAllLists rpolinsts =
  match rpolinsts with
    | [] -> [[]]
    | rpolinst::rest -> let tmp = getAllLists rest in
                          addMeIn rpolinst tmp
and addMeIn rpolinst tmp =
  (List.map (fun list -> ([], ([], Big_int.zero_big_int))::list) tmp) @
  (List.map (fun list -> rpolinst::list) tmp)

and getAllWeak (c, ws, b) =
  List.map (fun w -> Farkaspolo.getWeak (c, w, b)) ws

and getAllBound (c, ws, b) =
  Farkaspolo.getBound (c, List.hd ws, b)

and getAllStrict ws =
  List.map Farkaspolo.getStrict ws

and getVars rcc =
  Term.getVars (Comrule.getLeft (first (List.hd rcc)))

and equal rcc nrcc =
  List.for_all2 (fun (_, c, c') (_, d, d') -> (Complexity.equal c d) && (Poly.eq_big_int c' d')) rcc nrcc

and getS4SizeComplexities tgraph rcc =
  let unknowns = List.map first (List.filter (fun (_, c, _) -> c = Complexity.Unknown) rcc) in
    let res = removeRulesWithUnknownPreds tgraph rcc unknowns in
      res
and removeRulesWithUnknownPreds tgraph rcc unknowns =
  let oldsize = List.length unknowns
  and tmp = removeOneRuleWithUnknownPreds tgraph rcc unknowns unknowns [] in
    if oldsize = (List.length tmp) then
      unknowns
    else
      removeRulesWithUnknownPreds tgraph rcc tmp
and removeOneRuleWithUnknownPreds tgraph rcc x unknowns accu =
  match x with
    | [] -> accu
    | r::rest -> if hasUnknownPred tgraph rcc r unknowns then
                   accu @ rest
                 else
                   removeOneRuleWithUnknownPreds tgraph rcc rest unknowns (accu @ [r])
and hasUnknownPred tgraph rcc r unknowns =
  let preds = Cintgraph.getPreds tgraph [r] in
    let otherPreds = takeout preds unknowns in
      List.exists (fun rule -> (Cintprob.getComplexity rcc rule) = Complexity.Unknown) otherPreds

and getC useSizeComplexities tgraph conc rcc g toOrient globalSizeComplexities vars =
  if useSizeComplexities then
    let funs = getFuns toOrient
    and pre_toOrient = takeout (Cintgraph.getPreds tgraph toOrient) toOrient in
      Complexity.listAdd (List.map (getTerm conc rcc pre_toOrient globalSizeComplexities vars) funs)
  else
    let pol_g = List.assoc g conc in
      Complexity.P (Expexp.abs (Expexp.instantiate (Expexp.fromPoly pol_g) (getBindings vars 1)))
and getBindings lvars i =
  match lvars with
    | [] -> []
    | v::rest -> ("X_" ^ (string_of_int i), Expexp.fromVar v)::(getBindings rest (i + 1))
and getFuns rules =
  Utils.remdup (List.map (fun rule -> Term.getFun (Comrule.getLeft rule)) rules)
and takeout l1 l2 =
  List.filter (fun rule -> not (Cint.contains l2 rule)) l1
and getTerm conc rcc pre_toOrient globalSizeComplexities vars f =
  let t_f = List.filter (fun rule -> Utils.contains (List.map Term.getFun (Comrule.getRights rule)) f) pre_toOrient
  and pol_f = List.assoc f conc in
    Complexity.listAdd (List.map (getTermForPreRule f pol_f rcc globalSizeComplexities vars) t_f)
and getTermForPreRule f pol_f rcc globalSizeComplexities vars prerule =
  let k = Cintprob.getComplexity rcc prerule
  and applied = getAppliedSum f pol_f globalSizeComplexities prerule vars in
    Complexity.mult k applied
and getAppliedSum f pol_f globalSizeComplexities prerule vars =
  let rhss = Comrule.getRights prerule in
    let rhssWithNums = List.combine rhss (Utils.getList 0 ((List.length rhss) - 1)) in
    let rhssWithNums_f = List.filter (fun (r, j) -> (Term.getFun r) = f) rhssWithNums in
      Complexity.listAdd (List.map (getAppliedOne pol_f globalSizeComplexities prerule vars) rhssWithNums_f)
and getAppliedOne pol_f globalSizeComplexities prerule vars (rhs, j) =
  let csmap = getCSmap globalSizeComplexities prerule rhs j vars in
    Complexity.apply (Expexp.fromPoly (Poly.abs pol_f)) csmap
and getCSmap globalSizeComplexities prerule rhs j vars =
  getCSmapAux globalSizeComplexities prerule j 0 (Term.getArity rhs) vars
and getCSmapAux globalSizeComplexities prerule j i n vars =
  if i >= n then
    []
  else
    (getCSmapEntry globalSizeComplexities prerule j i vars)::(getCSmapAux globalSizeComplexities prerule j (i + 1) n vars)
and getCSmapEntry globalSizeComplexities prerule j i vars =
  ("X_" ^ (string_of_int (i + 1)), findEntry globalSizeComplexities prerule j i vars)
and findEntry globalSizeComplexities prerule j i vars =
  match globalSizeComplexities with
    | [] -> failwith "Did not find entry!"
    | (rule', ((j', i'), c))::rest -> if (j' = j) && (i' = i) && (Comrule.equal prerule rule') then
                                 Cintlocalsizecomplexity.toSmallestComplexity c vars
                               else
                                 findEntry rest prerule j i vars

and annotate rcc s strict model d =
  match rcc with
    | [] -> []
    | (rule, c, c')::rest -> if s <> [] && Comrule.equal rule (List.hd s) && c = Complexity.Unknown then
                               if Farkaspolo.isStrict (List.hd strict) model then
                                 (rule, d, c')::(annotate rest (List.tl s) (List.tl strict) model d)
                               else
                                 (rule, c, c')::(annotate rest (List.tl s) (List.tl strict) model d)
                             else
                               (rule, c, c')::(annotate rest s strict model d)

and getProof ini outi rccg nrccg pol useSizeComplexities sizeComplexities toOrient vars =
  let newlybound = List.filter (isNewlyBound (fst rccg)) (fst nrccg) in
    let more = (List.length newlybound) <> 1 in
      "A polynomial rank function with\n" ^
      (pol_to_string pol) ^ "\n" ^
      (if useSizeComplexities then ("and size complexities\n" ^ (printSizeComplexities (fst rccg) sizeComplexities vars) ^ "\n") else "") ^
      "orients " ^ (printOrientedRules useSizeComplexities toOrient) ^ "weakly and the " ^ (if more then "transitions" else "transition") ^ "\n" ^
      (Cint.toStringPrefix "\t" (List.map first newlybound)) ^ "\n" ^
      "strictly and produces the following problem:\n" ^
      (Cintprob.toStringGNumber nrccg outi)
and printOrientedRules useSizeComplexities toOrient =
  if useSizeComplexities then
    "the " ^ (if (List.length toOrient) <> 1 then "transitions" else "transitions") ^ "\n" ^
    (Cint.toStringPrefix "\t" toOrient) ^ "\n"
  else "all transitions "
and pol_to_string pol =
  String.concat "\n" (List.map pol_to_string_one pol)
and pol_to_string_one (f, pol) =
  "\tPol(" ^ f ^ ") = " ^ (Poly.toString (Cfarkaspolo.rename pol))
and isNewlyBound rcc (r, c, c') =
  (c <> Complexity.Unknown) && (isUnknown rcc r)
and isUnknown rcc r' =
  match rcc with
    | [] -> failwith "Did not find rule!"
    | (r, c, c')::rest -> if Comrule.equal r r' then
                            c = Complexity.Unknown
                          else
                            isUnknown rest r'
and printSizeComplexities rcc sizeComplexities vars =
  let sortedSizeComplexities = sortSizeComplexities rcc sizeComplexities in
    Cintlocalsizecomplexity.dumpGSCsAsComplexities sortedSizeComplexities vars
and sortSizeComplexities rcc sizeComplexities =
  match rcc with
    | [] -> []
    | (rule, _, _)::rest -> (getSizeComplexitiesForRule rule sizeComplexities) @ (sortSizeComplexities rest sizeComplexities)
and getSizeComplexitiesForRule rule sizeComplexities =
  getSizeComplexitiesForRule' rule sizeComplexities 0 (List.length (Comrule.getRights rule))
and getSizeComplexitiesForRule' rule sizeComplexities j m =
  if j >= m then
    []
  else
    let rhs = List.nth (Comrule.getRights rule) j in
      (getSizeComplexitiesForRuleAux rule sizeComplexities j 0 (Term.getArity rhs)) @ (getSizeComplexitiesForRule' rule sizeComplexities (j + 1) m)
and getSizeComplexitiesForRuleAux rule sizeComplexities j i n =
  if i >= n then
    []
  else
    (findFullEntry sizeComplexities rule j i)::(getSizeComplexitiesForRuleAux rule sizeComplexities j (i + 1) n)
and findFullEntry sizeComplexities rule j i =
  match sizeComplexities with
    | [] -> failwith "Did not find full entry!"
    | (rule', ((j', i'), c))::rest -> if (j' = j) && (i' = i) && (Comrule.equal rule rule') then
                                        (rule', ((j', i'), c))
                                      else
                                        findFullEntry rest rule j i
