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

module Int = struct
  type t = int
  let compare = compare
  let hash = Hashtbl.hash
  let equal = (=)
end

module G = Graph.Persistent.Digraph.Concrete(Int)

module SCC = Graph.Components.Make(G)
module Topo = Graph.Topological.Make(G)

let rec toDot (g, rva) =
  "digraph koat {\n" ^
  (getNodes rva) ^
  "\n" ^
  (getEdges g rva) ^
  "\n\n}\n"
and getNodes rva =
  let res = ref "" in
    for i = 0 to (Array.length rva - 1) do
      res := !res ^ "\n  \"" ^ (Clocalsizecomplexity.dumpLSCDot (snd rva.(i))) ^ "\""
    done;
    !res
and getEdges g rva =
  let len = Array.length rva
  and accu = ref [] in
    for i = 0 to (len - 1) do
      for j = 0 to (len - 1) do
        if G.mem_edge g (fst rva.(i)) (fst rva.(j)) then
          accu := !accu @ ["  \"" ^ (Clocalsizecomplexity.dumpLSCDot (snd rva.(i))) ^ "\" -> \"" ^ (Clocalsizecomplexity.dumpLSCDot (snd rva.(j))) ^ "\""]
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
    and num1 = first (snd (snd rva.(i))) in
      for j = 0 to (len - 1) do
        let r2 = fst (snd rva.(j))
        and dep2 = third (snd (snd rva.(j))) in
          if (Termgraph.hasEdge tgraph r1 r2) && (Utils.contains dep2 num1) then
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
        if (Clocalsizecomplexity.equalLSC tmp2 (snd (snd rva.(i)))) && (Rule.equal tmp1 (fst (snd rva.(i)))) then
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
      if (List.exists (fun rv' -> (Clocalsizecomplexity.equalLSC (snd rv') (snd tmp)) && (Rule.equal (fst rv') (fst tmp))) rvs) then
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
        if (Trs.contains rules (fst (snd entry))) then
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
  and num1 = first lsc
  and dep1 = third lsc in
    if (Termgraph.hasEdge tgraph r1 r1) && (Utils.contains dep1 num1) then
      res := G.add_edge !res i i;
    for j = 0 to (Array.length rva - 1) do
      let r2 = fst (snd rva.(j))
      and num2 = first (snd (snd (rva.(j))))
      and dep2 = third (snd (snd rva.(j))) in
        if (Termgraph.hasEdge tgraph r1 r2) && (Utils.contains dep2 num1) then
          res := G.add_edge !res i (fst rva.(j));
        if (Termgraph.hasEdge tgraph r2 r1) && (Utils.contains dep1 num2) then
          res := G.add_edge !res (fst rva.(j)) i
    done;
    !res
and addToArray rva news =
  let rva' = Array.init (List.length news) (fun i -> List.nth news i) in
    Array.append rva rva'

(* only keep certain nodes *)
let rec keepNodes (g, rva) rules =
  let bad = getComplementPairs rva rules in
    (removeFromGraph g (List.map snd bad), removeFromArray rva (List.map fst bad))
and getComplementPairs rva rules =
  let res = ref [] in
    for i = 0 to (Array.length rva) - 1 do
      let entry = rva.(i) in
        if not (Trs.contains rules (fst (snd entry))) then
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
  scc1 == scc2 || ((List.length scc1) = (List.length scc2) && (List.for_all2 (fun (r1, lsc1) (r2, lsc2) -> (Clocalsizecomplexity.equalLSC lsc1 lsc2) && (Rule.equal r1 r2)) scc1 scc2))

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
    getOut !res
and getOut o =
  match o with
    | Some p -> p
    | None -> failwith "Not found!"

let rec condensedToDot (g, nodesa) =
  "digraph koat {\n" ^
  (getCondensedNodes nodesa) ^
  "\n" ^
  (getCondensedEdges g nodesa) ^
  "\n\n}\n"
and dumpScc (scc, trivial) =
  "{ " ^ (String.concat "; " (List.map Clocalsizecomplexity.dumpLSCDot scc)) ^ " }" ^ (if trivial then " *" else "")
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

(* computes global size complexities for result variables *)
let rec computeGlobalSizeComplexities rvgraph rc g vars =
  let condensed = condense rvgraph in
    let topo = getNodesInTopologicalOrder condensed in
      let sccs_with_gsb = attachGlobalSizeComplexities topo condensed rc g rvgraph vars in
        List.rev (List.flatten (List.map (fun (scc, gsb) -> List.map (fun (rule, (i, _)) -> (rule, (i, gsb))) scc) sccs_with_gsb))
and attachGlobalSizeComplexities topo condensed rc g rvgraph vars =
  attachGlobalSizeComplexitiesAux topo condensed rc g rvgraph vars []
and attachGlobalSizeComplexitiesAux topo condensed rc g rvgraph vars accu =
  match topo with
    | [] -> accu
    | (scc, trivial)::rest -> let gsb = computeGlobalSizeBound scc trivial condensed rc g rvgraph vars accu in
                                attachGlobalSizeComplexitiesAux rest condensed rc g rvgraph vars ((scc, gsb)::accu)
and computeGlobalSizeBound scc trivial condensed rc g rvgraph vars accu =
  let hasStartNode = List.exists (fun f -> f = g) (getSccLeftFuns scc) in
    if trivial then
      let lsc = getLSC (List.hd scc) in
        if hasStartNode then
          lsc
        else
          let preds = getPreds rvgraph scc in
            if preds = [] then
              lsc
            else
              let sortedPreds = sortPreds preds (snd lsc) in
                let plugins = getPlugins sortedPreds vars accu
                and outer = Clocalsizecomplexity.toSmallestComplexity lsc vars
                and activeVars = List.map (List.nth vars) (snd lsc) in
                  let plugged = List.map (plug_them_in outer activeVars) plugins in
                    Clocalsizecomplexity.listMax (List.map (fun x -> c2lsc x vars) plugged) vars
    else
      gscForNonTrivialScc scc condensed rc rvgraph vars accu
and sortPreds preds deps =
  sortPredsAux preds deps (getEmptyLists (List.length deps))
and sortPredsAux preds deps ret =
  match preds with
    | [] -> ret
    | p::rest -> sortPredsAux rest deps (insertInRet deps ret p)
and insertInRet deps ret p =
  match deps with
    | [] -> failwith "internal error in Crvgraph.insertInRet"
    | d::rest -> if d = (fst (snd p)) then
                   (p::(List.hd ret))::(List.tl ret)
                 else
                   (List.hd ret)::(insertInRet rest (List.tl ret) p)
and getEmptyLists n =
  if n <= 0 then
    []
  else
    []::(getEmptyLists (n - 1))
and getPlugins sortedPreds vars accu =
  match sortedPreds with
    | [] -> []
    | [x] -> List.map (fun y -> [Clocalsizecomplexity.toSmallestComplexity (getGSCForOne accu y) vars]) x
    | x::rest -> let tmp = getPlugins rest vars accu in
                   List.flatten (List.map (fun y -> insertIntoAll (Clocalsizecomplexity.toSmallestComplexity (getGSCForOne accu y) vars) tmp) x)
and insertIntoAll y tmp =
  match tmp with
    | [] -> []
    | z::rest -> (y::z)::(insertIntoAll y rest)
and plug_them_in outer vars plugin =
  let compose = Complexity.apply (getPol outer) (getBinding vars plugin) in
    compose
and getBinding vars plugin =
  List.map2 (fun x y -> (x, y)) vars plugin
and c2lsc c vars =
  Clocalsizecomplexity.complexity2localcomplexity c vars
and getSccLeftFuns  scc =
  List.map (fun (rule, _) -> Term.getFun (Rule.getLeft rule)) scc
and getPol c =
  match c with
    | Complexity.P p -> p
    | Complexity.Unknown -> failwith "Internal error in Crvgraph.getPol"
and getLSC (_, (_, lsc)) =
  lsc

and gscForNonTrivialScc scc condensed rc rvgraph vars accu =
  if List.exists isTooBig scc then
    (Clocalsizecomplexity.Unknown, [])
  else
    let possiblyScaledSumPlusConstants = List.filter isPossiblyScaledSumPlusConstant scc in
      let v_betas = List.map (get_v_beta rvgraph scc) possiblyScaledSumPlusConstants
      and sccpreds = getCondensedPreds condensed [scc]
      and maxs = List.filter isMax scc
      and maxPlusConstants = List.filter isMaxPlusConstant scc in
        let first = Clocalsizecomplexity.listMax ((List.map (fun scc -> getGSC accu scc) sccpreds) @ (List.map getAsPol maxs)) vars
        and second = c2lsc (Complexity.listAdd (List.map (getMaxPlusConstantTerm rc vars) maxPlusConstants)) vars
        and third = c2lsc (Complexity.listAdd (List.map2 (getPossiblyScaledSumPlusConstantTerm rc rvgraph scc vars accu) possiblyScaledSumPlusConstants v_betas)) vars in
          let sum = Clocalsizecomplexity.addList [first;second;third] vars in
            let firstMult = getScaleProduct rc possiblyScaledSumPlusConstants v_betas
            and secondMult = getVarsizeProduct rc possiblyScaledSumPlusConstants v_betas in
              let factor = Complexity.mult firstMult secondMult in
                let res = c2lsc (Complexity.mult factor (Clocalsizecomplexity.toSmallestComplexity sum vars)) vars in
                  res
and getVarsizeProduct rc ruleWithLSCs v_betas =
  List.fold_left Complexity.mult (Complexity.P Expexp.one) (List.map2 (getVarsizeFactor rc) ruleWithLSCs v_betas)
and getVarsizeFactor rc ruleWithLSC v_beta =
  let num = List.length v_beta
  and r = Cprob.getComplexity rc (fst ruleWithLSC) in
    if num < 2 then
      Complexity.P (Expexp.one)
    else if r = Complexity.Unknown then
      Complexity.Unknown
    else
      Complexity.P (Expexp.Exp (Expexp.fromConstant (Big_int.big_int_of_int num), Complexity.getExpexp r))
and getScaleProduct rc ruleWithLSCs v_betas =
  List.fold_left Complexity.mult (Complexity.P Expexp.one) (List.map2 (getScaleFactor rc) ruleWithLSCs v_betas)
and getScaleFactor rc ruleWithLSC v_beta =
  let s = Clocalsizecomplexity.getS (snd (snd ruleWithLSC))
  and r = Cprob.getComplexity rc (fst ruleWithLSC) in
    if Big_int.eq_big_int s Big_int.unit_big_int || Big_int.eq_big_int s Big_int.zero_big_int then
      Complexity.P (Expexp.one)
    else if r = Complexity.Unknown then
      Complexity.Unknown
    else
      Complexity.P (Expexp.Exp (Expexp.fromConstant s, Complexity.getExpexp r))
and isTooBig ruleWithLSC =
  let lsc = getLSC (ruleWithLSC) in
    match lsc with
      | (Clocalsizecomplexity.Max _, _) -> false
      | (Clocalsizecomplexity.MaxPlusConstant _, _) -> false
      | (Clocalsizecomplexity.SumPlusConstant _, _) -> false
      | (Clocalsizecomplexity.ScaledSumPlusConstant _, _) -> false
      | (Clocalsizecomplexity.P p, _) -> not (Clocalsizecomplexity.isConstant lsc)
      | (Clocalsizecomplexity.Unknown, _) -> true
and isPossiblyScaledSumPlusConstant ruleWithLSC =
  match (getLSC ruleWithLSC) with
    | (Clocalsizecomplexity.SumPlusConstant _, _) -> true
    | (Clocalsizecomplexity.ScaledSumPlusConstant _, _) -> true
    | _ -> false
and isMaxPlusConstant ruleWithLSC =
  match (getLSC ruleWithLSC) with
    | (Clocalsizecomplexity.MaxPlusConstant _, _) -> true
    | _ -> false
and isMax ruleWithLSC =
  match (getLSC ruleWithLSC) with
    | (Clocalsizecomplexity.Max _, _) -> true
    | _ -> false
and get_v_beta rvgraph scc ruleWithLSC =
  let preds = List.filter (inScc scc) (getPreds rvgraph [ruleWithLSC]) in
    get_v_beta_nums preds
and get_v_beta_nums preds =
  Utils.remdup (List.map (fun pred -> fst (snd pred)) preds)
and inScc scc rv =
  (List.exists (fun rv' -> (Clocalsizecomplexity.equalLSC (snd rv) (snd rv')) && ((fst rv) == (fst rv'))) scc) ||
  (List.exists (fun rv' -> (Clocalsizecomplexity.equalLSC (snd rv) (snd rv')) && (Rule.equal (fst rv) (fst rv'))) scc)
and isNone opt =
  match opt with
    | None -> true
    | Some _ -> false
and getAsPol ruleWithLSC =
  let lsc = getLSC ruleWithLSC in
    (Clocalsizecomplexity.P (Expexp.fromConstant (Clocalsizecomplexity.getE lsc)), [])
and getGSC accu scc =
  match accu with
    | [] -> failwith "Not found"
    | (scc', gsb)::rest -> if equalSccs scc scc' then
                             gsb
                           else
                             getGSC rest scc
and getGSCForOne accu rv =
  match accu with
    | [] -> failwith "Not found"
    | (scc, gsb)::rest -> if inScc scc rv then
                            gsb
                          else
                            getGSCForOne rest rv
and getMaxPlusConstantTerm rc vars ruleWithLSC =
  let r = Cprob.getComplexity rc (fst ruleWithLSC)
  and e = Clocalsizecomplexity.toSmallestComplexity (getAsPol ruleWithLSC) vars in
    Complexity.mult r e
and getPossiblyScaledSumPlusConstantTerm rc rvgraph scc vars accu ruleWithLSC v_beta =
  let r = Cprob.getComplexity rc (fst ruleWithLSC)
  and e = Clocalsizecomplexity.toSmallestComplexity (getAsPol ruleWithLSC) vars
  and preds = takeout (getPreds rvgraph [ruleWithLSC]) scc
  and beta_nums = (snd (snd (snd ruleWithLSC))) in
    let toSumFor = Utils.removeAll beta_nums v_beta in
      let sumTerm = Complexity.listAdd (List.map (getTermForSum preds vars accu) toSumFor) in
        let tmp = Complexity.add e sumTerm in
          Complexity.mult r tmp
and getTermForSum preds vars accu i =
  let preds_i = List.filter (fun x -> fst (snd x) = i) preds in
    let tmp = List.map (fun pred -> getGSCForOne accu pred) preds_i in
      let tmp' = Clocalsizecomplexity.listMax tmp vars in
        Clocalsizecomplexity.toSmallestComplexity tmp' vars
and takeout rvs scc =
  List.filter (fun rv -> not (inScc scc rv)) rvs

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
