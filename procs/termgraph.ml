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

let hasEdgeNums g trsa i j =
  G.mem_edge g (fst trsa.(i)) (fst trsa.(j))

(* Compute reachable nodes *)
let rec computeReachable (g, trsa) startNodes =
  let frontier = ref (getNums trsa startNodes)
  and reachable = ref (getNums trsa startNodes) in
    computeReachableAux g trsa (Array.length trsa) frontier reachable;
    getRules trsa !reachable
and computeReachableAux g trsa len frontier reachable =
  if computeReachableAuxStep g trsa len frontier reachable then
    computeReachableAux g trsa len frontier reachable
and computeReachableAuxStep g trsa len frontier reachable =
  let new_frontier = ref [] in
    for i = 0 to (len - 1) do
      if (isIn frontier i) then
        for j = 0 to (len - 1) do
          if hasEdgeNums g trsa i j && not (isIn reachable j) then
          (
            reachable := j::!reachable;
            new_frontier := j::!new_frontier
          )
        done;
    done;
    if !new_frontier = [] then
      false
    else
    (
      frontier := !new_frontier;
      true
    )
and isIn listref j =
  Utils.contains !listref j
and getNums trsa rules =
  let res = ref [] in
    for i = 0 to (Array.length trsa) - 1 do
      if (Trs.contains rules (snd trsa.(i))) then
        res := i::!res
    done;
    !res
and getRules trsa nums =
  List.map (fun i -> (snd trsa.(i))) nums

(* Compute rules in s that are subsumed by rules in k *)
let rec computeSubsumed (g, trsa) s k =
  let subsumed = ref []
  and sl = getNums trsa s
  and kl = getNums trsa k in
    computeSubsumedAux sl kl g trsa (Array.length trsa) subsumed;
    getRules trsa !subsumed
and computeSubsumedAux sl kl g trsa len subsumed =
  if computeSubsumedAuxStep sl kl g trsa len subsumed then
    computeSubsumedAux sl kl g trsa len subsumed
and computeSubsumedAuxStep sl kl g trsa len subsumed =
  let res = ref false in
    for i = 0 to (len - 1) do
      if (Utils.contains sl i) && (not (isK kl subsumed i)) then
        let goodrow = ref true in
          for j = 0 to (len - 1) do
            if hasEdgeNums g trsa j i && not (isK kl subsumed j) then
              goodrow := false
          done;
          if !goodrow then
          (
            subsumed := i::!subsumed;
            res := true
          )
    done;
    !res
and isK kl subsumed j =
  (Utils.contains !subsumed j) || (Utils.contains kl j)

(* Compute rules in twigs *)
let rec computeRulesInTwigs (g, trsa) =
  let leaves = ref [] in
    computeLeavesAux g trsa (Array.length trsa) leaves;
    getRules trsa !leaves
and computeLeavesAux g trsa len leaves =
  if computeLeavesAuxStep g trsa len leaves then
    computeLeavesAux g trsa len leaves
and computeLeavesAuxStep g trsa len leaves =
  let res = ref false in
    for i = 0 to (len - 1) do
      if not (isIn leaves i) then
        let goodrow = ref true in
          for j = 0 to (len - 1) do
            if hasEdgeNums g trsa i j && not (isIn leaves j) then
              goodrow := false
          done;
          if !goodrow then
          (
            leaves := i::!leaves;
            res := true
          )
    done;
    !res

(* Compute rules in stems and the stems *)
let rec computeStems (g, trsa) gfuns nonlinear =
  let linear = ref []
  and varsub = ref []
  and fun_in_g = ref []
  and roots = ref []
  and old_roots = ref []
  and level = ref 0 in
    if (not nonlinear) then
      linear := computeIsLinear trsa;
    varsub := computeVarSub trsa;
    fun_in_g := computeFunInG trsa gfuns;
    computeRootsAux g trsa (Array.length trsa) nonlinear roots old_roots linear varsub fun_in_g level;
    (getRules trsa (List.map fst !roots), getStems (getRulesWithLevels trsa !roots))
and computeIsLinear trsa =
  List.map (fun i -> (Rule.isRightLinear (snd trsa.(i)))) (Utils.getList 0 ((Array.length trsa) - 1))
and computeVarSub trsa =
  List.map (fun i -> (Rule.satisfiesVarCond (snd trsa.(i)))) (Utils.getList 0 ((Array.length trsa) - 1))
and computeFunInG trsa gfuns =
  List.map (fun i -> (Utils.contains gfuns (Term.getFun (Rule.getLeft (snd trsa.(i)))))) (Utils.getList 0 ((Array.length trsa) - 1))
and computeRootsAux g trsa len nonlinear roots old_roots linear varsub fun_in_g level =
  if computeRootsAuxStep g trsa len nonlinear roots old_roots linear varsub fun_in_g level then
  (
    incr level;
    old_roots := !roots;
    computeRootsAux g trsa len nonlinear roots old_roots linear varsub fun_in_g level
  )
