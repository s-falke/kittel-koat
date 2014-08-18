
open AbstractRule

module Make(RuleT : AbstractRule) = struct
  module RVG = Rvgraph.Make(RuleT)
  module LSC = LocalSizeComplexity.Make(RuleT)
  module CTRSObl = Ctrsobl.Make(RuleT)
  module CTRS = CTRSObl.CTRS
  module G = Graph.Persistent.Digraph.Concrete(Tgraph.Int)

  open CTRSObl
  open CTRS

  module RVMap = 
    Map.Make(
      struct type t = RuleT.rule * (int * int)
      let compare (r1, (rhsIdx1, varIdx1)) (r2, (rhsIdx2, varIdx2)) = 
        let rComp = compare rhsIdx1 rhsIdx2 in
        if rComp <> 0 then
          rComp
        else 
          let vComp = compare varIdx1 varIdx2 in
            if vComp <> 0 then
              vComp
            else
              RuleT.compare r1 r2
    end)

  let getLSC (_, (_, lsc)) =
    lsc

  let rec c2lsc c vars =
    LSC.complexity2localcomplexity c vars
  and getPol c =
    match c with
      | Complexity.P p -> p
      | Complexity.Unknown -> failwith "Internal error in Crvgraph.getPol"

  and gscForNonTrivialScc ctrsobl rvgraph condensed scc accu =
    if List.exists isTooBig scc then
      (LSC.Unknown, [])
    else
      let vars = CTRS.getVars ctrsobl.ctrs in
      let possiblyScaledSumPlusConstants = List.filter isPossiblyScaledSumPlusConstant scc in
        let v_betas = List.map (get_v_beta rvgraph scc) possiblyScaledSumPlusConstants
        and sccpreds = getCondensedPreds condensed [scc]
        and maxs = List.filter isMax scc
        and maxPlusConstants = List.filter isMaxPlusConstant scc in
          let first = LSC.listMax ((List.map (fun scc -> getGSC accu scc) sccpreds) @ (List.map getAsPol maxs)) vars
          and second = c2lsc (Complexity.listAdd (List.map (getMaxPlusConstantTerm ctrsobl vars) maxPlusConstants)) vars
          and third = c2lsc (Complexity.listAdd (List.map2 (getPossiblyScaledSumPlusConstantTerm ctrsobl rvgraph scc vars accu) possiblyScaledSumPlusConstants v_betas)) vars in
            let sum = LSC.addList [first;second;third] vars in
              let firstMult = getScaleProduct ctrsobl possiblyScaledSumPlusConstants v_betas
              and secondMult = getVarsizeProduct ctrsobl possiblyScaledSumPlusConstants v_betas in
                let factor = Complexity.mult firstMult secondMult in
                  let res = c2lsc (Complexity.mult factor (LSC.toSmallestComplexity sum vars)) vars in
                    res
  and getVarsizeProduct ctrsobl ruleWithLSCs v_betas =
    List.fold_left Complexity.mult (Complexity.P Expexp.one) (List.map2 (getVarsizeFactor ctrsobl) ruleWithLSCs v_betas)
  and getVarsizeFactor ctrsobl ruleWithLSC v_beta =
    let num = List.length v_beta
    and r = CTRSObl.getComplexity ctrsobl (fst ruleWithLSC) in
      if num < 2 then
        Complexity.P (Expexp.one)
      else if r = Complexity.Unknown then
        Complexity.Unknown
      else
        Complexity.P (Expexp.Exp (Expexp.fromConstant (Big_int.big_int_of_int num), Complexity.getExpexp r))
  and getScaleProduct ctrsobl ruleWithLSCs v_betas =
    List.fold_left Complexity.mult (Complexity.P Expexp.one) (List.map2 (getScaleFactor ctrsobl) ruleWithLSCs v_betas)
  and getScaleFactor ctrsobl ruleWithLSC v_beta =
    let s = LSC.getS (snd (snd ruleWithLSC))
    and r = CTRSObl.getComplexity ctrsobl (fst ruleWithLSC) in
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
  and getMaxPlusConstantTerm ctrsobl vars ruleWithLSC =
    let r = CTRSObl.getComplexity ctrsobl (fst ruleWithLSC)
    and e = LSC.toSmallestComplexity (getAsPol ruleWithLSC) vars in
      Complexity.mult r e
  and getPossiblyScaledSumPlusConstantTerm ctrsobl rvgraph scc vars accu ruleWithLSC v_beta =
    let r = CTRSObl.getComplexity ctrsobl (fst ruleWithLSC)
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

  let collectPreds preds activeVarIdxs =
    let rec insertInRet activeVarIdxs ret p =
      match activeVarIdxs with
      | [] -> failwith "internal error in Crvgraph.insertInRet"
      | varNum::rest -> if varNum = snd (fst (snd p)) then
          (p::(List.hd ret))::(List.tl ret)
        else
          (List.hd ret)::(insertInRet rest (List.tl ret) p) in
    let rec getNEmptyLists' n res=
      if n <= 0 then
        res
      else
        getNEmptyLists' (n - 1) ([]::res) in
    List.fold_left (fun ret p -> insertInRet activeVarIdxs ret p) (getNEmptyLists' (List.length activeVarIdxs) []) preds

  let rec getPredVarBounds collectedPreds vars accu =
    let insertIntoAll y tmp = List.fold_right (fun e acc -> (y::e)::acc) tmp [] in
    match collectedPreds with
      | [] -> []
      | [x] -> List.map (fun y -> [LSC.toSmallestComplexity (getGSCForOne accu y) vars]) x
      | x::rest -> let tmp = getPredVarBounds rest vars accu in
                   Utils.concatMap (fun y -> insertIntoAll (LSC.toSmallestComplexity (getGSCForOne accu y) vars) tmp) x

  (** computes global size bound for one SCC in the RVG *)
  let computeGlobalSizeBound ctrsobl rvgraph condensed scc isTrivial accu =
    if isTrivial then 
      let lsc = getLSC (List.hd scc) in
      let leftFuns = List.map (fun (rule, _) -> Term.getFun (RuleT.getLeft rule)) scc in
      (* TACAS'14, Thm. 9, case trivial SCC { \alpha } with \alpha = |t, v'|. *)
      if List.exists (fun f -> f = ctrsobl.ctrs.startFun) leftFuns then
        lsc
      else
        let preds = RVG.getPreds rvgraph scc in
        if preds = [] then
          lsc
        else
          (* max { S_l(\alpha)(S(t', v_1'), ..., S(t', v_n')) | t' \in pre(t) } *)
          let activeVarIdxs = snd lsc in
          let vars = CTRS.getVars ctrsobl.ctrs in
          let activeVars = List.map (List.nth vars) activeVarIdxs in
          let allPredVarBounds = getPredVarBounds (collectPreds preds activeVarIdxs) vars accu in
          let lsc_alpha = getPol (LSC.toSmallestComplexity lsc vars) in
          LSC.listMax (List.map (fun predVarBounds -> c2lsc (Complexity.apply lsc_alpha (List.combine activeVars predVarBounds)) vars) allPredVarBounds) vars
      else
        gscForNonTrivialScc ctrsobl rvgraph condensed scc accu

  (** computes global size complexities for all result variables *)
  let compute ctrsobl rvgraph =
    let condensed = RVG.condense rvgraph in
    let topo = RVG.getNodesInTopologicalOrder condensed in
    let sccs_with_gsb = 
      List.fold_left 
        (fun acc (scc, isTrivial) ->
          (scc, computeGlobalSizeBound ctrsobl rvgraph condensed scc isTrivial acc)::acc) [] topo in
    List.fold_left
      (fun acc (scc, gsc) -> 
        List.fold_left 
          (fun acc (rule, ((rhsIdx, varIdx), _)) -> RVMap.add (rule, (rhsIdx, varIdx)) gsc acc)
          acc scc)
      RVMap.empty sccs_with_gsb

  let empty =
    RVMap.empty

  (** Find bound for the i-th variable in the j-th rhs of rule r *)
  let findEntry globalSizeComplexities rule rhsIdx varIdx vars =
    LSC.toSmallestComplexity (RVMap.find (rule, (rhsIdx, varIdx)) globalSizeComplexities) vars

  (** Extract mapping for variables X_1 .. X_{length vars} to their
      global size complexity after using the j-th rhs of rule r *)
  let extractSizeMapForRule globalSizeComplexities r rhsIdx vars =
    Utils.mapi (fun i _ -> "X_" ^ (string_of_int (i + 1)), findEntry globalSizeComplexities r rhsIdx i vars) vars

  (** Extract mapping for variables in vars to their
      global size complexity after using the j-th rhs of rule r *)
  let extractSizeMapForRuleForVars globalSizeComplexities r rhsIdx vars =
    Utils.mapi (fun i _ -> List.nth vars i, findEntry globalSizeComplexities r rhsIdx i vars) vars

  (** Pretty-print list of (rule, rhs-num, arg-num, size complexity) tuples, where complexities are represented by their classes *)
  let rec dumpGSCs ruleWithGSCs =
    let dumpOneGSC (rule, gsb) =
      let dumpGSC ((i, j), c) =
        (string_of_int i) ^ "." ^ (string_of_int j) ^ ": " ^ (LSC.toStringLocalComplexity c)
      in
      (RuleT.toString rule) ^ ":: " ^ (dumpGSC gsb)
    in
    String.concat "\n" (List.map dumpOneGSC ruleWithGSCs)

  (** Get list of entries (each a list for each argument) for each right hand side *)
  let getSizeComplexitiesForRule rule sizeComplexities =
    (** Get list of entries, one for each argument on the right hand side *)
    let getSizeComplexitiesForRule' rule sizeComplexities rhsIdx (_, rhsArgs) =
      Utils.mapi (fun varIdx _ -> findEntry sizeComplexities rule rhsIdx varIdx) rhsArgs
    in
    Utils.mapiFlat (getSizeComplexitiesForRule' rule sizeComplexities) (RuleT.getRights rule)

  (** Pretty-print list of (rule, rhs-num, arg-num, size complexity) tuples. *)
  let printSizeComplexities ctrsobl gsc =
    let vars = CTRS.getVars ctrsobl.ctrs in
    String.concat "\n"
      (Utils.mapFlat (fun rule ->
        Utils.mapiFlat (fun rhsIdx _ ->
          Utils.mapi (fun varIdx _ -> 
            Printf.sprintf "\tS(%S, %i-%i) = %s"
              (RuleT.toString rule) rhsIdx varIdx (Complexity.toString (findEntry gsc rule rhsIdx varIdx vars)))
            vars)
          (RuleT.getRights rule))
         ctrsobl.ctrs.rules)
end
