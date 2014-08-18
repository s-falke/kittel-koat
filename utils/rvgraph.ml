(*
  Result variable graph

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

module RV = struct
  module Make(RuleT : AbstractRule) = struct
    type t = RuleT.rule * Poly.var
    let compare (r1, v1) (r2, v2) =
      let vComp = String.compare v1 v2 in
      if vComp <> 0 then
        vComp
      else
        RuleT.compare r1 r2

    let equal (r1, v1) (r2, v2) =
      v1 = v2 && RuleT.equal r1 r2
  end
end

module Make (RuleT : AbstractRule) = struct
  module G = Graph.Persistent.Digraph.Concrete(Tgraph.Int)
  module SCC = Graph.Components.Make(G)
  module Topo = Graph.Topological.Make(G)
  module LSC = LocalSizeComplexity.Make(RuleT)
  module CTRS = Ctrs.Make(RuleT)
  module TGraph = Tgraph.Make(RuleT)

  module RV = RV.Make(RuleT)

  module RVMap = 
    Map.Make(struct 
      type t = RV.t
      let compare = RV.compare 
    end)


  let rec toDot (g, rva) =
    "digraph koat {\n" ^
    (getNodes rva) ^
    "\n" ^
    (getEdges g rva) ^
    "\n\n}\n"
  and getNodes rva =
    let res = ref "" in
      for i = 0 to (Array.length rva - 1) do
        res := !res ^ "\n  \"" ^ (LSC.dumpLSCDot (snd rva.(i))) ^ "\""
      done;
      !res
  and getEdges g rva =
    let len = Array.length rva
    and accu = ref [] in
      for i = 0 to (len - 1) do
        for j = 0 to (len - 1) do
          if G.mem_edge g (fst rva.(i)) (fst rva.(j)) then
            accu := !accu @ ["  \"" ^ (LSC.dumpLSCDot (snd rva.(i))) ^ "\" -> \"" ^ (LSC.dumpLSCDot (snd rva.(j))) ^ "\""]
        done
      done;
      String.concat "\n" !accu

  (* Compute rv graph *)
  let rec compute rvs tgraph =
    let len = List.length rvs in
      let rva = Array.init len (fun i -> (i, List.nth rvs i))
      and edges = Array.make_matrix len len false in
        compute_edges edges rva len tgraph;
        (create_graph len edges, rva)
  and compute_edges edges rva len tgraph =
    for i = 0 to (len - 1) do
      let r1 = fst (snd rva.(i))
      and argnum1 = fst (first (snd (snd rva.(i))))
      and num1 = snd (first (snd (snd rva.(i)))) in
        for j = 0 to (len - 1) do
          let r2 = fst (snd rva.(j))
          and dep2 = third (snd (snd rva.(j))) in
            let argterm = List.nth (RuleT.getRights r1) argnum1
            and c1 = RuleT.getCond r1
            and leftterm = RuleT.getLeft r2
            and c2 = RuleT.getCond r2 in
              if (TGraph.hasEdge tgraph r1 r2) && (Utils.contains dep2 num1) && (TGraph.connectableOne leftterm c1 c2 argterm) then
                edges.(i).(j) <- true
        done
    done
  and first (x, (_, _)) =
    x
  and second (_, (y, _)) =
    y
  and third (_, (_, z)) =
    z
  and create_graph len edges =
    let res = ref G.empty in
      for i = 0 to (len - 1) do
        res := G.add_vertex !res i
      done;
      for i = 0 to (len - 1) do
        for j = 0 to (len - 1) do
          if edges.(i).(j) then
            res := G.add_edge !res i j
        done
      done;
      !res

  exception Found of int

  (* determine whether there is an edge *)
  let rec hasEdge (g, rva) rv1 rv2 =
    let rv1num = getNum rva rv1
    and rv2num = getNum rva rv2 in
      G.mem_edge g (fst rva.(rv1num)) (fst rva.(rv2num))
  and getNum rva rv =
    let tmp1 = fst rv
    and tmp2 = snd rv in
      try
        for i = 0 to (Array.length rva) - 1 do
          if (rv == (snd rva.(i))) then
            raise (Found i)
        done;
        for i = 0 to (Array.length rva) - 1 do
          if (LSC.equalLSC tmp2 (snd (snd rva.(i)))) && (RuleT.equal tmp1 (fst (snd rva.(i)))) then
            raise (Found i)
        done;
        failwith "Did not find rv!"
      with
        | Found i -> i

  (* compute predecessors of rvs *)
  let rec getPreds (g, rva) rvs =
    let preds = ref []
    and rvsnums = ref (getNums rva rvs) in
      computePreds g rva (Array.length rva) rvsnums preds;
      getRvs rva (Utils.remdup !preds)
  and computePreds g rva len rvsnums preds =
    for i = 0 to (len - 1) do
      if (isIn rvsnums i) then
        for j = 0 to (len - 1) do
          if (hasEdgeNums g rva j i) then
            preds := j::!preds
        done;
    done
  and getNums rva rvs =
    let res = ref [] in
      for i = 0 to (Array.length rva) - 1 do
        let tmp = snd rva.(i) in
        if (List.exists (fun rv' -> (LSC.equalLSC (snd rv') (snd tmp)) && (RuleT.equal (fst rv') (fst tmp))) rvs) then
          res := i::!res
      done;
      !res
  and isIn listref j =
    Utils.contains !listref j
  and hasEdgeNums g rva i j =
    G.mem_edge g (fst rva.(i)) (fst rva.(j))
  and getRvs rva nums =
    List.map (fun i -> (snd rva.(i))) nums

  (* remove nodes *)
  let rec removeNodes (g, rva) rules =
    let bad = getPairs rva rules in
      (removeFromGraph g (List.map snd bad), removeFromArray rva (List.map fst bad))
  and removeFromGraph g toRemove =
    match toRemove with
      | [] -> g
      | i::more -> removeFromGraph (G.remove_vertex g i) more
  and removeFromArray rva badnums =
    let res = ref [] in
      for i = 0 to (Array.length rva) - 1 do
        if not (Utils.contains badnums i) then
          res := (rva.(i))::!res
      done;
      Array.of_list (List.rev !res)
  and getPairs rva rules =
    let res = ref [] in
      for i = 0 to (Array.length rva) - 1 do
        let entry = rva.(i) in
        let rule = fst (snd entry) in
          if (List.exists (fun rule' -> RuleT.equal rule rule') rules) then
            res := (i, fst entry)::!res
      done;
      !res

  (* add nodes *)
  let rec addNodes (g, rva) ruleWithLSCs tgraph =
    let maxx = getMaxNum rva in
      let news = getNewPairs ruleWithLSCs (maxx + 1) in
        let (g', rva') = (addToGraph g (List.map fst news), addToArray rva news) in
          let res = (addNeededEdges g' tgraph rva' news, rva') in
            res
  and getMaxNum rva =
    let res = ref 0 in
      for i = 0 to (Array.length rva - 1) do
        let entry = rva.(i) in
          if (fst entry) > !res then
            res := fst entry
      done;
      !res
  and getNewPairs ruleWithLSCs j =
    match ruleWithLSCs with
      | [] -> []
      | ruleWithLSC::more -> (j, ruleWithLSC)::(getNewPairs more (j + 1))
  and addToGraph g nums =
    match nums with
      | [] -> g
      | i::more -> addToGraph (G.add_vertex g i) more
  and addNeededEdges g tgraph rva news =
    match news with
      | [] -> g
      | iruleWithLSC::more -> addNeededEdges (addNeededEdgesOne g tgraph rva iruleWithLSC) tgraph rva more
  and addNeededEdgesOne g tgraph rva (i, (r1, lsc)) =
    let res = ref g
    and argnum1 = fst (first lsc)
    and num1 = snd (first lsc)
    and dep1 = third lsc in
      if (TGraph.hasEdge tgraph r1 r1) && (Utils.contains dep1 num1) then
        res := G.add_edge !res i i;
      for j = 0 to (Array.length rva - 1) do
        let r2 = fst (snd rva.(j))
        and argnum2 = fst (first (snd (snd (rva.(j)))))
        and num2 = snd (first (snd (snd (rva.(j)))))
        and dep2 = third (snd (snd rva.(j))) in
          let argterm1 = List.nth (RuleT.getRights r1) argnum1
          and leftterm1 = RuleT.getLeft r1
          and c1 = RuleT.getCond r1
          and argterm2 = List.nth (RuleT.getRights r2) argnum2
          and leftterm2 = RuleT.getLeft r2
          and c2 = RuleT.getCond r2 in
            if (TGraph.hasEdge tgraph r1 r2) && (Utils.contains dep2 num1) && (TGraph.connectableOne leftterm2 c1 c2 argterm1) then
              res := G.add_edge !res i (fst rva.(j));
            if (TGraph.hasEdge tgraph r2 r1) && (Utils.contains dep1 num2) && (TGraph.connectableOne leftterm1 c2 c1 argterm2) then
              res := G.add_edge !res (fst rva.(j)) i
      done;
      !res
  and addToArray rva news =
    let rva' = Array.init (List.length news) (fun i -> List.nth news i) in
      Array.append rva rva'

  and updateOptionRVGraph rvgraph toRemove toAdd updatedTGraph =
    match rvgraph with
    | None -> None
    | Some rvg -> 
      let toAddWithLSCs = LSC.computeLocalSizeComplexities toAdd in
      Some (addNodes (removeNodes rvg toRemove) toAddWithLSCs updatedTGraph)

  (* only keep certain nodes *)
  let rec keepNodes (g, rva) rules =
    let bad = getComplementPairs rva rules in
      (removeFromGraph g (List.map snd bad), removeFromArray rva (List.map fst bad))
  and getComplementPairs rva rules =
    let res = ref [] in
      for i = 0 to (Array.length rva) - 1 do
        let entry = rva.(i) in
        let rule = fst (snd entry) in
          if not (List.exists (fun rule' -> RuleT.equal rule rule') rules) then
            res := (i, fst entry)::!res
      done;
      !res

  (* Return all SCCs *)
  let rec getSccs (g, rva) =
    let sccs = SCC.scc_list g in
      List.map (getRvsScc rva) sccs
  and getRvsScc rva nums =
    let res = ref [] in
      for j = 0 to (Array.length rva - 1) do
        let elem = rva.(j) in
          if Utils.contains nums (fst elem) then
            res := (snd elem)::!res
      done;
      List.rev !res

  (* condense *)
  let rec condense rvgraph =
    let sccs = getSccs rvgraph in
      let len = List.length sccs in
        let nodesa = Array.init len (fun i -> (i, (List.nth sccs i, isTrivial (List.nth sccs i) rvgraph)))
        and edges = Array.make_matrix len len false in
          compute_condensed_edges edges nodesa len rvgraph;
          (create_graph len edges, nodesa)
  and compute_condensed_edges edges nodesa len rvgraph =
    for i = 0 to (len - 1) do
      for j = 0 to (len - 1) do
        if (i <> j) && hasSccEdge nodesa.(i) nodesa.(j) rvgraph then
          edges.(i).(j) <- true
      done
    done
  and hasSccEdge scc1 scc2 rvgraph =
    let scc1rvs = fst (snd scc1)
    and scc2rvs = fst (snd scc2) in
      let len1 = List.length scc1rvs
      and len2 = List.length scc2rvs in
        try
          for i = 0 to (len1 - 1) do
            let first = List.nth scc1rvs i in
              for j = 0 to (len2 - 1) do
                if (hasEdge rvgraph first (List.nth scc2rvs j)) then
                  raise (Found 0)
              done
          done;
          false
        with
          | Found _ -> true
  and isTrivial scc rvgraph =
    let len = List.length scc in
      len = 1 && (let rv = List.nth scc 0 in not (hasEdge rvgraph rv rv))
  and equalSccs scc1 scc2 =
    scc1 == scc2 || ((List.length scc1) = (List.length scc2) && (List.for_all2 (fun (r1, lsc1) (r2, lsc2) -> (LSC.equalLSC lsc1 lsc2) && (RuleT.equal r1 r2)) scc1 scc2))

  (* return nodes in topological order *)
  let rec getNodesInTopologicalOrder (g, nodesa) =
    let revtopo = Topo.fold (fun x l -> x::l) g [] in
      List.rev (List.map (getNodesTopo nodesa) revtopo)
  and getNodesTopo nodesa num =
    let res = ref None in
      for j = 0 to (Array.length nodesa - 1) do
        let elem = nodesa.(j) in
          if num = (fst elem) then
            res := Some (snd elem)
      done;
      Utils.unboxOption !res

  let rec condensedToDot (g, nodesa) =
    "digraph koat {\n" ^
    (getCondensedNodes nodesa) ^
    "\n" ^
    (getCondensedEdges g nodesa) ^
    "\n\n}\n"
  and dumpScc (scc, trivial) =
    "{ " ^ (String.concat "; " (List.map LSC.dumpLSCDot scc)) ^ " }" ^ (if trivial then " *" else "")
  and getCondensedNodes nodesa =
    let res = ref "" in
      for i = 0 to (Array.length nodesa - 1) do
        res := !res ^ "\n  \"" ^ (dumpScc (snd nodesa.(i))) ^ "\""
      done;
      !res
  and getCondensedEdges g nodesa =
    let len = Array.length nodesa
    and accu = ref [] in
      for i = 0 to (len - 1) do
        for j = 0 to (len - 1) do
          if G.mem_edge g (fst nodesa.(i)) (fst nodesa.(j)) then
            accu := !accu @ ["  \"" ^ (dumpScc (snd nodesa.(i))) ^ "\" -> \"" ^ (dumpScc (snd nodesa.(j))) ^ "\""]
        done
      done;
      String.concat "\n" !accu

  and getCondensedPreds (g, nodesa) somenodes =
    let preds = ref []
    and somenums = ref (getCondensedNums nodesa somenodes) in
      computeCondensedPreds g nodesa (Array.length nodesa) somenums preds;
      getSccsNums nodesa (Utils.remdup !preds)
  and getCondensedNums nodesa somenodes =
    let res = ref [] in
      for i = 0 to (Array.length nodesa) - 1 do
        if (List.exists (equalSccs (fst (snd nodesa.(i)))) somenodes) then
          res := i::!res
      done;
      !res
  and computeCondensedPreds g nodesa len nodesnums preds =
    for i = 0 to (len - 1) do
      if (isIn nodesnums i) then
        for j = 0 to (len - 1) do
          if (hasCondensedEdgeNums g nodesa j i) then
            preds := j::!preds
        done;
    done
  and hasCondensedEdgeNums g nodesa i j =
    G.mem_edge g (fst nodesa.(i)) (fst nodesa.(j))
  and getSccsNums nodesa nums =
    List.map (fun i -> (fst (snd nodesa.(i)))) nums
end