and computeRootsAuxStep g trsa len nonlinear roots old_roots linear varsub fun_in_g level =
  let res = ref false in
    for i = 0 to (len - 1) do
      if (isTrue varsub i) && (nonlinear || (isTrue linear i)) && not (isRoot old_roots i) then
        let goodrow = ref true
        and hasPred = ref false in
          for j = 0 to (len - 1) do
            if hasEdgeNums g trsa j i then
            (
              hasPred := true;
              if not (isRoot old_roots j) then
                goodrow := false
            )
          done;
          if !goodrow && (!hasPred || (isTrue fun_in_g i)) then
          (
            roots := (i, !level)::!roots;
            res := true
          )
    done;
    !res
and isTrue listref i =
  List.nth !listref i
and isRoot old_roots j =
  List.exists (fun (i, _) -> i = j) !old_roots
and getRulesWithLevels trsa nls =
  List.map (fun (i, l) -> (snd trsa.(i), l)) nls
and getStems rls =
  match rls with
    | [] -> []
    | _ -> getStemsLoop rls 0
and getStemsLoop rls level =
  let levelRls = List.map fst (List.filter (fun (r, l) -> l = level) rls) in
    if levelRls = [] then
      []
    else
      let subStems = getStemsLoop rls (level + 1) in
        if subStems = [] then
          levelRls
        else
          chainAll levelRls subStems
and chainAll r1 r2 =
  match r1 with
    | [] -> []
    | r::rr -> chainAllOne r r2 []
and chainAllOne r r2 accu =
  match r2 with
    | [] -> accu
    | r'::rr -> match doChain r r' with
                  | None -> chainAllOne r rr accu
                  | Some newr -> chainAllOne r rr (newr::accu)
and doChain r r' =
  if (Term.getFun (Rule.getRight r)) = (Term.getFun (Rule.getLeft r')) then
    Some (buildNewRule r r')
  else
    None
and buildNewRule rule1 rule2 =
  let rule2' = Rule.renameVars (Rule.getVars rule1) rule2 in
    let subby = getSubstitution (Term.getArgs (Rule.getRight rule1)) (Term.getArgs (Rule.getLeft rule2')) in
      Rule.create
        (Rule.getLeft rule1)
        (Term.instantiate (Rule.getRight rule2') subby)
        (remdupC ((Rule.getCond rule1) @ (Pc.instantiate (Rule.getCond rule2') subby)))
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

(* compute exits of loop *)
let rec getExits (g, trsa) loop =
  let exits = ref []
  and loopnums = ref (getNums trsa loop) in
    computeExits g trsa (Array.length trsa) loopnums exits;
    getRules trsa (Utils.remdup !exits)
and computeExits g trsa len loopnums exits =
  for i = 0 to (len - 1) do
    if not (isIn loopnums i) then
      for j = 0 to (len - 1) do
        if (isIn loopnums j) && (hasEdgeNums g trsa j i) then
          exits := i::!exits
      done;
  done

(* compute predecessors of rules *)
let rec getPreds (g, trsa) rules =
  let preds = ref []
  and rulesnums = ref (getNums trsa rules) in
    computePreds g trsa (Array.length trsa) rulesnums preds;
    getRules trsa (Utils.remdup !preds)
and computePreds g trsa len rulesnums preds =
  for i = 0 to (len - 1) do
    if (isIn rulesnums i) then
      for j = 0 to (len - 1) do
        if (hasEdgeNums g trsa j i) then
          preds := j::!preds
      done;
  done

(* compute sucessors of rules *)
let rec getSuccs (g, trsa) rules =
  let succs = ref []
  and rulesnums = ref (getNums trsa rules) in
    computeSuccs g trsa (Array.length trsa) rulesnums succs;
    getRules trsa (Utils.remdup !succs)
and computeSuccs g trsa len rulesnums succs =
  for i = 0 to (len - 1) do
    if (isIn rulesnums i) then
      for j = 0 to (len - 1) do
        if (hasEdgeNums g trsa i j) then
          succs := j::!succs
      done;
  done

exception Found of int

(* determine whether there is an edge *)
let rec hasEdge (g, trsa) rule1 rule2 =
  let rule1num = getNum trsa rule1
  and rule2num = getNum trsa rule2 in
    hasEdgeNums g trsa rule1num rule2num
and getNum trsa rule =
  try
    for i = 0 to (Array.length trsa) - 1 do
      if (rule == (snd trsa.(i))) then
        raise (Found i)
    done;
    for i = 0 to (Array.length trsa) - 1 do
      if (Rule.equal rule (snd trsa.(i))) then
        raise (Found i)
    done;
    failwith "Did not find rule!"
  with
    | Found i -> i
