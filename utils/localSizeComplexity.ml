(*
  Local size complexity stuff

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

module Make (RuleT : AbstractRule) = struct
  type localcomplexity = Max of Big_int.big_int
                       | MaxPlusConstant of Big_int.big_int
                       | SumPlusConstant of Big_int.big_int
                       | ScaledSumPlusConstant of Big_int.big_int * Big_int.big_int
                       | P of Expexp.expexp
                       | Unknown

  let getE c =
    match c with
      | (Max e, _) -> e
      | (MaxPlusConstant e, _) -> e
      | (SumPlusConstant e, _) -> e
      | (ScaledSumPlusConstant (e, _), _) -> e
      | _ -> failwith "Internal error in LocalSizeComplexity.getE"
  
  let getS c =
    match c with
      | (SumPlusConstant _ , _) -> Big_int.unit_big_int
      | (ScaledSumPlusConstant (_, s), _) -> s
      | _ -> failwith "Internal error in LocalSizeComplexity.getS"
  
  let getConstant c =
    match c with
      | (P p, v) -> Expexp.getConstant p
      | _ -> failwith "Internal error in LocalSizeComplexity.getConstant"
  
  let rec equal c d =
    c == d || equalInternal c d
  and equalInternal c d =
    match (c, d) with
      | ((Max e, v), (Max e', v')) -> Poly.eq_big_int e e' && equalVar v v'
      | ((MaxPlusConstant e, v), (MaxPlusConstant e', v')) -> Poly.eq_big_int e e' && equalVar v v'
      | ((SumPlusConstant e, v), (SumPlusConstant e', v')) -> Poly.eq_big_int e e' && equalVar v v'
      | ((P p, v), (P q, v')) -> (Expexp.equal p q) && equalVar v v'
      | ((Unknown, v), (Unknown, v')) -> equalVar v v'
      | _ -> false
  and equalVar v v' =
    (v == v') || ((List.length v = List.length v') && (List.for_all2 (fun a b -> (a == b) || (a = b)) v v'))
  
  let isConstant c =
    match c with
      | (Max _, _) -> false
      | (MaxPlusConstant _, _) -> false
      | (SumPlusConstant _, _) -> false
      | (ScaledSumPlusConstant _, _) -> false
      | (P p, v) -> (v = []) && (Expexp.isConst p)
      | (Unknown, _) -> false
  
  let rec complexity2localcomplexity c vars =
    match c with
      | Complexity.P p -> if (not (Expexp.isConst p)) && (Expexp.isSumOfVarsPlusConstant p) then
                       (SumPlusConstant (Expexp.getConstant p), getVarNums p vars)
                     else if (not (Expexp.isConst p)) && (Expexp.isScaledSumOfVarsPlusConstant p) then
                       (ScaledSumPlusConstant (Expexp.getConstant p, Expexp.getScaleFactor p), getVarNums p vars)
                     else
                       (P p, getVarNums p vars)
      | Complexity.Unknown -> (Unknown, [])
  and getVarNums p vars =
    let pv = Expexp.getVars p in
      getVarNumList pv vars 0
  and getVarNumList pv vars i =
    match vars with
      | [] -> []
      | v::rest -> if Utils.contains pv v then
                     i::(getVarNumList pv rest (i + 1))
                   else
                     getVarNumList pv rest (i + 1)
  
  let rec toSmallestComplexity c vars =
    match c with
      | (Max e, v) -> Complexity.P (Expexp.add (getSum v vars) (Expexp.fromConstant e))
      | (MaxPlusConstant e, v) -> Complexity.P (Expexp.add (getSum v vars) (Expexp.fromConstant e))
      | (SumPlusConstant e, v) -> Complexity.P (Expexp.add (getSum v vars) (Expexp.fromConstant e))
      | (ScaledSumPlusConstant (e, s), v) -> Complexity.P (Expexp.constmult (Expexp.add (getSum v vars) (Expexp.fromConstant e)) s)
      | (P p, _) -> Complexity.P p
      | (Unknown, _) -> Complexity.Unknown
  and getSum v vars =
    match v with
      | [] -> Expexp.zero
      | x::rest -> Expexp.add (Expexp.fromVar (List.nth vars x)) (getSum rest vars)
  
  let rec add c d vars =
    match c with
      | (Max e, v) -> addMax e v d vars
      | (MaxPlusConstant e, v) -> addMaxPlusConstant e v d vars
      | (SumPlusConstant e, v) -> addSumPlusConstant e v d vars
      | (ScaledSumPlusConstant (e, s), v) -> addScaledSumPlusConstant e s v d vars
      | (P p, v) -> addP p v d vars
      | (Unknown, v) -> (Unknown, [])
  and addMax e v d vars =
    match d with
      | (Max e', v') -> if disjoint v v' then
                          (SumPlusConstant (Big_int.add_big_int e e'), unite v v')
                        else
                          addAsSmallestComplexities (Max e, v) d vars
      | (MaxPlusConstant e', v') ->  if disjoint v v' then
                                       (SumPlusConstant (Big_int.add_big_int e e'), unite v v')
                                     else
                                       addAsSmallestComplexities (Max e, v) d vars
      | (SumPlusConstant e', v') ->  if disjoint v v' then
                                       (SumPlusConstant (Big_int.add_big_int e e'), unite v v')
                                     else
                                       addAsSmallestComplexities (Max e, v) d vars
      | (ScaledSumPlusConstant (e', s), v') -> (ScaledSumPlusConstant (Big_int.add_big_int e e', Big_int.add_big_int s Big_int.unit_big_int), unite v v')
      | (P p', v') -> if isConstant d then
                        (Max (Big_int.add_big_int e (getConstant d)), v)
                      else
                        addAsSmallestComplexities (Max e, v) d vars
      | (Unknown, v') -> (Unknown, [])
  and addMaxPlusConstant e v d vars =
    match d with
      | (Max e', v') -> if disjoint v v' then
                          (SumPlusConstant (Big_int.add_big_int e e'), unite v v')
                        else
                          addAsSmallestComplexities (MaxPlusConstant e, v) d vars
      | (MaxPlusConstant e', v') ->  if disjoint v v' then
                                       (SumPlusConstant (Big_int.add_big_int e e'), unite v v')
                                     else
                                       addAsSmallestComplexities (MaxPlusConstant e, v) d vars
      | (SumPlusConstant e', v') ->  if disjoint v v' then
                                       (SumPlusConstant (Big_int.add_big_int e e'), unite v v')
                                     else
                                       addAsSmallestComplexities (MaxPlusConstant e, v) d vars
      | (ScaledSumPlusConstant (e', s), v') -> (ScaledSumPlusConstant (Big_int.add_big_int e e', Big_int.add_big_int s Big_int.unit_big_int), unite v v')
      | (P p', v') -> if isConstant d then
                        (MaxPlusConstant (Big_int.add_big_int e (getConstant d)), v)
                      else
                        addAsSmallestComplexities (MaxPlusConstant e, v) d vars
      | (Unknown, v') -> (Unknown, [])
  and addSumPlusConstant e v d vars =
    match d with
      | (Max e', v') -> if disjoint v v' then
                          (SumPlusConstant (Big_int.add_big_int e e'), unite v v')
                        else
                          addAsSmallestComplexities (SumPlusConstant e, v) d vars
      | (MaxPlusConstant e', v') -> if disjoint v v' then
                                      (SumPlusConstant (Big_int.add_big_int e e'), unite v v')
                                    else
                                      addAsSmallestComplexities (SumPlusConstant e, v) d vars
      | (SumPlusConstant e', v') -> if disjoint v v' then
                                      (SumPlusConstant (Big_int.add_big_int e e'), unite v v')
                                    else
                                      addAsSmallestComplexities (SumPlusConstant e, v) d vars
      | (ScaledSumPlusConstant (e', s), v') -> (ScaledSumPlusConstant (Big_int.add_big_int e e', Big_int.add_big_int s Big_int.unit_big_int), unite v v')
      | (P p', v') -> if isConstant d then
                        (SumPlusConstant (Big_int.add_big_int e (getConstant d)), v)
                      else
                        addAsSmallestComplexities (SumPlusConstant e, v) d vars
      | (Unknown, v') -> (Unknown, [])
  and addScaledSumPlusConstant e s v d vars =
    match d with
      | (Max e', v') -> (ScaledSumPlusConstant (Big_int.add_big_int e e', Big_int.add_big_int s Big_int.unit_big_int), unite v v')
      | (MaxPlusConstant e', v') -> (ScaledSumPlusConstant (Big_int.add_big_int e e', Big_int.add_big_int s Big_int.unit_big_int), unite v v')
      | (SumPlusConstant e', v') ->  (ScaledSumPlusConstant (Big_int.add_big_int e e', Big_int.add_big_int s Big_int.unit_big_int), unite v v')
      | (ScaledSumPlusConstant (e', s'), v') -> (ScaledSumPlusConstant (Big_int.add_big_int e e', Big_int.add_big_int s s'), unite v v')
      | (P p', v') -> if isConstant d then
                        (ScaledSumPlusConstant (Big_int.add_big_int e (getConstant d), s), v)
                      else
                        addAsSmallestComplexities (SumPlusConstant e, v) d vars
      | (Unknown, v') -> (Unknown, [])
  and addP p v d vars =
    match d with
      | (P p', v') -> (P (Expexp.add p p'), unite v v')
      | _ -> add d (P p, v) vars
  and disjoint v v' =
    (Utils.intersect v v') = []
  and unite v v' =
    List.sort compare (Utils.remdup (v @ v'))
  and addAsSmallestComplexities c d vars =
    let cc = (Complexity.add (toSmallestComplexity c vars) (toSmallestComplexity d vars)) in
      complexity2localcomplexity cc vars
  
  let rec addList l vars =
    match l with
      | [] -> (P Expexp.zero, [])
      | [x] -> x
      | x::y::rest -> addList ((add x y vars)::rest) vars
  
  let rec getMax c d vars =
    match c with
      | (Max e, v) -> (
                        match d with
                          | (Max e', v') -> (Max (Big_int.max_big_int e e'), unite v v')
                          | (MaxPlusConstant e', v') -> (MaxPlusConstant (Big_int.max_big_int e e'), unite v v')
                          | (SumPlusConstant e', v') -> (SumPlusConstant (Big_int.max_big_int e e'), unite v v')
                          | (ScaledSumPlusConstant (e', s), v') -> (ScaledSumPlusConstant (Big_int.max_big_int e e', s), unite v v')
                          | (P p', v') -> if isConstant d then
                                            (MaxPlusConstant (Big_int.add_big_int e (getConstant d)), v)
                                          else
                                            let m = Expexp.max (getExpexp (toSmallestComplexity c vars)) p' in
                                              (P m, getVarNums m vars)
                          | (Unknown, v') -> (Unknown, [])
                      )
      | (MaxPlusConstant e, v) -> (
                                    match d with
                                      | (Max e', v') -> (MaxPlusConstant (Big_int.max_big_int e e'), unite v v')
                                      | (MaxPlusConstant e', v') -> (MaxPlusConstant (Big_int.max_big_int e e'), unite v v')
                                      | (SumPlusConstant e', v') -> (SumPlusConstant (Big_int.max_big_int e e'), unite v v')
                                      | (ScaledSumPlusConstant (e', s), v') -> (ScaledSumPlusConstant (Big_int.max_big_int e e', s), unite v v')
                                      | (P p', v') -> if isConstant d then
                                                        (MaxPlusConstant (Big_int.add_big_int e (getConstant d)), v)
                                                      else
                                                        let m = Expexp.max (getExpexp (toSmallestComplexity c vars)) p' in
                                                          (P m, getVarNums m vars)
                                      | (Unknown, v') -> (Unknown, [])
                                  )
      | (SumPlusConstant e, v) -> (
                                    match d with
                                      | (Max e', v') -> (SumPlusConstant (Big_int.max_big_int e e'), unite v v')
                                      | (MaxPlusConstant e', v') -> (SumPlusConstant (Big_int.max_big_int e e'), unite v v')
                                      | (SumPlusConstant e', v') -> (SumPlusConstant (Big_int.max_big_int e e'), unite v v')
                                      | (ScaledSumPlusConstant (e', s), v') -> (ScaledSumPlusConstant (Big_int.max_big_int e e', s), unite v v')
                                      | (P p', v') -> if isConstant d then
                                                        (SumPlusConstant (Big_int.add_big_int e (getConstant d)), v)
                                                      else
                                                        let m = Expexp.max (getExpexp (toSmallestComplexity c vars)) p' in
                                                          (P m, getVarNums m vars)
                                      | (Unknown, v') -> (Unknown, [])
                                  )
      | (ScaledSumPlusConstant (e, s), v) -> (
                                    match d with
                                      | (Max e', v') -> (ScaledSumPlusConstant (Big_int.max_big_int e e', s), unite v v')
                                      | (MaxPlusConstant e', v') -> (ScaledSumPlusConstant (Big_int.max_big_int e e', s), unite v v')
                                      | (SumPlusConstant e', v') -> (ScaledSumPlusConstant (Big_int.max_big_int e e', s), unite v v')
                                      | (ScaledSumPlusConstant (e', s'), v') -> (ScaledSumPlusConstant (Big_int.max_big_int e e', Big_int.max_big_int s s'), unite v v')
                                      | (P p', v') -> if isConstant d then
                                                        (ScaledSumPlusConstant (Big_int.add_big_int e (getConstant d), s), v)
                                                      else
                                                        let m = Expexp.max (getExpexp (toSmallestComplexity c vars)) p' in
                                                          (P m, getVarNums m vars)
                                      | (Unknown, v') -> (Unknown, [])
                                  )
      | (P p, v) -> (
                      match d with
                        | (P p', v') -> let m = Expexp.max p p' in
                                          (P m, getVarNums m vars)
                        | _ -> getMax d c vars
                    )
      | (Unknown, v) -> (Unknown, [])
  and getExpexp c =
    match c with
      | Complexity.P p -> p
      | _ -> failwith "Internal error in LocalSizeComplexity.getExpexp"
  and listMax list vars =
    match list with
      | [] -> (P Expexp.zero, [])
      | [x] -> x
      | x::y::rest -> listMax ((getMax x y vars)::rest) vars
  
  let rec toStringLocalComplexity c =
    match c with
      | (Max e, v) -> "=(" ^ (Big_int.string_of_big_int e) ^ ") " ^ (varString v)
      | (MaxPlusConstant e, v) -> "+.(" ^ (Big_int.string_of_big_int e) ^ ") " ^ (varString v)
      | (SumPlusConstant e, v) -> "+_(" ^ (Big_int.string_of_big_int e) ^ ") " ^ (varString v)
      | (ScaledSumPlusConstant (e, s), v) -> "*.(" ^ (Big_int.string_of_big_int e) ^ ", " ^ (Big_int.string_of_big_int s) ^ ") " ^ (varString v)
      | (P p, v) -> Expexp.toString p
      | (Unknown, v) -> "?"
  and varString v =
    "[" ^ (String.concat ";" (List.map string_of_int v)) ^ "]"
  
  (* compute local size complexities *)
  let maxBound = ref ""
  let maxPlusConstantBound = ref ""
  let maxC = Big_int.big_int_of_int 1024
  let maxS = Big_int.big_int_of_int 1024
  let eConstant = ref Big_int.zero_big_int
  let sConstant = ref Big_int.zero_big_int
  
  let rec computeLocalSizeComplexities trs =
    List.flatten (List.map (fun (rule, lsbs) -> List.map (fun lsb -> (rule, lsb)) lsbs) (List.map computeLocalSizeComplexitiesOne trs))
  and computeLocalSizeComplexitiesOne rule =
    let cond = Pc.dropNonLinearAtoms (RuleT.getCond rule)
    and lvars = Term.getVars (RuleT.getLeft rule) in
      let lvarswithnums = List.mapi (fun i v -> (v, i)) lvars
      and rs = RuleT.getRights rule in
        let rsWithNum = List.combine (Utils.getList 0 ((List.length rs) - 1)) rs in
          let tmp = List.flatten (List.map (computeLocalSizeComplexitiesOneAuxAux lvars lvarswithnums cond) rsWithNum) in
            (rule, tmp)
  and computeLocalSizeComplexitiesOneAuxAux lvars lvarswithnums cond (j, r) =
    let tmp = computeLocalSizeComplexitiesOneAux lvars lvarswithnums 0 (Term.getArgs r) cond in
      List.map (fun (i, lsc) -> ((j, i), lsc)) tmp
  and computeLocalSizeComplexitiesOneAux lvars lvarswithnums i terms cond =
    match terms with
      | [] -> []
      | t::rest -> (computeLSCReal lvars lvarswithnums i t cond)::(computeLocalSizeComplexitiesOneAux lvars lvarswithnums (i + 1) rest cond)
  and computeLSCReal lvars lvarswithnums i t cond =
    computeLSCRealBinarySearch lvars lvarswithnums i t cond
  and computeLSCRealBinarySearch lvars lvarswithnums i t cond =
    let isLinear = Poly.isLinear t in
      if isLinear && (Smt.isConstantBound cond t maxC) then
        let e = minimizeC (Smt.isConstantBound cond t) Big_int.zero_big_int maxC in
          (i, (P (Expexp.fromConstant e), []))
      else
        let alltvars = Poly.getVars t in
          let tvars = Utils.intersect lvars alltvars
          and isRegular = Utils.containsAll lvars alltvars in
            if isLinear && isRegular && (List.length tvars = 1) && (Poly.isSumOfVarsPlusConstant t) && (Poly.eq_big_int Big_int.zero_big_int (Poly.getConstant t)) then
              (i, (Max Big_int.zero_big_int, getVarNums lvarswithnums tvars))
            else
            (
              maxBound := "";
              maxPlusConstantBound := "";
              let deps = Utils.intersect lvars (getDeps tvars cond) in
                if isLinear && isMaxBound cond t maxC deps then
                  let minimal = [!maxBound] in
                    let e = minimizeC (fun c -> Smt.isMaxBound cond t c minimal) Big_int.zero_big_int maxC in
                      (i, (Max e, getVarNums lvarswithnums minimal))
                else if isLinear && isMaxPlusConstantBound cond t maxC deps then
                  let minimal = [!maxPlusConstantBound] in
                    let e = minimizeC (fun c -> Smt.isMaxPlusConstantBound cond t c minimal) Big_int.zero_big_int maxC in
                      (i, (MaxPlusConstant e, getVarNums lvarswithnums minimal))
                else if isLinear && Smt.isMaxBound cond t maxC deps then
                  let minimal = minimize (Smt.isMaxBound cond t maxC) deps [] in
                    let e = minimizeC (fun c -> Smt.isMaxBound cond t c minimal) Big_int.zero_big_int maxC in
                      (i, (Max e, getVarNums lvarswithnums minimal))
                else if isLinear && Smt.isMaxPlusConstantBound cond t maxC deps then
                  let minimal = minimize (Smt.isMaxPlusConstantBound cond t maxC) deps [] in
                    let e = minimizeC (fun c -> Smt.isMaxPlusConstantBound cond t c minimal) Big_int.zero_big_int maxC in
                      (i, (MaxPlusConstant e, getVarNums lvarswithnums minimal))
                else if isLinear && (Smt.isSumPlusConstantBound cond t maxC tvars) then
                  let minimal = minimize (Smt.isSumPlusConstantBound cond t maxC) tvars [] in
                    let e = minimizeC (fun c -> Smt.isSumPlusConstantBound cond t c minimal) Big_int.zero_big_int maxC in
                      (i, (SumPlusConstant e, getVarNums lvarswithnums minimal))
                else if isLinear && (Smt.isSumPlusConstantBound cond t maxC deps) then
                  let minimal = minimize (Smt.isSumPlusConstantBound cond t maxC) deps [] in
                    let e = minimizeC (fun c -> Smt.isSumPlusConstantBound cond t c minimal) Big_int.zero_big_int maxC in
                      (i, (SumPlusConstant e, getVarNums lvarswithnums minimal))
                else if isLinear && (Smt.isScaledSumPlusConstantBound cond t maxC maxS deps) then
                  let minimal = minimize (Smt.isScaledSumPlusConstantBound cond t maxC maxS) deps [] in
                    let e = minimizeC (fun c -> Smt.isScaledSumPlusConstantBound cond t c maxS minimal) Big_int.zero_big_int maxC in
                      let s = minimizeC (fun s -> Smt.isScaledSumPlusConstantBound cond t e s minimal) Big_int.zero_big_int maxS in
                        (i, (ScaledSumPlusConstant (e, s), getVarNums lvarswithnums minimal))
                else if isRegular then
                  (* use syntactic criteria *)
                  if (Poly.isSumOfVarsPlusConstant t) then
                    (i, (SumPlusConstant (Poly.getConstant t), getVarNums lvarswithnums tvars))
                  else
                    (i, (P (Expexp.fromPoly (Poly.abs t)), getVarNums lvarswithnums tvars))
                else
                  (i, (Unknown, []))
            )
  and isMaxBound cond t c a =
    match a with
      | [] -> false
      | v::rest -> if Smt.isMaxBound cond t c [v] then
                   (
                     maxBound := v;
                     true
                   )
                   else
                     isMaxBound cond t c rest
  and isMaxPlusConstantBound cond t c a =
    match a with
      | [] -> false
      | v::rest -> if Smt.isMaxPlusConstantBound cond t c [v] then
                   (
                     maxPlusConstantBound := v;
                     true
                   )
                   else
                     isMaxPlusConstantBound cond t c rest
  and minimize check a accu =
    match a with
      | [] -> accu
      | i::rest -> if (check (accu@rest)) then
                     minimize check rest accu
                   else
                     minimize check rest (accu @ [i])
  and minimizeC check lower upper =
    if Big_int.ge_big_int lower upper then
      upper
    else
      let middle = Big_int.shift_right_big_int (Big_int.add_big_int lower upper) 1 in
        if (check middle) then
          minimizeC check lower middle
        else
          minimizeC check (Big_int.add_big_int middle Big_int.unit_big_int) upper
  and getDeps tvars cond =
    getDepsFix tvars [] cond
  and getDepsFix x y cond =
    if x = y then
      x
    else
      getDepsFix (addOneDepLevel x cond []) x cond
  and addOneDepLevel x cond news =
    match cond with
      | [] -> x @ (Utils.remdup news)
      | c::rest -> let condVars = Pc.getVars cond in
                     if Utils.containsOne x condVars then
                       addOneDepLevel x rest (news @ (getNew x condVars))
                     else
                       addOneDepLevel x rest news
  and getNew x newvars =
    List.filter (fun v -> not (Utils.contains x v)) newvars
  and getVarNums lvars tvars =
    match tvars with
      | [] -> []
      | v::rest -> (
                     let tmp = getVarNums lvars rest in
                       try
                         let x = List.assoc v lvars in
                           x::tmp
                       with
                         | Not_found -> tmp
                   )
  
  let equalLSC (i, c) (i', c') =
    (i = i') && (equal c c')
  
  let rec dumpLSCs ruleWithLSCs =
    String.concat "\n" (List.map dumpOneLSC ruleWithLSCs)
  and dumpOneLSC (rule, lsb) =
    (RuleT.toString rule) ^ ":: " ^ (dumpLSC lsb)
  and dumpLSC (i, c_vars) =
    (string_of_int i) ^ ": " ^ (toStringLocalComplexity c_vars)
  and dumpLSCDot (rule, lsb) =
    (RuleT.toDotString rule) ^ ":: " ^ (dumpLSC lsb)
  
  let rec dumpGSCs ruleWithGSCs =
    String.concat "\n" (List.map dumpOneGSC ruleWithGSCs)
  and dumpOneGSC (rule, gsb) =
    (RuleT.toString rule) ^ ":: " ^ (dumpGSC gsb)
  and dumpGSC (i, c) =
    (string_of_int i) ^ ": " ^ (toStringLocalComplexity c)
  
  let rec dumpGSCsAsComplexities ruleWithGSCs vars =
    String.concat "\n" (List.map (dumpOneGSCAsComplexity vars) ruleWithGSCs)
  and dumpOneGSCAsComplexity vars (rule, ((i, j), c)) =
    "\tS(" ^ (RuleT.toString rule) ^ ", " ^ (string_of_int i) ^ "-" ^ (string_of_int j) ^ ") = " ^ (Complexity.toString (toSmallestComplexity c vars))
end
