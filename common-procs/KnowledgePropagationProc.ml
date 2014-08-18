(*
  Knowledge propagation

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
  module CTRSObl = Ctrsobl.Make(RuleT)
  module CTRS = CTRSObl.CTRS
  open CTRSObl
  open CTRS

  (* Remove subsumed rules *)
  let rec process ctrsobl tgraph rvgraph =
    if CTRSObl.isSolved ctrsobl then
      None
    else
    (
      let s = CTRSObl.getUnknownComplexityRules ctrsobl in
      let k = CTRSObl.getKnownComplexityRules ctrsobl in
      let subsumed = List.rev (TGraph.computeSubsumed tgraph s k) in
      if subsumed = [] then
        None
      else
        let nctrsobl = propagateComplexities ctrsobl subsumed tgraph in
        Some ((nctrsobl, tgraph, rvgraph), getProof nctrsobl)
    )

  and propagateComplexities ctrsobl subsumed tgraph =
    let updateOneSubsumedRule tgraph complexities rule =
      let pre = TGraph.getPreds tgraph [rule] in
      let preComplexitiesSum = Complexity.listAdd (List.map (fun r -> CTRS.RuleMap.find r complexities) pre) in
      CTRS.RuleMap.add rule preComplexitiesSum complexities
    in
    { ctrs = ctrsobl.ctrs 
    ; cost = ctrsobl.cost
    ; complexity = List.fold_left (updateOneSubsumedRule tgraph) ctrsobl.complexity subsumed
    ; leafCost = ctrsobl.leafCost }

  and getProof nctrsobl ini outi=
    "Repeatedly propagating knowledge in problem " ^
    (string_of_int ini) ^
    " produces the following problem:\n" ^
    (CTRSObl.toStringNumber nctrsobl outi)
end
