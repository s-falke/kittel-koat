(*
  Separate anaylsis

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

module CTRS = Ctrs.Make(Rule)
module RVG = Rvgraph.Make(Rule)
module LSC = LocalSizeComplexity.Make(Rule)
module GSC = GlobalSizeComplexity.Make(Rule)
module TGraph = Tgraph.Make(Rule)

let first (x, _, _) =
  x

(* separate analysis *)
let rec process innerprover l' addSizeSummaries sep sepNumberMultiplier (rcc, g, l) tgraph rvgraph =
  if CTRS.isSolved rcc || l' = [] then
    None
  else
  (
    let vars = Term.getVars (Rule.getLeft (first (List.hd rcc))) in
      let tmp = split (rcc, g, l) l' (sep * sepNumberMultiplier) vars tgraph rvgraph in
        match tmp with
          | None -> None
          | Some (inner, outer, exits) -> let subproof = innerprover inner in
                                          (
                                            match subproof with
                                              | None -> None
                                              | Some (compl, gsc, proof) -> let realouter = fixLoopSummary outer compl gsc addSizeSummaries exits vars in
                                                                              Some (realouter, fun ini outi -> getProof sep sepNumberMultiplier ini outi inner proof realouter)
                                          )
  )
and fixLoopSummary ((rcc, g, l), tgraph, rvgraph) compl gsc addSizeSummaries exits vars =
  let firstRCC = List.hd rcc in
    let fixedFirstRCC = fixWeight firstRCC compl in
      let summaryFixedFirstRCC = addSummary fixedFirstRCC gsc addSizeSummaries exits vars in
        let tgraph' = TGraph.addNodes (TGraph.removeNodes tgraph [first firstRCC]) (List.map first summaryFixedFirstRCC) in
          let rvgraph' = getFixedRVGraph rvgraph firstRCC summaryFixedFirstRCC tgraph' in
            ((summaryFixedFirstRCC @ (List.tl rcc), g, l), tgraph', rvgraph')
and fixWeight (r, c, _) compl =
  (r, c, Complexity.getExpexp compl)
and addSummary (rule, compl, cost) gsc addSizeSummaries exits vars =
  if (not addSizeSummaries) || (exits = []) then
    [(rule, compl, cost)]
  else
  (
    let csmaps = List.map (fun exit -> GSC.extractSizeMapForRuleForVars gsc exit 0 vars) exits in
      let max_map = getMaxMap csmaps in
        let havocedVars = Utils.removeAll (Term.getVars (Rule.getRight rule)) (Term.getVars (Rule.getLeft rule)) in
          let sizeBoundsForHavocedVars = getSizeBounds max_map havocedVars in
            let sizeBoundsConstraints = getSizeBoundsConstraints sizeBoundsForHavocedVars in
              List.map (fun c -> ((Rule.getLeft rule, Rule.getRight rule, c), compl, cost)) sizeBoundsConstraints
  )
and getMaxMap csmaps =
  match csmaps with
    | [] -> failwith "internal error in Cseparate.getMaxMap"
    | [csmap] -> csmap
    | csmap::rest -> maxThem csmap (getMaxMap rest)
and maxThem csmap csmap' =
  List.map2 (fun (x, c) (y, c') -> maxThemAux x c y c') csmap csmap'
and maxThemAux x c y c' =
  if x <> y then
    failwith "internal error in Cseparate.maxThem"
  else
    (x, Complexity.sup [c;c'])
and getSizeBounds max_map havocedVars =
  List.map (fun v -> (v, getSizeBound max_map v)) havocedVars
and getSizeBound max_map v =
  let real_v = String.sub v 0 ((String.length v) - 1) in
    List.assoc real_v max_map
and getSizeBoundsConstraints sizeBounds =
  let plainConstraint = List.flatten (getPlainConstraint sizeBounds) in
    let c_vars = Pc.getVars plainConstraint in
      case_split [plainConstraint] c_vars
and getPlainConstraint sizeBounds =
  match sizeBounds with
    | [] -> []
    | (x, b)::rest -> let pol_opt = Complexity.getPoly b in
                      (
                        match pol_opt with
                          | None -> []
                          | Some p -> [Pc.Leq (Poly.fromVar x, p)]::(getPlainConstraint rest)
                      )
and case_split cs vars =
  match vars with
    | [] -> cs
    | x::rest -> case_split (split_one cs x) rest
and split_one cs x =
  let x_pol = Poly.fromVar x in
    let subst = [(x, Poly.negate x_pol)]
    and geq = Pc.Geq (x_pol, Poly.zero)
    and lt = Pc.Lss (x_pol, Poly.zero) in
      (List.map (apply_split geq []) cs) @ (List.map (apply_split lt subst) cs)
and apply_split c subs c' =
  c::(Pc.instantiate c' subs)
and getFixedRVGraph rvgraph firstRCC summayFixedFirstRCC tgraph' =
  match rvgraph with
    | None -> None
    | Some rvg -> let newRulesWithLSCs = LSC.computeLocalSizeComplexities (List.map first summayFixedFirstRCC) in
                    Some (RVG.addNodes (RVG.removeNodes rvg [first firstRCC]) newRulesWithLSCs tgraph')

and getProof sep sepNumberMultiplier ini outi (irccgl, _, _) proof (orccgl, _, _) =
  "Separating problem " ^ (string_of_int ini) ^ " produces the isolated subproblem\n" ^
  (CTRS.toStringGNumber irccgl (1 + sep * sepNumberMultiplier)) ^ "\n\n" ^
  "=== begin of proof for isolated subproblem " ^ (string_of_int (1 + sep * sepNumberMultiplier)) ^ " ===\n" ^
  indent_lines (proof ()) ^
  "\n=== end of proof for isolated subproblem " ^ (string_of_int (1 + sep * sepNumberMultiplier)) ^ " ===\n\n" ^
  "Applying the information from the isolated subproblem " ^ (string_of_int (1 + sep * sepNumberMultiplier)) ^
  " to problem " ^ (string_of_int ini) ^ " produces the following problem:\n" ^
  (CTRS.toStringGNumber orccgl outi)
and indent_lines text =
  let lines = Str.split (Str.regexp "\n") text in
    String.concat "\n" (List.map (fun line -> "\t" ^ line) lines)

and split (rcc, g, l) l' count vars tgraph rvgraph =
  let allfuns = Utils.remdup (List.flatten (List.map (fun (r, _, _) -> Rule.getFuns r) rcc))
  and innerfuns = l' in
    if (List.length allfuns) = (List.length innerfuns) then
      None
    else
      let outerfuns = Utils.removeAll allfuns l' in
        Some (turn_into_proper_format innerfuns outerfuns count (rcc, g, l) vars tgraph rvgraph)
and turn_into_proper_format innerfuns outerfuns count (rcc, g, l) vars tgraph rvgraph =
  let allrules = List.map first rcc in
    let innerrules = getInnerRules allrules innerfuns
    and outerrules = getOuterRules allrules innerfuns
    and pre_innerrules = getPredRules allrules innerfuns in
      let inner = getInner innerrules pre_innerrules count (rcc, g, l) vars tgraph rvgraph
      and outer = getOuter outerrules innerfuns innerrules count (rcc, g, l) vars tgraph rvgraph
      and exits = getExitRules allrules innerrules tgraph in
        (inner, outer, exits)
and getInnerRules rules funs =
  List.filter (fun rule -> Utils.contains funs (Term.getFun (Rule.getLeft rule)) && Utils.contains funs (Term.getFun (Rule.getRight rule))) rules
and getOuterRules rules funs =
  List.filter (fun rule -> not (Utils.contains funs (Term.getFun (Rule.getLeft rule))) && not (Utils.contains funs (Term.getFun (Rule.getRight rule)))) rules
and getPredRules rules funs =
  List.filter (fun rule -> not (Utils.contains funs (Term.getFun (Rule.getLeft rule))) && Utils.contains funs (Term.getFun (Rule.getRight rule))) rules
and getExitRules rules innerrules tgraph =
  let succs = TGraph.getSuccs tgraph innerrules in
    let outer_succs = List.filter (fun succ -> not (List.exists (Rule.equal succ) innerrules)) succs in
      List.filter (fun innerrule -> List.exists (fun succ -> TGraph.hasEdge tgraph innerrule succ) outer_succs) innerrules

and getInner innerrules pre_innerrules count (rcc, g, l) vars tgraph rvgraph =
  let startfun = "inner_" ^ (string_of_int count) ^ "_start." in
    let entries = getEntries startfun pre_innerrules vars
    and tgraph' = TGraph.keepNodes tgraph innerrules
    and rvgraph' = getNewRVG rvgraph innerrules in
      let tgraph'' = TGraph.addNodes tgraph' entries
      and rcc' = List.map (fun t -> (t, Complexity.P Expexp.one, Expexp.zero)) entries in
        (((rcc' @ (get_only rcc innerrules)), startfun, Expexp.zero), tgraph'', getAddedRVG rvgraph' entries tgraph'')
and getEntries g pre_innerrules vars =
  let pre_innerrules_funs = Utils.remdup (List.map (fun rule -> Term.getFun (Rule.getRight rule)) pre_innerrules)
  and lhs = (g, List.map Poly.fromVar vars) in
    List.map (getEntry lhs vars) pre_innerrules_funs
and getEntry lhs vars f =
  let rhs = (f, List.map Poly.fromVar vars) in
    (lhs, rhs, [])
and getAddedRVG rvgraph' t' tgraph'' =
  match rvgraph' with
    | None -> None
    | Some rvg -> let newRulesWithLSCs = LSC.computeLocalSizeComplexities t' in
                    Some (RVG.addNodes rvg newRulesWithLSCs tgraph'')

and getOuter outerrules innerfuns innerrules count (rcc, g, l) vars tgraph rvgraph =
  let varsPols = List.map Poly.fromVar vars
  and varsPols' = getHavocedVars innerrules vars
  and inLoopFun = "inner_" ^ (string_of_int count) ^ "_in."
  and outLoopFun = "inner_" ^ (string_of_int count) ^ "_out." in
    let t' = ((inLoopFun, varsPols), (outLoopFun, varsPols'), [])
    and tskip = ((inLoopFun, varsPols), (outLoopFun, varsPols), [])
    and t_pre_post = getPrePostRules innerfuns inLoopFun outLoopFun rcc in
      let t_pre_post_rules = List.map first t_pre_post in
        let tgraph' = getOuterTGraph tgraph outerrules t' tskip t_pre_post_rules in
          let rvgraph' = getOuterRVGraph rvgraph outerrules t' tskip t_pre_post_rules tgraph'
          and rules' = [(t', Complexity.Unknown, Expexp.zero); (tskip, Complexity.Unknown, Expexp.zero)] @ t_pre_post @ (get_only rcc outerrules) in
            ((rules', g, l), tgraph', rvgraph')
and getHavocedVars innerrules vars =
  let preserved = List.filter (isPreserved innerrules vars) vars in
    List.map Poly.fromVar (List.map (getHavocedVar preserved) vars)
and getHavocedVar preserved var =
  if Utils.contains preserved var then
    var
  else
    (var ^ ".")
and isPreserved rules vars var =
  if rules = [] then
    true
  else
    let idx = Utils.getIdx vars var in
      not (List.exists (isAltered idx) rules)
and isAltered i (l, r, _) =
  not (Poly.equal (List.nth (Term.getArgs l) i) (List.nth (Term.getArgs r) i))
and getPrePostRules innerfuns inLoopFun outLoopFun rcc =
  match rcc with
    | [] -> []
    | ((l, r, c), cc, cost)::rest -> let f = Term.getFun l
                                     and f' = Term.getFun r
                                     and tmp = getPrePostRules innerfuns inLoopFun outLoopFun rest in
                                     if (not (Utils.contains innerfuns f)) && (Utils.contains innerfuns f') then
                                       ((l, (inLoopFun, Term.getArgs r), c), cc, cost)::tmp
                                     else if (Utils.contains innerfuns f) && (not (Utils.contains innerfuns f')) then
                                       (((outLoopFun, Term.getArgs l), r, c), cc, cost)::tmp
                                     else
                                       tmp
and getOuterTGraph tgraph outernodes t' tskip t_pre_post_rules =
  TGraph.addNodes (TGraph.keepNodes tgraph outernodes) ([t';tskip] @ t_pre_post_rules)
and getOuterRVGraph rvgraph outernodes t' tskip t_pre_post_rules tgraph' =
  match rvgraph with
    | None -> None
    | Some rvg -> let newRulesWithLSCs = LSC.computeLocalSizeComplexities ([t';tskip] @ t_pre_post_rules) in
                    Some (RVG.addNodes (RVG.keepNodes rvg outernodes) newRulesWithLSCs tgraph')

and getNewRVG rvgraph keepnodes =
  match rvgraph with
    | None -> None
    | Some rvg -> Some (RVG.keepNodes rvg keepnodes)

and take_out r r' =
  List.filter (fun rule -> not (Trs.contains r' rule)) r

and get_only rcc nodes =
  match rcc with
    | [] -> []
    | (r, c, c')::rest -> if Trs.contains nodes r then
                            (r, c, c')::(get_only rest nodes)
                          else
                            get_only rest nodes
