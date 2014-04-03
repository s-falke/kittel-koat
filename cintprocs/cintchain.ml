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
let rec process max_fanout (rcc, g) tgraph rvgraph=
  if (!done_chaining >= !max_chaining) || Cintprob.isSolved rcc then
    None
  else
  (
    match getNewRules max_fanout rcc tgraph with
      | None -> None
      | Some (oldRule, newRules) ->
        (
          if (contains newRules oldRule) then
            None
          else
          (
            incr done_chaining;
            let nrcc = replace rcc (first oldRule) newRules
            and ng = g
            and plainNewRules = List.map first newRules in
              let ntgraph = Cintgraph.addNodes (Cintgraph.removeNodes tgraph [first oldRule]) plainNewRules in
                let nrvgraph = getNewRVGraph rvgraph oldRule plainNewRules ntgraph in
                  Some (((nrcc, g), ntgraph, nrvgraph), fun ini outi -> getProof ini outi oldRule newRules (rcc, g) (nrcc, ng))
          )
        )
  )

and first (x, _, _) =
  x
and second (_, c, _) =
  c
and third (_, _, c) =
  c

and getNewRVGraph rvgraph oldRule plainNewRules ntgraph =
  match rvgraph with
    | None -> None
    | Some rvg -> let newRulesWithLSCs = Cintlocalsizecomplexity.computeLocalSizeComplexities plainNewRules in
                    Some (Cintrvgraph.addNodes (Cintrvgraph.removeNodes rvg [first oldRule]) newRulesWithLSCs ntgraph)

and getNewRules max_fanout rcc tgraph =
  let candidates = getCandidates rcc tgraph in
    findFirst max_fanout candidates
and getCandidates rcc tgraph =
  List.map (computeCand rcc tgraph) rcc
and computeCand rcc tgraph (rule, c, c') =
  let succs = Cintgraph.getSuccs tgraph [rule] in
    ((rule, c, c'), List.map (fun succ -> (succ, Cintprob.getCost rcc succ)) succs)
and findFirst max_fanout candidates =
  match candidates with
    | [] -> None
    | cand::rest -> if isSuitable max_fanout cand then
                      Some (fst cand, buildNewRules (fst cand) (snd cand))
                    else
                      findFirst max_fanout rest
and isSuitable max_fanout (rule, succs) =
  let numSuccs = List.length succs in
    (numSuccs > 0) && (numSuccs <= max_fanout) && (Comrule.isUnary (first rule)) && (not (containsRule succs rule))
and buildNewRules (rule, c, c') succs =
  match succs with
    | [] -> []
    | (rule', c'')::rest -> let newrule = buildNewRule rule rule' in
                              (newrule, c, Big_int.add_big_int c' c'')::(buildNewRules (rule, c, c') rest)
and buildNewRule rule1 rule2 =
  let l = Comrule.getLeft rule1
  and args = Term.getArgs (List.hd (Comrule.getRights rule1))
  and c = Comrule.getCond rule1
  and rule2' = Comrule.renameVars (Comrule.getVars rule1) rule2 in
    let args' = Term.getArgs (Comrule.getLeft rule2')
    and rs = Comrule.getRights rule2'
    and c' = Comrule.getCond rule2' in
      let subby = getSubstitution args args' in
        (l, List.map (fun r -> Term.instantiate r subby) rs, remdupC (c @ (Pc.instantiate c' subby)))
and remdupC c =
  match c with
    | [] -> []
    | x::xs -> x::(remdupC (List.filter (fun y -> not (Pc.equalAtom x y)) xs))
and getSubstitution args args' =
  match args' with
    | [] -> []
    | x::xx -> (getName x, List.hd args)::(getSubstitution (List.tl args) xx)
and getName poly =
  List.hd (Poly.getVars poly)

and contains rcc (rule, _, _) =
  (List.exists (fun (rule', _, _) -> rule == rule') rcc) || (List.exists (fun (rule', _, _) -> Comrule.equal rule rule') rcc)
and containsRule rules (rule, _, _) =
  let tmp = (List.map fst rules) in
    (List.exists (fun rule' -> rule == rule') tmp) || (List.exists (Comrule.equal rule) tmp)

and replace rcc rule newRules =
  match rcc with
    | [] -> []
    | (rule', c, c')::rest -> if Comrule.equal rule rule' then
                                newRules @ rest
                              else
                                (rule', c, c')::(replace rest rule newRules)

and getProof ini outi oldRule newRules rccg nrccg =
  let numNewRules = List.length newRules in
    let single = numNewRules = 1
    and none = numNewRules = 0 in
      "By chaining the transition " ^ (Comrule.toString (first oldRule)) ^ " with all transitions in problem " ^
      (string_of_int ini) ^ ", the following new " ^ (if single then "transition is" else "transitions are") ^ " obtained:\n" ^
      (if none then "\t(none)" else (Cint.toStringPrefix "\t" (List.map first newRules))) ^ "\n" ^
      "We thus obtain the following problem:\n" ^
      (Cintprob.toStringGNumber nrccg outi)
