(*
  Slicing.

  @author Marc Brockschmidt

  Copyright 2014 Microsoft Research

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
  module VarMap = Map.Make(String)
  module CTRSObl = Ctrsobl.Make(RuleT)
  module CTRS = CTRSObl.CTRS
  open CTRSObl
  open CTRS

  let getProof ctrsobl nctrsobl remainingVars ini outi =
    Printf.sprintf 
      "Slicing away variables that do not contribute to conditions from problem %i leaves variables [%s].\nWe thus obtain the following problem:\n%s"
      ini
      (String.concat ", " remainingVars)
      (CTRSObl.toStringNumber nctrsobl outi)

  let process ctrsobl =
    (* Heuristic: Do nothing for "small" systems, where small is an arbitrary number. 
     * Thing to keep in mind: The RVG has |vars| * |rules| nodes, and up to squared that edges.
     *)
    let ruleNum = List.length ctrsobl.ctrs.rules in
    let vars = CTRS.getVars ctrsobl.ctrs in
    let varNum = List.length vars in
    if ruleNum * varNum < 40 then
      None
    else
      let varToIdx = List.fold_left (fun map (v, i) -> VarMap.add v i map) VarMap.empty (List.mapi (fun i v -> (v, i)) vars) in
      let varToIdxSet v = if VarMap.mem v varToIdx then [VarMap.find v varToIdx] else [] in
      let computeNeeded rules = 
        let rec propagate neededIdxs rules = 
          let propagateForRule neededIdxs rule =
            let propagateForRhs neededIdxs rhs =
              Utils.concatMap 
                (fun arg -> Utils.concatMap varToIdxSet (Poly.getVars arg))
                (Utils.getIndexedSubset neededIdxs (Term.getArgs rhs)) in
            Utils.concatMap (propagateForRhs neededIdxs) (RuleT.getRights rule) in
          let newNeededIdxs = Utils.remdup (neededIdxs @ (Utils.concatMap (propagateForRule neededIdxs) rules)) in
          if (List.length neededIdxs < List.length newNeededIdxs) then
            propagate newNeededIdxs rules
          else
            newNeededIdxs
        in
        let varsInConds = Utils.remdup (Utils.concatMap (fun r -> Pc.getVars (RuleT.getCond r)) rules) in
        let initNeededIdxs = Utils.concatMap varToIdxSet varsInConds in
        propagate initNeededIdxs rules
      in
      let neededIdxs = computeNeeded ctrsobl.ctrs.rules in
      if List.length neededIdxs = varNum then (* nothing filtered *)
        None
      else
        let (newRules, newComplexity, newCost) =
          List.fold_left
            (fun (newRules, newComplexity, newCost) rule -> 
              let newRule = RuleT.restrictArguments neededIdxs rule in
              (newRule :: newRules,
               RuleMap.add newRule (RuleMap.find rule ctrsobl.complexity) newComplexity,
               RuleMap.add newRule (RuleMap.find rule ctrsobl.cost) newCost))
            ([], RuleMap.empty, RuleMap.empty)
            ctrsobl.ctrs.rules in

        let newctrsobl =
          { ctrs = { rules = newRules ; startFun = ctrsobl.ctrs.startFun }
          ; cost = newCost 
          ; complexity = newComplexity 
          ; leafCost = ctrsobl.leafCost 
          } in
        Some (newctrsobl, getProof ctrsobl newctrsobl (Utils.getIndexedSubset neededIdxs vars))
end
