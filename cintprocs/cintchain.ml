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

module CTRS = Ctrs.Make(Comrule)
module RVG = Rvgraph.Make(Comrule)
module LSC = LocalSizeComplexity.Make(Comrule)
module TGraph = Tgraph.Make(Comrule)


let max_chaining = ref 0
let done_chaining = ref 0

(* Chain rules *)
let rec process max_fanout (rcc, g, l) tgraph rvgraph=
  if (!done_chaining >= !max_chaining) || CTRS.isSolved rcc then
    None
  else
  (
    match getNewComrules max_fanout rcc tgraph with
      | None -> None
      | Some (oldComrule, newComrules) ->
        (
          if (contains newComrules oldComrule) then
            None
          else
          (
            incr done_chaining;
            let nrcc = replace rcc (first oldComrule) newComrules
            and ng = g
            and nl = l
            and plainNewComrules = List.map first newComrules in
              let ntgraph = TGraph.addNodes (TGraph.removeNodes tgraph [first oldComrule]) plainNewComrules in
                let nrvgraph = getNewRVGraph rvgraph oldComrule plainNewComrules ntgraph in
                  Some (((nrcc, ng, nl), ntgraph, nrvgraph), fun ini outi -> getProof ini outi oldComrule newComrules (rcc, g, l) (nrcc, ng, nl))
          )
        )
  )

and first (x, _, _) =
  x
and second (_, c, _) =
  c
and third (_, _, c) =
  c
and getNewRVGraph rvgraph oldComrule plainNewComrules ntgraph =
  match rvgraph with
    | None -> None
    | Some rvg -> let newComrulesWithLSCs = LSC.computeLocalSizeComplexities plainNewComrules in
                    Some (RVG.addNodes (RVG.removeNodes rvg [first oldComrule]) newComrulesWithLSCs ntgraph)

and getNewComrules max_fanout rcc tgraph =
  let candidates = getCandidates rcc tgraph in
    findFirst max_fanout candidates
and getCandidates rcc tgraph =
  List.map (computeCand rcc tgraph) rcc
and computeCand rcc tgraph (rule, c, c') =
  let succs = TGraph.getSuccs tgraph [rule] in
    ((rule, c, c'), List.map (fun succ -> (succ, CTRS.getCost rcc succ)) succs)
and findFirst max_fanout candidates =
  match candidates with
    | [] -> None
    | cand::rest -> if isSuitable max_fanout cand then
                      Some (fst cand, buildNewComrules (fst cand) (snd cand))
                    else
                      findFirst max_fanout rest
and isSuitable max_fanout (rule, succs) =
  let numSuccs = List.length succs in
    (numSuccs > 0) && (numSuccs <= max_fanout) && (Comrule.isUnary (first rule)) && (not (containsComrule succs rule))
and buildNewComrules (rule, c, c') succs =
  match succs with
    | [] -> []
    | (rule', c'')::rest -> let newrule = buildNewComrule rule rule' in
                              (newrule, c, Expexp.add c' c'')::(buildNewComrules (rule, c, c') rest)

and buildNewComrule rule1 rule2 =
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
and containsComrule rules (rule, _, _) =
  let tmp = List.map fst rules in
    (List.exists (fun rule' -> rule == rule') tmp) || (List.exists (Comrule.equal rule) tmp)

and replace rcc rule newComrules =
  match rcc with
    | [] -> []
    | (rule', c, c')::rest -> if Comrule.equal rule rule' then
                                newComrules @ rest
                              else
                                (rule', c, c')::(replace rest rule newComrules)

and getProof ini outi oldComrule newComrules rccgl nrccgl =
  let numNewComrules = List.length newComrules in
    let single = numNewComrules = 1
    and none = numNewComrules = 0 in
      "By chaining the transition " ^ (Comrule.toString (first oldComrule)) ^ " with all transitions in problem " ^
      (string_of_int ini) ^ ", the following new " ^ (if single then "transition is" else "transitions are") ^ " obtained:\n" ^
      (if none then "\t(none)" else (CTRS.toStringPrefix "\t" newComrules)) ^ "\n" ^
      "We thus obtain the following problem:\n" ^
      (CTRS.toStringGNumber nrccgl outi)

