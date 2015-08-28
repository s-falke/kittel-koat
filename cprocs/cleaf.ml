(*
  Leaf removal

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

module RVG = Rvgraph.Make(Rule)
module TGraph = Tgraph.Make(Rule)
module CTRSObl = Ctrsobl.Make(Rule)
module CTRS = CTRSObl.CTRS
open CTRSObl
open CTRS

(* Remove leaves *)
let rec process ctrsobl tgraph rvgraph =
  if CTRSObl.isSolved ctrsobl then
    None
  else
  (
    Log.log "Trying leaf removal processor ...";
    let leaves = TGraph.computeRulesInTwigs tgraph (constantCostFilter ctrsobl) in
    if (leaves = []) || (List.for_all (fun rule -> not(CTRSObl.hasUnknownComplexity ctrsobl rule)) leaves) then
      None
    else
      (
        Log.log (Printf.sprintf "Leaf removal processor successful, removing %i rules." (List.length leaves));
        let (removedRules, keptRules) = (leaves, Utils.removeAllC Rule.equal ctrsobl.ctrs.rules leaves) in
        let keptComplexities = CTRS.removeRulesFromMap ctrsobl.complexity leaves in
        let keptCost = CTRS.removeRulesFromMap ctrsobl.cost leaves in
        let nl = Expexp.add ctrsobl.leafCost (List.fold_left (fun sum r -> Expexp.add sum (CTRSObl.getCost ctrsobl r)) Expexp.zero removedRules) in
        let ntgraph = TGraph.removeNodes tgraph leaves in
        let nrvgraph = RVG.updateOptionRVGraph rvgraph leaves [] ntgraph in
        let nctrsobl =
          { ctrs = { rules = keptRules ; startFun = ctrsobl.ctrs.startFun }
          ; complexity = keptComplexities
          ; cost = keptCost
          ; leafCost = nl } in
        Some ((nctrsobl, ntgraph, nrvgraph), getProof nctrsobl)
      )
  )

and constantCostFilter ctrsobl rule =
  Expexp.isConst (CTRSObl.getCost ctrsobl rule)

and getProof nctrsobl ini outi =
  "Repeatedly removing leaves of the complexity graph in problem " ^
  (string_of_int ini) ^ " produces the following problem:\n" ^
  (CTRSObl.toStringNumber nctrsobl outi)
