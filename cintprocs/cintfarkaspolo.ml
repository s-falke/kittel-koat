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

module CTRSObl = Ctrsobl.Make(Comrule)
module CTRS = CTRSObl.CTRS
module RVG = Rvgraph.Make(Comrule)
module GSC = GlobalSizeComplexity.Make(Comrule)
module LSC = GSC.LSC
module TGraph = Tgraph.Make(Comrule)

open CTRSObl
open CTRS

let rec getOnlyFor xx r s =
  match xx with
    | [] -> []
    | x::xs -> let rule = List.hd r in
                 if (Utils.containsP Comrule.equal s rule) then
                   x::(getOnlyFor xs (List.tl r) s)
                 else
                   getOnlyFor xs (List.tl r) s

let first (x, _, _) =
  x
and second (_, c, _) =
  c

(* Find a polynomial interpretation *)
let rec process useSizeComplexities degree ctrsobl tgraph rvgraph =
  if degree < 0 || degree > 1 || CTRSObl.isSolved ctrsobl then
    None
  else
  (
    Log.log (Printf.sprintf "Trying linear PRF (Farkas-based) processor for degree %i (%s size bounds)..." degree (if useSizeComplexities then "with" else "without"));
    let globalSizeComplexities = if useSizeComplexities then GSC.compute ctrsobl (Utils.unboxOption rvgraph) else GSC.empty in
    let s = if useSizeComplexities then (Utils.powSet (getS4SizeComplexities tgraph ctrsobl)) else [CTRSObl.getUnknownComplexityRules ctrsobl] in
    doLoop useSizeComplexities degree ctrsobl tgraph rvgraph globalSizeComplexities s
  )
and constructAllS s =
  List.fold_right (fun e rest -> Utils.mapFlat (fun l -> [e::l; l]) rest) s [[]]
