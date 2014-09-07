(*
  Termination graph

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

module Int = struct
  type t = int
  let compare = compare
  let hash = Hashtbl.hash
  let equal = (=)
end

module Make (RuleT : AbstractRule) = struct
  module G = Graph.Persistent.Digraph.Concrete(Int)
  module SCC = Graph.Components.Make(G)
  module RuleMap =
    Map.Make(struct
      type t = RuleT.rule
      let compare = RuleT.compare
    end)

  let rec toDot (g, ruleToIdx) =
    "digraph kittel {\n" ^
    (getNodes ruleToIdx) ^
    "\n" ^
    (getEdges g ruleToIdx) ^
    "\n\n}\n"
  and getNodes ruleToIdx =
    let res = ref "" in
    RuleMap.iter
      (fun rule _ ->
        res := Printf.sprintf "%s\n  \"%s\"" !res (RuleT.toDotString rule)) ruleToIdx;
    !res
  and getEdges g ruleToIdx =
    let accu =
      RuleMap.fold
        (fun rule1 idx1 accu ->
          RuleMap.fold
            (fun rule2 idx2 accu ->
              if G.mem_edge g idx1 idx2 then
                (Printf.sprintf "  \"%s\" -> \"%s\"" (RuleT.toDotString rule1) (RuleT.toDotString rule2))::accu
              else
                accu)
          ruleToIdx accu)
      ruleToIdx [] in
    String.concat "\n" accu

  (* Compute termination graph of trs *)
  let rec compute trs =
    let len = List.length trs in
    let ruleToIdx =
      fst
        (List.fold_left
           (fun (ruleToIdx, idx) rule ->
             (RuleMap.add rule idx ruleToIdx, idx + 1))
           (RuleMap.empty, 0)
           trs) in
    (create_graph len ruleToIdx, ruleToIdx)
  and create_graph len ruleToIdx =
    let res = ref G.empty in
    for i = 0 to (len - 1) do
      res := G.add_vertex !res i
    done;
    RuleMap.iter
      (fun rule1 idx1 ->
        RuleMap.iter
          (fun rule2 idx2 ->
            if connectable rule1 rule2 then
              res := G.add_edge !res idx1 idx2)
          ruleToIdx)
      ruleToIdx;
    !res
  and connectable r1 r2' =
    let r2 = RuleT.renameVars (RuleT.getVars r1) r2' in
    let lt = RuleT.getLeft r2 in
    List.exists (connectableOne lt (RuleT.getCond r1) (RuleT.getCond r2)) (RuleT.getRights r1)
  and connectableOne lt cond1 cond2 rt =
    if (Term.getFun rt) <> (Term.getFun lt) then
      false
    else
      let rargs = Term.getArgs rt in
      let largs = Term.getArgs lt in
      let sigma = getSubstitution largs rargs in
      let cond2sigma = Pc.instantiate cond2 sigma in
      Smt.isSatisfiable (Pc.dropNonLinearAtoms (cond1 @ cond2sigma)) <> Ynm.No
  and getSubstitution largs rargs =
    getSubstitutionAux largs rargs []
  and getSubstitutionAux largs rargs accu =
    match largs with
      | [] -> accu
      | x::l -> getSubstitutionAux l (List.tl rargs) ((List.hd (Poly.getVars x), List.hd rargs)::accu)

  (* Turns a list of indices in the graph into a list of the corresponding rules. *)
  let idxsToRules ruleToIdx idxs =
    RuleMap.fold
      (fun rule idx rules ->
        if Utils.contains idxs idx then
          rule::rules
        else
          rules)
      ruleToIdx
      []

  (* Turns a list of rules into the corresponding indices in the graph. *)
  let rulesToIdxs ruleToIdx rules =
    List.map (fun rule -> RuleMap.find rule ruleToIdx) rules

  (* Return nontrivial SCCs *)
  let getNontrivialSccs (g, ruleToIdx) =
    let nontrivial g scc =
      match scc with
      | [] -> false
      | [x] -> G.mem_edge g x x
      | _ -> true in
    let sccs = SCC.scc_list g in
    let nontrivial = List.filter (nontrivial g) sccs in
    List.map (fun sccIdxs -> idxsToRules ruleToIdx sccIdxs) nontrivial

  (* Compute reachable nodes *)
  let computeReachable (g, ruleToIdx) startNodes =
    let frontier = ref (rulesToIdxs ruleToIdx startNodes) in
    let reachable = ref (rulesToIdxs ruleToIdx startNodes) in
    let progress = ref true in
    while !progress do
      let new_frontier = ref [] in
      List.iter
        (fun v ->
          G.iter_succ
            (fun vSucc ->
              if not (Utils.contains !reachable vSucc) then
                (
                  reachable := vSucc::!reachable;
                  new_frontier := vSucc::!new_frontier;))
            g v)
        !frontier;
      if !new_frontier <> [] then
        (
          frontier := !new_frontier;
          progress := true;
        )
      else
        progress := false;
    done;
    idxsToRules ruleToIdx !reachable

  (* Compute rules in s that are subsumed by rules in k *)
  let rec computeSubsumed (g, ruleToIdx) s k =
    let sl = rulesToIdxs ruleToIdx s in
    let kl = rulesToIdxs ruleToIdx k in
    let subsumed = ref [] in
    computeSubsumedAux sl kl g ruleToIdx subsumed;
    idxsToRules ruleToIdx !subsumed
  and computeSubsumedAux sl kl g ruleToIdx subsumed =
    if computeSubsumedAuxStep sl kl g ruleToIdx subsumed then
      computeSubsumedAux sl kl g ruleToIdx subsumed
  and computeSubsumedAuxStep sl kl g ruleToIdx subsumed =
    let isK kl subsumed j =
      (Utils.contains !subsumed j) || (Utils.contains kl j) in
    let changed = ref false in
    List.iter
      (fun i ->
        if not(isK kl subsumed i) then
          let goodrow = ref true in
          RuleMap.iter
            (fun _ j ->
              if G.mem_edge g j i && not(isK kl subsumed j) then
                goodrow := false)
            ruleToIdx;
          if !goodrow then
            (
              subsumed := i::!subsumed;
              changed := true
            )
      ) sl;
    !changed

  (* remove nodes *)
  let removeNodes (g, ruleToIdx) rules =
    List.fold_left
      (fun (g, ruleToIdx) rule ->
        (G.remove_vertex g (RuleMap.find rule ruleToIdx),
         RuleMap.remove rule ruleToIdx))
      (g, ruleToIdx)
      rules

  (* add nodes *)
  let addNodes (g, ruleToIdx) newRules =
    (* First create new indices, store in map and add vertices to graph. *)
    let maxIdx = RuleMap.fold (fun _ idx maxIdx -> max idx maxIdx) ruleToIdx 0 in
    let (ruleToIdx, g) =
      fst
        (List.fold_left
           (fun ((ruleToIdx, g), idx) newRule ->
             ((RuleMap.add newRule idx ruleToIdx, G.add_vertex g idx), idx + 1))
           ((ruleToIdx, g), maxIdx + 1)
        newRules) in
    (* Now create the needed edges from/to (old \cup new) to new *)
    let g =
      RuleMap.fold
        (fun rule1 rule1Idx g ->
          List.fold_left
            (fun g rule2 ->
              let rule2Idx = RuleMap.find rule2 ruleToIdx in
              let g =
                if connectable rule1 rule2 then
                  G.add_edge g rule1Idx rule2Idx
                else
                  g in
              if connectable rule2 rule1 then
                G.add_edge g rule2Idx rule1Idx
              else
                g
            )
            g newRules)
        ruleToIdx
        g in
    (g, ruleToIdx)

  (* only keep certain nodes *)
  let keepNodes (g, ruleToIdx) rulesToKeep =
    RuleMap.fold
      (fun rule idx (g, ruleToIdx) ->
        if Utils.containsP RuleT.equal rulesToKeep rule then
          (g, ruleToIdx)
        else
          (G.remove_vertex g (RuleMap.find rule ruleToIdx),
           RuleMap.remove rule ruleToIdx))
      ruleToIdx
      (g, ruleToIdx)

  (* compute predecessors of rules *)
  let getPreds (g, ruleToIdx) rules =
    let predIdxs =
      List.fold_left
        (fun predIdxs rule ->
          G.fold_pred (fun predIdx predIdxs -> predIdx::predIdxs)
            g (RuleMap.find rule ruleToIdx) predIdxs)
        [] rules in
    idxsToRules ruleToIdx (Utils.remdup predIdxs)

  (* compute sucessors of rules *)
  let getSuccs (g, ruleToIdx) rules =
    let succIdxs =
      List.fold_left
        (fun succIdxs rule ->
          G.fold_succ
            (fun succIdx succIdxs -> succIdx::succIdxs)
            g (RuleMap.find rule ruleToIdx) succIdxs)
        [] rules in
    idxsToRules ruleToIdx (Utils.remdup succIdxs)

  (* determine whether there is an edge *)
  let hasEdge (g, ruleToIdx) rule1 rule2 =
    let rule1num = RuleMap.find rule1 ruleToIdx in
    let rule2num = RuleMap.find rule2 ruleToIdx in
    G.mem_edge g rule1num rule2num

  (* Compute rules in twigs *)
  let computeRulesInTwigs (g, ruleToIdx) =
    let leaves = ref [] in
    let progress = ref true in
    while !progress do
      let newLeaves =
        G.fold_vertex
          (fun idx newLeaves ->
            if Utils.contains !leaves idx then
              newLeaves
            else
              let reachable = G.fold_succ (fun succIdx succIdxs -> succIdx::succIdxs) g idx [] in
              if Utils.containsAll !leaves reachable then
                idx::newLeaves
              else
                newLeaves)
          g [] in
      if newLeaves = [] then
        progress := false
      else
        (
          progress := true;
          leaves := newLeaves @ !leaves
        )
    done;
    idxsToRules ruleToIdx !leaves
end
