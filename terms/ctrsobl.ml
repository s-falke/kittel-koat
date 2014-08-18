(*
  Complexity TRSs obligations

  @author Stephan Falke, Marc Brockschmidt

  Copyright 2010-2014 Stephan Falke
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

module Make(RuleT : AbstractRule) = struct
  module CTRS = Ctrs.Make(RuleT)
  module RuleMap = CTRS.RuleMap

  type t = 
    { ctrs : CTRS.t ;
      cost : Expexp.expexp RuleMap.t ;
      complexity : Complexity.complexity RuleMap.t ; 
      leafCost : Expexp.expexp ;
    }

  let getComplexity obl rule =
    RuleMap.find rule obl.complexity
  let getCost obl rule =
    RuleMap.find rule obl.cost

  let toStringPrefix prefix obl =
    let open Printf in
    let open CTRS in
    let rulesString = 
      if obl.ctrs.rules = [] then
        "(none)"
      else
        let complCostRuleStrings =
          List.map (fun r -> (sprintf "(%s, %s)" (Complexity.toString (getComplexity obl r)) (Expexp.toString (getCost obl r)), RuleT.toString r)) obl.ctrs.rules in
        let maxLen = List.fold_left (fun m (s, _) -> max m (String.length s)) 0 complCostRuleStrings in
        let toStringPrefixOne prefix maxLen (ccS, rS) =
          prefix ^ ccS ^ (String.make (maxLen + 4 - (String.length ccS)) ' ') ^ rS in
        String.concat "\n" (List.map (toStringPrefixOne (prefix ^ "\t") maxLen) complCostRuleStrings) in
    sprintf "%sT:\n%s\n%sstart location:\t%s\n%sleaf cost:\t%s" prefix rulesString prefix obl.ctrs.startFun prefix (Expexp.toString obl.leafCost)
  let toString obl =
    toStringPrefix "\t" obl
  let toStringNumber obl i =
    (string_of_int i) ^ ":" ^ (toString obl)

  let isSolved obl =
    RuleMap.for_all (fun _ c -> c <> Complexity.Unknown) obl.complexity

  let hasUnknownComplexity obl rule =
    getComplexity obl rule = Complexity.Unknown

  let getUnknownComplexityRules obl =
    RuleMap.fold (fun r c res -> if c = Complexity.Unknown then r::res else res) obl.complexity []

  let getKnownComplexityRules obl =
    RuleMap.fold (fun r c res -> if c <> Complexity.Unknown then r::res else res) obl.complexity []

  let getInitialObl rules start =
    let open Expexp in
    let open CTRS in
    let (rules, initCost, initCompl) = 
      List.fold_left 
        (fun (rules, cost, compl) rule -> 
          if Term.getFun (RuleT.getLeft rule) = start then
            (rule::rules, RuleMap.add rule one cost, RuleMap.add rule (Complexity.P one) compl)
          else
            (rule::rules, RuleMap.add rule one cost, RuleMap.add rule Complexity.Unknown compl))
        ([], RuleMap.empty, RuleMap.empty) rules in
    {
      ctrs = { rules = rules ;
               startFun = start ; 
             } ;
      cost = initCost ;
      complexity = initCompl ;
      leafCost = Expexp.zero ;
    }

  let haveSameComplexities obl1 obl2 =
    RuleMap.cardinal obl1.complexity = RuleMap.cardinal obl2.complexity &&
    RuleMap.for_all (fun rule compl1 -> RuleMap.mem rule obl2.complexity && Complexity.equal compl1 (RuleMap.find rule obl2.complexity)) obl1.complexity
end
