(*
  Unreachable removal

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

module Make (RuleT : AbstractRule) = struct
  module TGraph = Tgraph.Make(RuleT)
  module RVG = Rvgraph.Make(RuleT)
  module CTRSObl = Ctrsobl.Make(RuleT)
  module CTRS = CTRSObl.CTRS
  open CTRSObl
  open CTRS

  (* Remove unreachable *)
  let rec process ctrsobl tgraph rvgraph =
    Log.log "Trying Unreachable Removal processor...";
    if CTRSObl.isSolved ctrsobl then
      None
    else
    (
      let startRules =
        List.filter
          (fun rule -> ctrsobl.ctrs.startFun = Term.getFun (RuleT.getLeft rule))
          ctrsobl.ctrs.rules in
      let reachableRules = TGraph.computeReachable tgraph startRules in
      if List.length reachableRules = List.length ctrsobl.ctrs.rules then
        None
      else
        let removedRules = Utils.removeAllC RuleT.equal ctrsobl.ctrs.rules reachableRules in
        Log.log (Printf.sprintf "Removed %i unreachable rules." (List.length removedRules));
        let newComplexities = CTRS.removeRulesFromMap ctrsobl.complexity removedRules in
        let newCost = CTRS.removeRulesFromMap ctrsobl.cost removedRules in
        let ntgraph = TGraph.keepNodes tgraph reachableRules in
        let nrvgraph = RVG.updateOptionRVGraph rvgraph removedRules [] ntgraph in
        let nctrsobl = { ctrs = { rules = reachableRules ; startFun = ctrsobl.ctrs.startFun } ; cost = newCost ; complexity = newComplexities ; leafCost = ctrsobl.leafCost } in
        Some ((nctrsobl, ntgraph, nrvgraph), getProof ctrsobl nctrsobl removedRules)
    )

  and getProof ctrsobl newctrsobl removedRules ini outi =
    if newctrsobl.ctrs.rules = [] then
      "Testing for reachability in the complexity graph removes all transitions from problem " ^
      (string_of_int ini) ^ "."
    else
      let moreThanOne = (List.length removedRules <> 1) in
      "Testing for reachability in the complexity graph removes the following " ^
        (if moreThanOne then "transitions " else "transition ") ^
        "from problem " ^ (string_of_int ini) ^ ":\n" ^
        (RuleT.listToStringPrefix "\t" removedRules) ^ "\n" ^
        "We thus obtain the following problem:\n" ^
        (CTRSObl.toStringNumber newctrsobl outi)
end

