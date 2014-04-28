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
module TGraph = Tgraph.Make(Rule)

let first (x, _, _) =
  x

(* separate analysis *)
let rec process innerprover l' sep sepNumberMultiplier (rcc, g, l) tgraph rvgraph =
  if CTRS.isSolved rcc || l' = [] then
    None
  else
  (
    let vars = Term.getVars (Rule.getLeft (first (List.hd rcc))) in
      let tmp = split (rcc, g, l) l' (sep * sepNumberMultiplier) vars tgraph rvgraph in
        match tmp with
          | None -> None
          | Some (inner, outer) -> let subproof = innerprover inner in
                                   (
                                     match subproof with
                                       | None -> None
                                       | Some (compl, gsc, proof) -> let realouter = fixWeight outer compl in
                                           Some (realouter, fun ini outi -> getProof sep sepNumberMultiplier ini outi inner proof realouter)
                                   )
  )
and fixWeight ((rcc, g, l), tgraph, rvgraph) compl =
  (((fixWeightOne (List.hd rcc) compl)::(List.tl rcc), g, l), tgraph, rvgraph)
and fixWeightOne (r, c, _) compl =
  (r, c, Complexity.getExpexp compl)

and getProof sep sepNumberMultiplier ini outi (irccgl, _, _) proof (orccgl, _, _) =
  "Separating problem " ^ (string_of_int ini) ^ " produces the problem\n" ^
  (CTRS.toStringGNumber orccgl outi) ^ "\nand the following isolated subproblem:\n" ^
  (CTRS.toStringGNumber irccgl (1 + sep * sepNumberMultiplier)) ^ "\n\n" ^
  "=== begin of proof for isolated subproblem " ^ (string_of_int (1 + sep * sepNumberMultiplier)) ^ " ===\n" ^
  indent_lines (proof ()) ^
  "\n=== end of proof for isolated subproblem " ^ (string_of_int (1 + sep * sepNumberMultiplier)) ^ " ==="
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
      and outer = getOuter outerrules innerfuns count (rcc, g, l) vars tgraph rvgraph in
        (inner, outer)
and getInnerRules rules funs =
  List.filter (fun rule -> Utils.contains funs (Term.getFun (Rule.getLeft rule)) && Utils.contains funs (Term.getFun (Rule.getRight rule))) rules
and getOuterRules rules funs =
  List.filter (fun rule -> not (Utils.contains funs (Term.getFun (Rule.getLeft rule))) && not (Utils.contains funs (Term.getFun (Rule.getRight rule)))) rules
and getPredRules rules funs =
  List.filter (fun rule -> not (Utils.contains funs (Term.getFun (Rule.getLeft rule))) && Utils.contains funs (Term.getFun (Rule.getRight rule))) rules

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

and getOuter outerrules innerfuns count (rcc, g, l) vars tgraph rvgraph =
  let varsPols = List.map Poly.fromVar vars
  and varsPols' = List.map (fun v -> Poly.fromVar (v ^ ".")) vars
  and inLoopFun = "inner_" ^ (string_of_int count) ^ "_in."
  and outLoopFun = "inner_" ^ (string_of_int count) ^ "_out." in
    (* TODO: add size complexities to the constraint... *)
    let t' = ((inLoopFun, varsPols), (outLoopFun, varsPols'), [])
    and tskip = ((inLoopFun, varsPols), (outLoopFun, varsPols), [])
    and t_pre_post = getPrePostRules innerfuns inLoopFun outLoopFun rcc in
      let t_pre_post_rules = List.map first t_pre_post in
        let tgraph' = getOuterTGraph tgraph outerrules t' tskip t_pre_post_rules in
          let rvgraph' = getOuterRVGraph rvgraph outerrules t' tskip t_pre_post_rules tgraph'
          and rules' = [(t', Complexity.Unknown, Expexp.zero); (tskip, Complexity.Unknown, Expexp.zero)] @ t_pre_post @ (get_only rcc outerrules) in
            ((rules', g, l), tgraph', rvgraph')
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
