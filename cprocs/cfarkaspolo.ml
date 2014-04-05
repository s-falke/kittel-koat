(*
  Polynomial interpretations using Farkas' lemma.  Optionally with a minimal element

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
                 if (Trs.contains s rule) then
                   x::(getOnlyFor xs (List.tl r) s)
                 else
                   getOnlyFor xs (List.tl r) s

let first (x, _, _) =
  x
and second (_, c, _) =
  c

let getOut o_opt =
  match o_opt with
    | Some o -> o
    | _ -> failwith "internal error"

(* Find a polynomial interpretation *)
let rec process useSizeComplexities useMinimal degree (rcc, g, l) tgraph rvgraph =
  if degree < 0 || degree > 1 || Cprob.isSolved rcc then
    None
  else
  (
    let vars = getVars rcc in
      let globalSizeComplexities = if useSizeComplexities then Crvgraph.computeGlobalSizeComplexities (getOut rvgraph) rcc g vars else [] in
        let r = List.map first rcc
        and s = if useSizeComplexities then (constructAllS (getS4SizeComplexities tgraph rcc)) else [(List.map first (List.filter (fun (_, c, _) -> c = Complexity.Unknown) rcc))] in
          doLoop useSizeComplexities useMinimal degree (rcc, g, l) tgraph rvgraph vars globalSizeComplexities r s
  )
and constructAllS s =
  match s with
    | [] -> [[]]
    | e::rest -> let tmp = constructAllS rest in
                   List.flatten (List.map (fun l -> [e::l; l]) tmp)
and doLoop useSizeComplexities useMinimal degree (rcc, g, l) tgraph rvgraph vars globalSizeComplexities r alls =
  if alls = [] then
    None
  else
  (
    let s = List.hd alls in
      Farkaspolo.lambda_count := 0;
      Farkaspolo.all_lambdas := [];
      let toOrient = if useSizeComplexities then s else r in
        if toOrient = [] then
          doLoop useSizeComplexities useMinimal degree (rcc, g, l) tgraph rvgraph vars globalSizeComplexities r (List.tl alls)
        else
          let (abs, params) = Polo.create_poly_map degree toOrient
          and (isMINs, isMINsVars) = if useMinimal then (create_is_mins toOrient) else ([], []) in
            let cwbs = Farkaspolo.convert_rules_to_leqs toOrient abs Big_int.unit_big_int in
              let cwbs_for_unknowns = getOnlyFor cwbs toOrient s in
                let weak = List.map Farkaspolo.getWeak cwbs
                and weakRhsMin = if useMinimal then (List.map (getRhsMin isMINs) toOrient) else []
                and bound = List.map Farkaspolo.getBound cwbs_for_unknowns in
                  let weakUseMinimal = if useMinimal then List.map2 (addNeitherMin isMINs) weak toOrient else []
                  and boundUseMinimal = if useMinimal then List.map2 (addLhsNotMin isMINs) bound s else []
                  and strictDecrease = List.map Farkaspolo.getStrict (getOnlyFor weak toOrient s)
                  and strictRhsNotMin = if useMinimal then (List.map (fun rule -> [getRhsNotMin isMINs rule]) s) else []
                  and strictRhsMin = if useMinimal then (List.map (fun rule -> [getRhsMin isMINs rule]) s) else [] in
                    let strict = if useMinimal then [] else (Farkaspolo.combine bound strictDecrease)
                    and strictUseMinimal = if useMinimal then (Farkaspolo.combine strictDecrease strictRhsNotMin) else []
                    and allparams = params @ !Farkaspolo.all_lambdas @ isMINsVars in
                      let res = if useMinimal then (Smt.isSatisfiableFarkasPoloMinimal (getMinRestrictions isMINsVars) (getMinImplications isMINs abs) weakUseMinimal weakRhsMin boundUseMinimal strictUseMinimal strictRhsMin allparams) else (Smt.isSatisfiableFarkasPolo (List.flatten weak) strict allparams) in
                        match res with
                          | None -> None
                          | Some model ->
                            (
                              let model' = Polo.fix_model model (params @ isMINsVars) in
                                let conc = get_concrete_poly abs isMINs model' in
                                  let c = getC useSizeComplexities tgraph conc rcc g toOrient globalSizeComplexities vars in
                                    let nrcc = if useMinimal then (annotateMinimal rcc s boundUseMinimal strictUseMinimal strictRhsMin model' c) else (annotate rcc s strict model' c)
                                    and ng = g
                                    and nl = l
                                    and ntgraph = tgraph
                                    and nrvgraph = rvgraph in
                                      if equal rcc nrcc then
                                        if useSizeComplexities then
                                          doLoop useSizeComplexities useMinimal degree (rcc, g, l) tgraph rvgraph vars globalSizeComplexities r (List.tl alls)
                                        else
                                          None
                                      else
                                        Some (((nrcc, ng, nl), ntgraph, nrvgraph), fun ini outi -> getProof ini outi (rcc, g, l) (nrcc, ng, nl) conc useSizeComplexities globalSizeComplexities toOrient vars)
                            )
  )

and getVars rcc =
  Term.getVars (Rule.getLeft (first (List.hd rcc)))

and getIsMIN isMINs f =
  Pc.Equ (Poly.fromVar (getMINmarker isMINs f), Poly.one)
and getIsNotMIN isMINs f =
  Pc.Equ (Poly.fromVar (getMINmarker isMINs f), Poly.zero)
and getMINmarker isMINs f =
  List.assoc f isMINs

and getLhsMin isMINs rule =
  getIsMIN isMINs (Term.getFun (Rule.getLeft rule))
and getLhsNotMin isMINs rule =
  getIsNotMIN isMINs (Term.getFun (Rule.getLeft rule))
and getRhsMin isMINs rule =
  getIsMIN isMINs (Term.getFun (Rule.getRight rule))
and getRhsNotMin isMINs rule =
  getIsNotMIN isMINs (Term.getFun (Rule.getRight rule))

and addNeitherMin isMINs weakcond rule =
  (getLhsNotMin isMINs rule)::(getRhsNotMin isMINs rule)::weakcond

and addLhsNotMin isMINs boundcond rule =
  (getLhsNotMin isMINs rule)::boundcond

and create_is_mins trs =
  let funs = Utils.remdup (List.flatten (List.map (fun rule -> (Rule.getFuns rule)) trs)) in
    let map = List.map create_is_min funs in
      (map, List.map snd map)
and create_is_min f =
  (f, f ^ "_isMIN")

and getMinRestrictions isMINsVars =
  List.flatten (List.map getZeroOrOne isMINsVars)
and getZeroOrOne v =
  let vP = Poly.fromVar v in
    [Pc.Leq (Poly.zero, vP); Pc.Leq (vP, Poly.one)]

and getMinImplications isMINs abs =
  match isMINs with
    | [] -> []
    | (f, f_isMIN)::rest -> let f_pol = List.assoc f abs in
                              (getMinImplicationsOne f_isMIN f_pol)::(getMinImplications rest abs)
and getMinImplicationsOne f_isMIN f_pol =
  (getZero f_isMIN, List.map getZero (Polo.getParamsOne ("", f_pol)))
and getZero v =
  Pc.Equ (Poly.fromVar v, Poly.zero)

(* create concrete polo *)
and get_concrete_poly abs isMINs model =
  match abs with
    | [] -> []
    | (f, pol)::popo -> if (isMINs = []) || (isNonMIN isMINs model f) then
                          (f, Some (Polo.get_concrete_poly_one pol model))::(get_concrete_poly popo isMINs model)
                        else
                          (f, None)::(get_concrete_poly popo isMINs model)
and isNonMIN isMINs model f =
  let isMINvar = getMINmarker isMINs f in
    Poly.eq_big_int Big_int.zero_big_int (List.assoc isMINvar model)

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
  let preds = Termgraph.getPreds tgraph [r] in
    let otherPreds = takeout preds unknowns in
      List.exists (fun rule -> (Cprob.getComplexity rcc rule) = Complexity.Unknown) otherPreds

and getC useSizeComplexities tgraph conc rc g toOrient globalSizeComplexities vars =
  if useSizeComplexities then
    let funs = getFuns toOrient
    and pre_toOrient = takeout (Termgraph.getPreds tgraph toOrient) toOrient in
      Complexity.listAdd (List.map (getTerm conc rc pre_toOrient globalSizeComplexities vars) funs)
  else
    let pol_g = List.assoc g conc in
      Complexity.P (Expexp.abs (Expexp.instantiate (Expexp.fromPoly (getOut pol_g)) (getBindings vars 1)))
and getBindings lvars i =
  match lvars with
    | [] -> []
    | v::rest -> ("X_" ^ (string_of_int i), Expexp.fromVar v)::(getBindings rest (i + 1))
and getFuns rules =
  Utils.remdup (List.map (fun rule -> Term.getFun (Rule.getLeft rule)) rules)
and takeout l1 l2 =
  List.filter (fun rule -> not (Trs.contains l2 rule)) l1
and getTerm conc rc pre_toOrient globalSizeComplexities vars f =
  let t_f = List.filter (fun rule -> (Term.getFun (Rule.getRight rule)) = f) pre_toOrient
  and pol_f = List.assoc f conc in
    Complexity.listAdd (List.map (getTermForPreRule pol_f rc globalSizeComplexities vars) t_f)
and getTermForPreRule pol_f rc globalSizeComplexities vars prerule =
  let k = Cprob.getComplexity rc prerule
  and csmap = getCSmap globalSizeComplexities prerule vars in
    let applied = Complexity.apply (Expexp.abs (Expexp.fromPoly (getOut pol_f))) csmap in
      Complexity.mult k applied
and getCSmap globalSizeComplexities prerule vars =
  getCSmapAux globalSizeComplexities prerule 0 (Term.getArity (Rule.getRight prerule)) vars
and getCSmapAux globalSizeComplexities rule i n vars =
  if i >= n then
    []
  else
    (getCSmapEntry globalSizeComplexities rule i vars)::(getCSmapAux globalSizeComplexities rule (i + 1) n vars)
and getCSmapEntry globalSizeComplexities rule i vars =
  ("X_" ^ (string_of_int (i + 1)), findEntry globalSizeComplexities rule i vars)
and findEntry globalSizeComplexities rule i vars =
  match globalSizeComplexities with
    | [] -> failwith "Did not find entry!"
    | (rule', (j, c))::rest -> if (i = j) && (Rule.equal rule rule') then
                                 Clocalsizecomplexity.toSmallestComplexity c vars
                               else
                                 findEntry rest rule i vars

and annotate rcc s strict model d =
  match rcc with
    | [] -> []
    | (rule, c, c')::rest -> if s <> [] && Rule.equal rule (List.hd s) && c = Complexity.Unknown then
                               if isStrict (List.hd strict) model then
                                 (rule, d, c')::(annotate rest (List.tl s) (List.tl strict) model d)
                               else
                                 (rule, c, c')::(annotate rest (List.tl s) (List.tl strict) model d)
                             else
                               (rule, c, c')::(annotate rest s strict model d)
and isStrict strict model =
  try
    Pc.isTrue strict model
  with
    | Not_found -> false

and annotateMinimal rcc s bounds stricts rhsmins model d =
  match rcc with
    | [] -> []
    | (rule, c, c')::rest -> if s <> [] && Rule.equal rule (List.hd s) && c = Complexity.Unknown then
                               if isStrictMinimal (List.hd bounds) (List.hd stricts) (List.hd rhsmins) model then
                                 (rule, d, c')::(annotateMinimal rest (List.tl s) (List.tl bounds) (List.tl stricts) (List.tl rhsmins) model d)
                               else
                                 (rule, c, c')::(annotateMinimal rest (List.tl s) (List.tl bounds) (List.tl stricts) (List.tl rhsmins) model d)
                             else
                               (rule, c, c')::(annotateMinimal rest s bounds stricts rhsmins model d)
and isStrictMinimal bound strict rhsminimal model =
  (isStrict bound model) && ((isStrict strict model) || (isStrict rhsminimal model))

and getProof ini outi rccgl nrccgl pol useSizeComplexities sizeComplexities toOrient vars =
  let newlybound = List.filter (isNewlyBound (first rccgl)) (first nrccgl) in
    let more = (List.length newlybound) <> 1 in
      "A polynomial rank function with\n" ^
      (pol_to_string pol) ^ "\n" ^
      (if useSizeComplexities then ("and size complexities\n" ^ (printSizeComplexities (first rccgl) sizeComplexities vars) ^ "\n") else "") ^
      "orients " ^ (printOrientedRules useSizeComplexities toOrient) ^ "weakly and the " ^ (if more then "transitions" else "transition") ^ "\n" ^
      (Trs.toStringPrefix "\t" (List.map first newlybound)) ^ "\n" ^
      "strictly and produces the following problem:\n" ^
      (Cprob.toStringGNumber nrccgl outi)
and printOrientedRules useSizeComplexities toOrient =
  if useSizeComplexities then
    "the " ^ (if (List.length toOrient) <> 1 then "transitions" else "transition") ^ "\n" ^
    (Trs.toStringPrefix "\t" toOrient) ^ "\n"
  else "all transitions "
and pol_to_string pol =
  String.concat "\n" (List.map pol_to_string_one pol)
and pol_to_string_one (f, pol_opt) =
  "\tPol(" ^ f ^ ") = " ^ (if pol_opt = None then "-infty" else (Poly.toString (rename (getOut pol_opt))))
and rename pol =
  let vars = Poly.getVars pol in
    let mapping = List.map (fun x_i -> (x_i, Poly.fromVar ("V" ^ (String.sub x_i 1 ((String.length x_i) - 1))))) vars in
      Poly.instantiate pol mapping
and isNewlyBound rcc (r, c, c') =
  (c <> Complexity.Unknown) && (isUnknown rcc r)
and isUnknown rcc r' =
  match rcc with
    | [] -> failwith "Did not find rule!"
    | (r, c, c')::rest -> if Rule.equal r r' then
                            c = Complexity.Unknown
                          else
                            isUnknown rest r'
and printSizeComplexities rcc sizeComplexities vars =
  let sortedSizeComplexities = sortSizeComplexities rcc sizeComplexities in
    Clocalsizecomplexity.dumpGSCsAsComplexities sortedSizeComplexities vars
and sortSizeComplexities rcc sizeComplexities =
  match rcc with
    | [] -> []
    | (rule, _, _)::rest -> (getSizeComplexitiesForRule rule sizeComplexities) @ (sortSizeComplexities rest sizeComplexities)
and getSizeComplexitiesForRule rule sizeComplexities =
  getSizeComplexitiesForRuleAux rule sizeComplexities 0 (Term.getArity (Rule.getRight rule))
and getSizeComplexitiesForRuleAux rule sizeComplexities i n =
  if i >= n then
    []
  else
    (findFullEntry sizeComplexities rule i)::(getSizeComplexitiesForRuleAux rule sizeComplexities (i + 1) n)
and findFullEntry sizeComplexities rule i =
  match sizeComplexities with
    | [] -> failwith "Did not find full entry!"
    | (rule', (j, c))::rest -> if (i = j) && (Rule.equal rule rule') then
                                 (rule', (j, c))
                               else
                                 findFullEntry rest rule i
