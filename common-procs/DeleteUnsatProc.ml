(*
  Unsatisfiable constraints

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

  let rec process ctrsobl tgraph rvgraph =
    if CTRSObl.isSolved ctrsobl then
      None
    else
      let (sats, unsats) = Utils.split (fun rule -> Smt.isSatisfiable (Pc.dropNonLinearAtoms (RuleT.getCond rule)) <> Ynm.No) ctrsobl.ctrs.rules in
      if unsats = [] then
        None
      else
        (
          let newComplexity = CTRS.removeRulesFromMap ctrsobl.complexity unsats in
          let newCost = CTRS.removeRulesFromMap ctrsobl.cost unsats in
          let ntgraph = TGraph.removeNodes tgraph unsats in
          let nrvgraph = RVG.updateOptionRVGraph rvgraph unsats [] ntgraph in
          let nctrsobl = { ctrs = { rules = sats ; startFun = ctrsobl.ctrs.startFun } ; cost = newCost ; complexity = newComplexity ; leafCost = ctrsobl.leafCost } in
          Some ((nctrsobl, ntgraph, nrvgraph), getProof ctrsobl nctrsobl unsats)
        )

  and getProof ctrsobl nctrsobl unsats ini outi =
    if nctrsobl.ctrs.rules = [] then
      "Testing for unsatisfiable constraints removes all transitions from problem " ^
        (string_of_int ini) ^ "."
    else
      let moreThanOne = (List.length unsats) <> 1 in
      "Testing for unsatisfiable constraints removes the following" ^
        (if moreThanOne then " transitions " else " transition ") ^
        "from problem " ^ (string_of_int ini) ^ ":\n" ^
        (RuleT.listToStringPrefix "\t" unsats) ^ "\n" ^
        "We thus obtain the following problem:\n" ^
        (CTRSObl.toStringNumber nctrsobl outi)
end
