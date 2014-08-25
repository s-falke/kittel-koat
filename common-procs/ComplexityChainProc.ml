(*
  Chaining.

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

open AbstractRule

module Make(RuleT : AbstractRule) = struct
  module CTRSObl = Ctrsobl.Make(RuleT)
  module CTRS = CTRSObl.CTRS
  module RVG = Rvgraph.Make(RuleT)
  module LSC = LocalSizeComplexity.Make(RuleT)
  module TGraph = Tgraph.Make(RuleT)
  open CTRSObl
  open CTRS

  let max_chaining = ref 0
  let done_chaining = ref 0

  (* Chain rules *)
  let rec process max_fanout ctrsobl tgraph rvgraph=
    if (!done_chaining >= !max_chaining) || CTRSObl.isSolved ctrsobl then
      None
    else
      (
        Log.log (Printf.sprintf "Trying Chaining processor for maximal fanout %i ..." max_fanout);
        match getChainedRules max_fanout ctrsobl tgraph with
        | None -> None
        | Some (chainedRule, newRulesWithOrigin) ->
          (
            if (List.exists (fun r -> RuleT.equal chainedRule (fst r)) newRulesWithOrigin) then
              None
            else
              (
                incr done_chaining;
                Log.log "Successfully chained rules.";
                let newctrsobl = getNewObl ctrsobl chainedRule newRulesWithOrigin
                and plainNewRules = List.map fst newRulesWithOrigin in
                let ntgraph = TGraph.addNodes (TGraph.removeNodes tgraph [chainedRule]) plainNewRules in
                let nrvgraph = getNewRVGraph rvgraph chainedRule plainNewRules ntgraph in
                Some ((newctrsobl, ntgraph, nrvgraph), getProof chainedRule newRulesWithOrigin ctrsobl newctrsobl)
              )
          )
      )

  (* Find a rule r with successor rules r_1, ..., r_k such that r has one rhs, r != r_i for all i, 0 < k <= max_fanout.
   * If one exists, return (r, [chained(r, r_1), ..., chained(r, r_k)])
   *)
  and getChainedRules max_fanout ctrsobl tgraph =
    let isSuitable max_fanout (candRule, succs) =
      let numSuccs = List.length succs in
      (numSuccs > 0)
      && (numSuccs <= max_fanout)
      && (RuleT.isUnary candRule)
      && not(Utils.containsP RuleT.equal succs candRule)
    in
    let buildNewRules rule =
      List.map (fun succRule -> (RuleT.chainTwoRules rule succRule, succRule))
    in
    let candidates = List.map (fun r -> (r, TGraph.getSuccs tgraph [r])) ctrsobl.ctrs.rules in
    match Utils.tryFind (isSuitable max_fanout) candidates with
    | None -> None
    | Some (rule, succRules) -> Some (rule, buildNewRules rule succRules)

  and getNewRVGraph rvgraph chainedRule newRules ntgraph =
    match rvgraph with
      | None -> None
      | Some rvg -> let newRulesWithLSCs = LSC.computeLocalSizeComplexities newRules in
                    Some (RVG.addNodes (RVG.removeNodes rvg [chainedRule]) newRulesWithLSCs ntgraph)

  and getNewObl oldctrsobl chainedRule newRulesWithOrigin =
    let open CTRS in
    let newCTRS = (List.map fst newRulesWithOrigin) @ (List.filter (fun r -> not(RuleT.equal r chainedRule)) oldctrsobl.ctrs.rules) in
    let chainedRuleCost = CTRSObl.getCost oldctrsobl chainedRule in
    let chainedRuleComplexity = CTRSObl.getComplexity oldctrsobl chainedRule in
    let (newCost, newComplexity) =
      List.fold_left
        (fun (newCost, newComplexity) (newRule, originRule) ->
          (RuleMap.add newRule (Expexp.add (CTRSObl.getCost oldctrsobl originRule) chainedRuleCost) newCost,
           RuleMap.add newRule chainedRuleComplexity newComplexity))
        (RuleMap.remove chainedRule oldctrsobl.cost, RuleMap.remove chainedRule oldctrsobl.complexity)
        newRulesWithOrigin
    in
    { ctrs = { rules = newCTRS ; startFun = oldctrsobl.ctrs.startFun }
    ; cost = newCost
    ; complexity = newComplexity
    ; leafCost = oldctrsobl.leafCost }

  and getProof chainedRule newRulesWithOrigin ctrsobl newctrsobl ini outi =
    let numNewRules = List.length newRulesWithOrigin in
    let moreThanOne = numNewRules > 1 in
    "By chaining the transition " ^ (RuleT.toString chainedRule) ^ " with all transitions in problem " ^
      (string_of_int ini) ^ ", the following new " ^ (if moreThanOne then "transitions are" else "transition is") ^ " obtained:\n" ^
      (RuleT.listToStringPrefix "\t" (List.map fst newRulesWithOrigin)) ^ "\n" ^
        "We thus obtain the following problem:\n" ^
        (CTRSObl.toStringNumber newctrsobl outi)
end
