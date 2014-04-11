
open AbstractRule

module Make(RuleT : AbstractRule) = struct
  module RVG = Rvgraph.Make(RuleT)
  module LSC = LocalSizeComplexity.Make(RuleT)
  module CTRS = Ctrs.Make(RuleT)
  module G = Graph.Persistent.Digraph.Concrete(Tgraph.Int)

  (* computes global size complexities for result variables *)
  let rec computeGlobalSizeComplexities rvgraph rc g vars =
    let condensed = RVG.condense rvgraph in
      let topo = RVG.getNodesInTopologicalOrder condensed in
        let sccs_with_gsb = attachGlobalSizeComplexities topo condensed rc g rvgraph vars in
          List.rev (List.flatten (List.map (fun (scc, gsb) -> List.map (fun (rule, ((i, j), _)) -> (rule, ((i, j), gsb))) scc) sccs_with_gsb))
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
            let preds = RVG.getPreds rvgraph scc in
              if preds = [] then
                lsc
              else
                let sortedPreds = sortPreds preds (snd lsc) in
                  let plugins = getPlugins sortedPreds vars accu
                  and outer = LSC.toSmallestComplexity lsc vars
                  and activeVars = List.map (List.nth vars) (snd lsc) in
                    let plugged = List.map (plug_them_in outer activeVars) plugins in
                      LSC.listMax (List.map (fun x -> c2lsc x vars) plugged) vars
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
      | d::rest -> if d = snd (fst (snd p)) then
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
      | [x] -> List.map (fun y -> [LSC.toSmallestComplexity (getGSCForOne accu y) vars]) x
      | x::rest -> let tmp = getPlugins rest vars accu in
                     List.flatten (List.map (fun y -> insertIntoAll (LSC.toSmallestComplexity (getGSCForOne accu y) vars) tmp) x)
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
    LSC.complexity2localcomplexity c vars
  and getSccLeftFuns  scc =
    List.map (fun (rule, _) -> Term.getFun (RuleT.getLeft rule)) scc
  and getPol c =
    match c with
      | Complexity.P p -> p
      | Complexity.Unknown -> failwith "Internal error in Crvgraph.getPol"
  and getLSC (_, (_, lsc)) =
    lsc

  and gscForNonTrivialScc scc condensed rc rvgraph vars accu =
    if List.exists isTooBig scc then
      (LSC.Unknown, [])
    else
      let possiblyScaledSumPlusConstants = List.filter isPossiblyScaledSumPlusConstant scc in
        let v_betas = List.map (get_v_beta rvgraph scc) possiblyScaledSumPlusConstants
        and sccpreds = getCondensedPreds condensed [scc]
        and maxs = List.filter isMax scc
        and maxPlusConstants = List.filter isMaxPlusConstant scc in
          let first = LSC.listMax ((List.map (fun scc -> getGSC accu scc) sccpreds) @ (List.map getAsPol maxs)) vars
          and second = c2lsc (Complexity.listAdd (List.map (getMaxPlusConstantTerm rc vars) maxPlusConstants)) vars
          and third = c2lsc (Complexity.listAdd (List.map2 (getPossiblyScaledSumPlusConstantTerm rc rvgraph scc vars accu) possiblyScaledSumPlusConstants v_betas)) vars in
            let sum = LSC.addList [first;second;third] vars in
              let firstMult = getScaleProduct rc possiblyScaledSumPlusConstants v_betas
              and secondMult = getVarsizeProduct rc possiblyScaledSumPlusConstants v_betas in
                let factor = Complexity.mult firstMult secondMult in
                  let res = c2lsc (Complexity.mult factor (LSC.toSmallestComplexity sum vars)) vars in
                    res
  and getVarsizeProduct rc ruleWithLSCs v_betas =
    List.fold_left Complexity.mult (Complexity.P Expexp.one) (List.map2 (getVarsizeFactor rc) ruleWithLSCs v_betas)
  and getVarsizeFactor rc ruleWithLSC v_beta =
    let num = List.length v_beta
    and r = CTRS.getComplexity rc (fst ruleWithLSC) in
      if num < 2 then
        Complexity.P (Expexp.one)
      else if r = Complexity.Unknown then
        Complexity.Unknown
      else
        Complexity.P (Expexp.Exp (Expexp.fromConstant (Big_int.big_int_of_int num), Complexity.getExpexp r))
  and getScaleProduct rc ruleWithLSCs v_betas =
    List.fold_left Complexity.mult (Complexity.P Expexp.one) (List.map2 (getScaleFactor rc) ruleWithLSCs v_betas)
  and getScaleFactor rc ruleWithLSC v_beta =
    let s = LSC.getS (snd (snd ruleWithLSC))
    and r = CTRS.getComplexity rc (fst ruleWithLSC) in
      if Big_int.eq_big_int s Big_int.unit_big_int || Big_int.eq_big_int s Big_int.zero_big_int then
        Complexity.P (Expexp.one)
      else if r = Complexity.Unknown then
        Complexity.Unknown
      else
        Complexity.P (Expexp.Exp (Expexp.fromConstant s, Complexity.getExpexp r))
  and isTooBig ruleWithLSC =
    let lsc = getLSC (ruleWithLSC) in
      match lsc with
        | (LSC.Max _, _) -> false
        | (LSC.MaxPlusConstant _, _) -> false
        | (LSC.SumPlusConstant _, _) -> false
        | (LSC.ScaledSumPlusConstant _, _) -> false
        | (LSC.P p, _) -> not (LSC.isConstant lsc)
        | (LSC.Unknown, _) -> true
  and isPossiblyScaledSumPlusConstant ruleWithLSC =
    match (getLSC ruleWithLSC) with
      | (LSC.SumPlusConstant _, _) -> true
      | (LSC.ScaledSumPlusConstant _, _) -> true
      | _ -> false
  and isMaxPlusConstant ruleWithLSC =
    match (getLSC ruleWithLSC) with
      | (LSC.MaxPlusConstant _, _) -> true
      | _ -> false
  and isMax ruleWithLSC =
    match (getLSC ruleWithLSC) with
      | (LSC.Max _, _) -> true
      | _ -> false
  and get_v_beta rvgraph scc ruleWithLSC =
    let preds = List.filter (inScc scc) (RVG.getPreds rvgraph [ruleWithLSC]) in
      get_v_beta_nums preds
  and get_v_beta_nums preds =
    Utils.remdup (List.map (fun pred -> snd (fst (snd pred))) preds)
  and inScc scc rv =
    (List.exists (fun rv' -> (LSC.equalLSC (snd rv) (snd rv')) && ((fst rv) == (fst rv'))) scc) ||
    (List.exists (fun rv' -> (LSC.equalLSC (snd rv) (snd rv')) && (RuleT.equal (fst rv) (fst rv'))) scc)
  and isNone opt =
    match opt with
      | None -> true
      | Some _ -> false
  and getAsPol ruleWithLSC =
    let lsc = getLSC ruleWithLSC in
      (LSC.P (Expexp.fromConstant (LSC.getE lsc)), [])
  and getGSC accu scc =
    match accu with
      | [] -> failwith "Not found"
      | (scc', gsb)::rest -> if RVG.equalSccs scc scc' then
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
    let r = CTRS.getComplexity rc (fst ruleWithLSC)
    and e = LSC.toSmallestComplexity (getAsPol ruleWithLSC) vars in
      Complexity.mult r e
  and getPossiblyScaledSumPlusConstantTerm rc rvgraph scc vars accu ruleWithLSC v_beta =
    let r = CTRS.getComplexity rc (fst ruleWithLSC)
    and e = LSC.toSmallestComplexity (getAsPol ruleWithLSC) vars
    and preds = takeout (RVG.getPreds rvgraph [ruleWithLSC]) scc
    and beta_nums = (snd (snd (snd ruleWithLSC))) in
      let toSumFor = Utils.removeAll beta_nums v_beta in
        let sumTerm = Complexity.listAdd (List.map (getTermForSum preds vars accu) toSumFor) in
          let tmp = Complexity.add e sumTerm in
            Complexity.mult r tmp
  and getTermForSum preds vars accu i =
    let preds_i = List.filter (fun x -> snd (fst (snd x)) = i) preds in
      let tmp = List.map (fun pred -> getGSCForOne accu pred) preds_i in
        let tmp' = LSC.listMax tmp vars in
          LSC.toSmallestComplexity tmp' vars
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
        if (List.exists (RVG.equalSccs (fst (snd nodesa.(i)))) somenodes) then
          res := i::!res
      done;
      !res
  and computeCondensedPreds g nodesa len nodesnums preds =
    for i = 0 to (len - 1) do
      if (Utils.contains !nodesnums i) then
        for j = 0 to (len - 1) do
          if (hasCondensedEdgeNums g nodesa j i) then
            preds := j::!preds
        done;
    done
  and hasCondensedEdgeNums g nodesa i j =
    G.mem_edge g (fst nodesa.(i)) (fst nodesa.(j))
  and getSccsNums nodesa nums =
    List.map (fun i -> (fst (snd nodesa.(i)))) nums

  (** Find bound for the i-th variable in the j-th rhs of rule r *)
  let rec findFullEntry globalSizeComplexities rule j i =
    match globalSizeComplexities with
      | [] -> failwith "Did not find entry!"
      | (rule', ((j', i'), c))::rest -> if (j' = j) && (i' = i) && (RuleT.equal rule rule') then
                                   (rule', ((j', i'), c))
                                 else
                                   findFullEntry rest rule j i

  (** Find bound for the i-th variable in the j-th rhs of rule r *)
  let rec findEntry globalSizeComplexities rule j i vars =
    let (_, (_, c)) = findFullEntry globalSizeComplexities rule j i in
    LSC.toSmallestComplexity c vars

  (** Extract mapping for variables X_1 .. X_{length vars} to their 
      global size complexity after using the j-th rhs of rule r *)
  let extractSizeMapForRule globalSizeComplexities r j vars =
    List.mapi (fun i _ -> "X_" ^ (string_of_int (i + 1)), findEntry globalSizeComplexities r j i vars) vars

  (** Pretty-print list of (rule, rhs-num, arg-num, size complexity) tuples, where complexities are represented by their classes *)
  let rec dumpGSCs ruleWithGSCs =
    let dumpOneGSC (rule, gsb) =
      let dumpGSC (i, c) =
        (string_of_int i) ^ ": " ^ (LSC.toStringLocalComplexity c)
      in
      (RuleT.toString rule) ^ ":: " ^ (dumpGSC gsb)
    in
    String.concat "\n" (List.map dumpOneGSC ruleWithGSCs)

  (** Pretty-print list of (rule, rhs-num, arg-num, size complexity) tuples. *)
  let dumpGSCsAsComplexities ruleWithGSCs vars =
    let dumpOneGSCAsComplexity vars (rule, ((i, j), c)) =
      "\tS(" ^ (RuleT.toString rule) ^ ", " ^ (string_of_int i) ^ "-" ^ (string_of_int j) ^ ") = " ^ (Complexity.toString (LSC.toSmallestComplexity c vars))
    in
    String.concat "\n" (List.map (dumpOneGSCAsComplexity vars) ruleWithGSCs)

  (** Get list of entries (each a list for each argument) for each right hand side *)
  let getSizeComplexitiesForRule rule sizeComplexities =
    (** Get list of entries, one for each argument on the right hand side *)
    let getSizeComplexitiesForRule' rule sizeComplexities j (_, rhsArgs) =
      List.mapi (fun i _ -> findFullEntry sizeComplexities rule j i) rhsArgs
    in
    Utils.mapiFlat (getSizeComplexitiesForRule' rule sizeComplexities) (RuleT.getRights rule)

  (** Print out pretty-printed size complexities for variables vars in rules rcc *)
  let printSizeComplexities rcc sizeComplexities vars =
    let sortedSizeComplexities = Utils.mapFlat (fun (rule, _, _) -> getSizeComplexitiesForRule rule sizeComplexities) rcc in
    dumpGSCsAsComplexities sortedSizeComplexities vars
end
