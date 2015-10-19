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

module Int = struct
  type t = int
  let compare = compare
  let hash = Hashtbl.hash
  let equal = (=)
end

module G = Graph.Persistent.Digraph.Concrete(Int)

module SCC = Graph.Components.Make(G)

let rec toDot (g, trsa) =
  "digraph kittel {\n" ^
  (getNodes trsa) ^
  "\n" ^
  (getEdges g trsa) ^
  "\n\n}\n"
and getNodes trsa =
  let res = ref "" in
    for i = 0 to (Array.length trsa - 1) do
      res := !res ^ "\n  \"" ^ (Rule.toDotString (snd trsa.(i))) ^ "\""
    done;
    !res
and getEdges g trsa =
  let len = Array.length trsa
  and accu = ref [] in
    for i = 0 to (len - 1) do
      for j = 0 to (len - 1) do
        if G.mem_edge g (fst trsa.(i)) (fst trsa.(j)) then
          accu := !accu @ ["  \"" ^ (Rule.toDotString (snd trsa.(i))) ^ "\" -> \"" ^ (Rule.toDotString (snd trsa.(j))) ^ "\""]
      done
    done;
    String.concat "\n" !accu

(* Compute termination graph of trs *)
let rec compute trs =
  let len = List.length trs in
    let trsa = Array.init len (fun i -> (i, List.nth trs i))
    and edges = Array.make_matrix len len false in
      compute_edges edges trsa len;
      (create_graph len edges, trsa)
and compute_edges edges trsa len =
  for i = 0 to (len - 1) do
    let r1 = (snd trsa.(i)) in
      for j = 0 to (len - 1) do
        if connectable r1 (snd trsa.(j)) then
          edges.(i).(j) <- true
      done
  done
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
and connectable r1 r2' =
  let r2 = Rule.renameVars (Rule.getVars r1) r2' in
    let rt = Rule.getRight r1
    and lt = Rule.getLeft r2 in
      if (Term.getFun rt) <> (Term.getFun lt) then
        false
      else
        let rargs = Term.getArgs rt
        and largs = Term.getArgs lt
        and c1 = Rule.getCond r1
        and c2 = Rule.getCond r2 in
          let sigma = getSubstitution largs rargs in
            let c2sigma = Pc.instantiate c2 sigma in
              Smt.isSatisfiable (Pc.dropNonLinearAtoms (c1 @ c2sigma)) <> Ynm.No
and getSubstitution largs rargs =
  getSubstitutionAux largs rargs []
and getSubstitutionAux largs rargs accu =
  match largs with
    | [] -> accu
    | x::l -> getSubstitutionAux l (List.tl rargs) ((List.hd (Poly.getVars x), List.hd rargs)::accu)

(* Return nontrivial SCCs *)
let rec getNontrivialSccs (g, trsa) =
  let sccs = SCC.scc_list g in
    let nontrivial = List.filter (nontrivial g) sccs in
      List.map (fun scc -> getTrsScc trsa scc) nontrivial
and nontrivial g scc =
  match scc with
    | [] -> false
    | [x] -> G.mem_edge g x x
    | _ -> true
and getTrsScc trsa nums =
  let res = ref [] in
    for j = 0 to (Array.length trsa - 1) do
      let elem = trsa.(j) in
        if Utils.contains nums (fst elem) then
          res := (snd elem)::!res
    done;
    List.rev !res

(* remove nodes *)
let rec removeNodes (g, trsa) rules =
  let bad = getPairs trsa rules in
    let res = (removeFromGraph g (List.map snd bad), removeFromArray trsa (List.map fst bad)) in
      res
and removeFromGraph g toRemove =
  match toRemove with
    | [] -> g
    | i::more -> removeFromGraph (G.remove_vertex g i) more
and removeFromArray trsa badnums =
  let res = ref [] in
    for i = 0 to (Array.length trsa) - 1 do
      if not (Utils.contains badnums i) then
        res := (trsa.(i))::!res
    done;
    Array.of_list (List.rev !res)
and getPairs trsa rules =
  let res = ref [] in
    for i = 0 to (Array.length trsa) - 1 do
      let entry = trsa.(i) in
        if (Trs.contains rules (snd entry)) then
          res := (i, fst entry)::!res
    done;
    !res

(* add nodes *)
let rec addNodes (g, trsa) rules =
  let maxx = getMaxNum trsa in
    let news = getNewPairs rules (maxx + 1) in
      let (g', trsa') = (addToGraph g (List.map fst news), addToArray trsa news) in
        let res = (addNeededEdges g' trsa' news, trsa') in
          res
and getMaxNum trsa =
  let res = ref 0 in
    for i = 0 to (Array.length trsa - 1) do
      let entry = trsa.(i) in
        if (fst entry) > !res then
          res := fst entry
    done;
    !res
and getNewPairs rules j =
  match rules with
    | [] -> []
    | rule::more -> (j, rule)::(getNewPairs more (j + 1))
and addToGraph g nums =
  match nums with
    | [] -> g
    | i::more -> addToGraph (G.add_vertex g i) more
and addNeededEdges g trsa news =
  match news with
    | [] -> g
    | irule::more -> addNeededEdges (addNeededEdgesOne g trsa irule) trsa more
and addNeededEdgesOne g trsa (i, rule) =
  let res = ref g in
    if connectable rule rule then
      res := G.add_edge !res i i;
    for j = 0 to (Array.length trsa - 1) do
      let entry = trsa.(j) in
        if i <> (fst entry) then
        (
          if connectable rule (snd entry) then
            res := G.add_edge !res i (fst entry);
          if connectable (snd entry) rule then
            res := G.add_edge !res (fst entry) i
        )
    done;
    !res
and addToArray trsa news =
  let trsa' = Array.init (List.length news) (fun i -> List.nth news i) in
    Array.append trsa trsa'

(* only keep certain nodes *)
let rec keepNodes (g, trsa) rules =
  let bad = getComplementPairs trsa rules in
    (removeFromGraph g (List.map snd bad), removeFromArray trsa (List.map fst bad))
and getComplementPairs trsa rules =
  let res = ref [] in
    for i = 0 to (Array.length trsa) - 1 do
      let entry = trsa.(i) in
        if not (Trs.contains rules (snd entry)) then
          res := (i, fst entry)::!res
    done;
    !res
