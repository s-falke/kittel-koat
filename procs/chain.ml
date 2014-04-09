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

let max_chaining = ref 0
let done_chaining = ref 0

(* Chain rules *)
let rec process trs tgraph isScc =
  if (!done_chaining >= !max_chaining) || trs = [] then
    None
  else
  (
    match getNewRules trs trs with
      | None -> None
      | Some (oldRule, newRules) ->
        (
          if (Trs.contains newRules oldRule) then
            None
          else
          (
            incr done_chaining;
            let ntrs = (removeFromTrs trs oldRule) @ newRules in
              let ntgraph = Termgraph.addNodes (Termgraph.removeNodes tgraph [oldRule]) newRules in
                Some ([(ntrs, ntgraph, false)], fun i alli -> getProof i alli oldRule newRules ntrs)
          )
        )
  )
and removeFromTrs trs rule =
  List.filter (fun r -> not (Rule.equal rule r)) trs
and getProof i alli oldRule newRules ntrs =
  let more = List.length newRules <> 1 in
  "By chaining the rule " ^ (Rule.toString oldRule) ^ " with all rule" ^ (if more then "s " else " ") ^ "in problem " ^
  (string_of_int i) ^ ", the following new rules are obtained:\n" ^
  (Trs.toStringPrefix "\t" newRules) ^ "\n" ^
  "We thus obtain the following problem:\n" ^
  (Procs.getStringSccs alli [ntrs])
and getNewRules rules trs =
  match getNewRulesAux rules trs false with
    | None -> getNewRulesAux rules trs true
    | Some (r, newRules) -> Some (r, newRules)
and getNewRulesAux rules trs allowNonlinear =
  match rules with
    | [] -> None
    | r::rs ->
      (
        match getNewRulesOne r trs allowNonlinear with
          | None -> getNewRules rs trs
          | Some newRules -> Some (r, newRules)
      )
and getNewRulesOne rule trs allowNonlinear =
  let rhs = Rule.getRight rule in
    if allowNonlinear || (List.for_all Poly.isLinear (Term.getArgs rhs)) then
      let rules = Trs.getRules trs (Term.getFun rhs) in
        Some (buildNewRules rule rules)
    else
      None
and buildNewRules rule rules =
  match rules with
    | [] -> []
    | r::rr -> let neww = Rule.chainTwoRules rule r in
                 neww::(buildNewRules rule rr)