and doLoop useSizeComplexities degree ctrsobl tgraph rvgraph globalSizeComplexities allS =
  let ctrs = ctrsobl.ctrs in
  let rules = ctrs.rules in
  if allS = [] then
    None
  else
    let s = List.hd allS in
    Farkaspolo.lambda_count := 0;
    Farkaspolo.all_lambdas := [];
    let toOrient = if useSizeComplexities then s else rules in
    if toOrient = [] then
      doLoop useSizeComplexities degree ctrsobl tgraph rvgraph globalSizeComplexities (List.tl allS)
    else
      let (abs, params) = create_poly_map toOrient in
      let cwbs = get_cwbs toOrient abs in
      let cwbs_for_unknowns = getOnlyFor cwbs toOrient s in
      let weak = List.map getAllWeak cwbs in
      let bound = List.map getAllBound cwbs_for_unknowns in
      let strictDecrease = List.map getAllStrict (getOnlyFor weak toOrient s) in
      let strict = Farkaspolo.combine bound (List.map List.flatten strictDecrease) in
      let allparams = params @ !Farkaspolo.all_lambdas in
      let res = Smt.isSatisfiableFarkasPolo (List.flatten (List.flatten weak)) strict allparams in
      match res with
      | None -> None
      | Some model ->
        (
          let model' = Polo.fix_model model params in
          let conc = Polo.get_concrete_poly abs model' in
          let c = getC useSizeComplexities tgraph conc ctrsobl toOrient globalSizeComplexities in
          let nctrsobl = annotate ctrsobl s strict model' c in
          if CTRSObl.haveSameComplexities ctrsobl nctrsobl then 
            (* Try next variant of S *)
            doLoop useSizeComplexities degree ctrsobl tgraph rvgraph globalSizeComplexities (List.tl allS)
          else
            Some ((nctrsobl, tgraph, rvgraph), fun ini outi -> getProof ini outi ctrsobl nctrsobl conc useSizeComplexities globalSizeComplexities toOrient)
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
and convert_rule_to_leqs r abs =
  let lpol = List.assoc (Term.getFun (Comrule.getLeft r)) abs
  and rpols = List.map (fun r -> List.assoc (Term.getFun r) abs) (Comrule.getRights r) in
    let lpolinst = Parapoly.instantiate lpol (Polo.getInstBin (Term.getFun (Comrule.getLeft r)) (Term.getArgs (Comrule.getLeft r)) 1)
    and rpolinsts = List.map2 (fun r rpol -> Parapoly.instantiate rpol (Polo.getInstBin (Term.getFun r) (Term.getArgs r) 1)) (Comrule.getRights r) rpols in
      if List.length (Comrule.getRights r) = 1 then
        (
          Farkaspolo.convert_constraint_to_leqs (Pc.dropNonLinearAtoms (Comrule.getCond r)),
          [Parapoly.negate (Parapoly.minus lpolinst (List.hd rpolinsts))],
          Parapoly.add (Parapoly.negate lpolinst) ([], ([], Big_int.unit_big_int))
        )
      else
        let rights = getAllRights rpolinsts in
          (
            Farkaspolo.convert_constraint_to_leqs (Pc.dropNonLinearAtoms (Comrule.getCond r)),
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
  List.fold_right (fun rpolinst rest -> addMeIn rpolinst rest) rpolinsts [[]]
and addMeIn rpolinst tmp =
  (List.map (fun list -> ([], ([], Big_int.zero_big_int))::list) tmp) @
  (List.map (fun list -> rpolinst::list) tmp)

and getAllWeak (c, ws, b) =
  List.map (fun w -> Farkaspolo.getWeak (c, w, b)) ws

and getAllBound (c, ws, b) =
  Farkaspolo.getBound (c, List.hd ws, b)

and getAllStrict ws =
  List.map Farkaspolo.getStrict ws

and getS4SizeComplexities tgraph ctrsobl =
  let rec removeRulesWithUnknownPreds tgraph ctrsobl unknowns =
    let rec removeOneRuleWithUnknownPreds tgraph ctrsobl x unknowns accu =
      let hasUnknownPred tgraph ctrsobl r unknowns =
        let preds = TGraph.getPreds tgraph [r] in
        let otherPreds = Utils.notInP Comrule.equal unknowns preds in
        List.exists (CTRSObl.hasUnknownComplexity ctrsobl) otherPreds
      in

      match x with
      | [] -> accu
      | r::rest -> 
        if hasUnknownPred tgraph ctrsobl r unknowns then
          accu @ rest
        else
          removeOneRuleWithUnknownPreds tgraph ctrsobl rest unknowns (accu @ [r])
    in
    let oldsize = List.length unknowns
    and tmp = removeOneRuleWithUnknownPreds tgraph ctrsobl unknowns unknowns [] in
    if oldsize = (List.length tmp) then
      unknowns
    else
      removeRulesWithUnknownPreds tgraph ctrsobl tmp
  in
  let unknowns = CTRSObl.getUnknownComplexityRules ctrsobl in
  removeRulesWithUnknownPreds tgraph ctrsobl unknowns

and getC useSizeComplexities tgraph conc ctrsobl toOrient globalSizeComplexities =
  let vars = CTRS.getVars ctrsobl.ctrs in
  if useSizeComplexities then
    let funs_toOrient = Utils.remdup (List.map (fun rule -> Term.getFun (Comrule.getLeft rule)) toOrient) in
    let pre_toOrient = Utils.notInP Comrule.equal toOrient (TGraph.getPreds tgraph toOrient) in
    Complexity.listAdd (List.map (getTerm conc ctrsobl pre_toOrient globalSizeComplexities vars) funs_toOrient)
  else
    let pol_start = List.assoc ctrsobl.ctrs.startFun conc in
    let varBindings = List.mapi (fun i v -> ("X_" ^ (string_of_int (i + 1)), Expexp.fromVar v)) vars in
    Complexity.P (Expexp.abs (Expexp.instantiate (Expexp.fromPoly pol_start) varBindings))
and getTerm conc ctrsobl pre_toOrient globalSizeComplexities vars f =
  let getTermForPreComrule f pol_f ctrsobl globalSizeComplexities vars prerule =
    let getAppliedSum f pol_f globalSizeComplexities prerule vars =
      let getAppliedOne pol_f globalSizeComplexities prerule vars (rhs, j) =
        let csmap = GSC.extractSizeMapForRule globalSizeComplexities prerule j vars in
        Complexity.apply (Expexp.fromPoly (Poly.abs pol_f)) csmap
      in
      let rhss = Comrule.getRights prerule in
      let rhssWithNums = List.mapi (fun i rhs -> (rhs, i)) rhss in
      let rhssWithNums_f = List.filter (fun (r, j) -> (Term.getFun r) = f) rhssWithNums in
      Complexity.listAdd (List.map (getAppliedOne pol_f globalSizeComplexities prerule vars) rhssWithNums_f)
    in
    let k = CTRSObl.getComplexity ctrsobl prerule in
    let applied = getAppliedSum f pol_f globalSizeComplexities prerule vars in
    Complexity.mult k applied
  in
  let t_f = List.filter (fun rule -> Utils.contains (List.map Term.getFun (Comrule.getRights rule)) f) pre_toOrient in
  let pol_f = List.assoc f conc in
  Complexity.listAdd (List.map (getTermForPreComrule f pol_f ctrsobl globalSizeComplexities vars) t_f)


and annotate ctrsobl s strict model d =
  let newComplexity =
    List.fold_left 
      (fun newComplexity (rule, strictVar) -> 
        if Cfarkaspolo.isStrict strictVar model && CTRSObl.hasUnknownComplexity ctrsobl rule then 
          CTRSObl.RuleMap.add rule d newComplexity
        else
          newComplexity)
      ctrsobl.complexity
      (List.combine s strict)
  in
  { ctrs = ctrsobl.ctrs ; cost = ctrsobl.cost ; complexity = newComplexity ; leafCost = ctrsobl.leafCost }

and getProof ini outi oldctrsobl newctrsobl pol useSizeComplexities sizeComplexities toOrient =
  let newlybound = List.filter (fun rule -> not (CTRSObl.hasUnknownComplexity newctrsobl rule)) (CTRSObl.getUnknownComplexityRules oldctrsobl) in
  let moreThanOne = (List.length newlybound) <> 1 in
  "A polynomial rank function with\n" ^
    (pol_to_string pol) ^ "\n" ^
    (if useSizeComplexities then ("and size complexities\n" ^ (GSC.printSizeComplexities newctrsobl sizeComplexities) ^ "\n") else "") ^
    "orients " ^ (printOrientedComrules useSizeComplexities toOrient) ^ "weakly and the " ^ (if moreThanOne then "transitions" else "transition") ^ "\n" ^
    (Comrule.listToStringPrefix "\t" newlybound) ^ "\n" ^
    "strictly and produces the following problem:\n" ^
    (CTRSObl.toStringNumber newctrsobl outi)
and printOrientedComrules useSizeComplexities toOrient =
  if useSizeComplexities then
    "the " ^ (if (List.length toOrient) <> 1 then "transitions" else "transitions") ^ "\n" ^
      (Comrule.listToStringPrefix "\t" toOrient) ^ "\n"
  else "all transitions "
and pol_to_string pol =
  String.concat "\n" (List.map pol_to_string_one pol)
and pol_to_string_one (f, pol) =
  "\tPol(" ^ f ^ ") = " ^ (Poly.toString (Cfarkaspolo.rename pol))
