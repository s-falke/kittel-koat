(*
  Invariant generation via Apron

  @author Marc Brockschmidt

  Copyright 2014 Microsoft Research

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

IFDEF HAVE_APRON THEN

open Apron
open AbstractRule

module Make(RuleT : AbstractRule) = struct
  module RVG = Rvgraph.Make(RuleT)
  module TGraph = Tgraph.Make(RuleT)
  module VarMap = Map.Make(String)
  module FunMap = Map.Make(String)
  module CTRSObl = Ctrsobl.Make(RuleT)
  module CTRS = CTRSObl.CTRS
  open CTRSObl
  open CTRS

  let a_var m v = VarMap.find v m

  let extend_env env oldMap newVars =
    let (newApronVars, newMap) =
      List.fold_left
        (fun (l,m) v -> let aV = Var.of_string v in (aV::l, VarMap.add v aV m))
        ([], oldMap)
        newVars
    in
    (Environment.add env (Array.of_list newApronVars) [| |], newMap)

(* Takes a list of variables, and produces an environment for these variables and a
   mapping from names to the apron-internal variables created. *)
  let mk_env vars =
    extend_env (Environment.make [| |] [| |]) VarMap.empty vars

  let big_int_to_texpr1 env i =
    Texpr1.cst env (Coeff.s_of_mpqf (Mpqf.of_string (Big_int.string_of_big_int i))) (* This is stoopid. *)

  let monomial_to_texpr1 env varM mon =
    let open Texpr1 in
    let rec var_to_texpr1 env varM (v, exp) =
      if exp < 1 then
        raise (Invalid_argument "Monomial with negative coeff.")
      else if exp == 1 then
        var env (a_var varM v)
      else
        binop Mul (var env (a_var varM v)) (var_to_texpr1 env varM (v, exp-1)) Int Zero
    in
    List.fold_left (fun res m -> binop Mul (var_to_texpr1 env varM m) res Int Zero) (cst env (Coeff.s_of_int 1)) mon

  let poly_to_texpr1 env varM (mons, const) =
    let open Texpr1 in
    List.fold_left
      (fun res (coeff, mon) ->
        binop Add
          (binop Mul
             (big_int_to_texpr1 env coeff)
             (monomial_to_texpr1 env varM mon)
             Int Zero)
          res Int Zero)
      (big_int_to_texpr1 env const) mons

  let atom_to_tcons1 env varM a =
    let open Texpr1 in
    let open Tcons1 in
    let open Pc in
    let pair_to_tcons1 env varM a b =
      binop Sub
        (poly_to_texpr1 env varM a)
        (poly_to_texpr1 env varM b)
        Int Zero
    in
    match a with
    | Equ(l, r) ->
      make (pair_to_tcons1 env varM l r) EQ
    | Neq(l, r) ->
      make (pair_to_tcons1 env varM l r) DISEQ
    | Geq(l, r)
    | Leq(r, l) ->
      make (pair_to_tcons1 env varM l r) SUPEQ
    | Gtr(l, r)
    | Lss(r, l) ->
      make (pair_to_tcons1 env varM l r) SUP


  let rec texpr0_to_poly env e =
    let open Texpr0 in
    match e with
    | Cst coeff ->
      (
        match coeff with
        | Coeff.Scalar s ->
          Poly.fromConstant (Big_int.big_int_of_int (int_of_float (float_of_string (Scalar.to_string s)))) (* Oh god what have I done *)
        | Coeff.Interval _ -> raise (Invalid_argument "Interval coefficients not supported.")
      )
    | Dim dim ->
      Poly.fromVar (Var.to_string (Environment.var_of_dim env dim))
    | Unop (op, expr, _, _) ->
      (
        match op with
        | Neg ->
          Poly.negate (texpr0_to_poly env e)
        | Cast
        | Sqrt -> raise (Invalid_argument "Cast/square operations not supported.")
      )
    | Binop (op, expr1, expr2, _, _) ->
      (
        match op with
        | Add ->
          Poly.add (texpr0_to_poly env expr1) (texpr0_to_poly env expr2)
        | Sub ->
          Poly.minus (texpr0_to_poly env expr1) (texpr0_to_poly env expr2)
        | Mul ->
          Poly.mult (texpr0_to_poly env expr1) (texpr0_to_poly env expr2)
        | Div
        | Mod ->
          raise (Invalid_argument "Div/mod operations not supported.")
      )

  let tcons0_to_pc env cons =
    let open Tcons0 in
    let zero = Poly.zero in
    match cons.typ with
    | EQ ->
      Pc.Equ(texpr0_to_poly env (Texpr0.to_expr cons.texpr0), zero)
    | DISEQ ->
      Pc.Neq(texpr0_to_poly env (Texpr0.to_expr cons.texpr0), zero)
    | SUPEQ ->
      Pc.Geq(texpr0_to_poly env (Texpr0.to_expr cons.texpr0), zero)
    | SUP ->
      Pc.Gtr(texpr0_to_poly env (Texpr0.to_expr cons.texpr0), zero)
    | EQMOD _ -> raise (Invalid_argument "EQMOD constraints not supported.")

  let abstr1_to_pc man abstrVal =
    let conss = Abstract1.to_tcons_array man abstrVal in
    let env = Abstract1.env abstrVal in
    let res = ref [] in
    for i=0 to (Tcons1.array_length conss) - 1 do
      res := (tcons0_to_pc env (Tcons1.get_tcons0 (Tcons1.array_get conss i)))::!res
    done;
    !res

  let print_abstr_val man abstrVal =
    List.iter (fun pc -> Printf.printf " %s\n" (Pc.toStringAtom pc)) (abstr1_to_pc man abstrVal)

  let applyTrans man curAbstrVal consArray ruleEnv dstPostEnv dstEnv =
  (* Extend abstract value to the full environment: *)
    let newAbstrVal = Abstract1.change_environment man curAbstrVal ruleEnv false in

  (* Create a new abstract value using the constraint *)
    Abstract1.meet_tcons_array_with man newAbstrVal consArray;

  (* First restrict to post-vars, then rename those to pre-vars *)
    Abstract1.change_environment_with man newAbstrVal dstPostEnv false;
    let dstPostVars = fst (Environment.vars dstPostEnv) in
    let dstPreVars = fst (Environment.vars dstEnv) in
    Abstract1.rename_array_with man newAbstrVal dstPostVars dstPreVars;
    newAbstrVal

  let array_exists p a =
    Array.fold_left (fun acc e -> acc || p e) false a

  let compute_invariants man rules startFuns =
  (* Compute standardized rules, prepare one environment for each function symbol, and a combined one for each pair of rules *)
    let rules = List.map Rule.standardize rules in

  (* Prepare environments for each function symbol *)
    let funToPreVarsEnv =
      List.fold_left
        (fun acc rule ->
          let lhs = Rule.getLeft rule in
          let (lhsFun, lhsVars) = (Term.getFun lhs, Term.getVars lhs) in
          if not(FunMap.mem lhsFun acc) then
            let lhsEnv = mk_env lhsVars in
            FunMap.add lhsFun lhsEnv acc;
          else
            acc)
        FunMap.empty
        rules
    in

    let findWithDef key def map =
      if FunMap.mem key map then
        FunMap.find key map
      else
        def
    in

  (* Construct map from function symbol to outgoing rules, as (conditions, destination function symbol) list *)
    let funToOutgoingConstraintEnvs =
      List.fold_left
        (fun acc rule ->
          let lhsFun = Term.getFun (Rule.getLeft rule) in
          let rhsFun = Term.getFun (Rule.getRight rule) in
          let (lhsEnv, lhsVarMap) = FunMap.find lhsFun funToPreVarsEnv in
          let newRuleVars = Utils.removeAll (Rule.getVars rule) (Term.getVars (Rule.getLeft rule)) in
          let (ruleEnv, ruleVarMap) = extend_env lhsEnv lhsVarMap newRuleVars in
          let (dstPostEnv, _) = mk_env (Term.getVars (Rule.getRight rule)) in
          let condAtoms = Rule.getCond rule in
          let consArray = Tcons1.array_make ruleEnv (List.length condAtoms) in
          Utils.iteri (fun i c -> Tcons1.array_set consArray i (atom_to_tcons1 ruleEnv ruleVarMap c)) condAtoms;
       (* (* DEBUG *)
          Printf.printf "Turning %s into the following array:\n" (Pc.toString condAtoms);
          Tcons1.array_print Format.std_formatter consArray;
          Printf.printf "\n";
       *)
          FunMap.add lhsFun ((ruleEnv, consArray, rhsFun, dstPostEnv)::(findWithDef lhsFun [] acc)) acc)
        FunMap.empty
        rules in

  (* Stack format: (fun with changed val, list of funs seen since last widening *)
    let stack = ref (List.map (fun startFun -> (startFun, [startFun])) startFuns) in

  (* Prepare abstract values for all symbols: Everything is empty, only start value allows everything *)
    let funToAbstrVal = (FunMap.fold (fun key _ acc -> FunMap.add key (Abstract1.bottom man (fst (FunMap.find key funToPreVarsEnv))) acc) funToOutgoingConstraintEnvs FunMap.empty) in
    let funToAbstrVal = ref (List.fold_left (fun acc startFun -> FunMap.add startFun (Abstract1.top man (fst (FunMap.find startFun funToPreVarsEnv))) acc) funToAbstrVal startFuns) in

    while List.length !stack > 0 do
      let (f, history) = List.hd !stack in
      stack := List.tl !stack;
      if FunMap.mem f !funToAbstrVal then
        let curAbstrVal = FunMap.find f !funToAbstrVal in
        List.iter
          (fun (ruleEnv, consArray, dstFun, dstPostEnv) ->
            if FunMap.mem dstFun !funToAbstrVal then
              let oldDstAbstrVal = FunMap.find dstFun !funToAbstrVal in
              let newDstAbstrVal = applyTrans man curAbstrVal consArray ruleEnv dstPostEnv (Abstract1.env oldDstAbstrVal) in

            (* (* DEBUG *)
               Printf.printf "Processing transition from %s to %s, with the following constraints:\n" f dstFun;
               Tcons1.array_print Format.std_formatter consArray;
               Printf.printf "\n Current abstract value at %s: %s\n" f (Pc.toString (abstr1_to_pc man curAbstrVal));
               Printf.printf "  Old abstract value at %s: %s\n" dstFun (Pc.toString (abstr1_to_pc man oldDstAbstrVal));
               Printf.printf "  New abstract value at %s: %s\n" dstFun (Pc.toString (abstr1_to_pc man newDstAbstrVal));
            *)

              Abstract1.join_with man newDstAbstrVal oldDstAbstrVal;

            (* (* DEBUG *)
               Printf.printf "  Joined abstract value at %s: %s\n" dstFun (Pc.toString (abstr1_to_pc man newDstAbstrVal));
            *)

              let (newHistory, resAbstrVal) =
                if Utils.contains history dstFun then
                (* We are repeating ourselves and start to get boring. Widen! *)
                  ([dstFun], Abstract1.widening man oldDstAbstrVal newDstAbstrVal)
                else
                  (dstFun::history, newDstAbstrVal)
              in
            (* Printf.printf "New invariant for '%s':\n" dstFun; print_abstr_val man resAbstrVal; (* DEBUG *) *)
              funToAbstrVal := FunMap.add dstFun resAbstrVal !funToAbstrVal;

            (* If we changed the dst abstr value, we need to reprocess all outgoing transitions from there *)
              if not(Abstract1.is_eq man oldDstAbstrVal resAbstrVal) then
                stack := (dstFun, newHistory)::!stack
          )
          (findWithDef f [] funToOutgoingConstraintEnvs)
    done;
    !funToAbstrVal

  let pp_invariants man funToInv =
    FunMap.fold
      (fun k aV acc ->
        if not(Abstract1.is_top man aV) then
          Printf.sprintf "%s  For symbol %s: %s\n" acc k (Pc.toString (abstr1_to_pc man aV))
        else
          acc
      ) funToInv ""

  let process_kittel startFuns trs =
    let add_invariants man rules startFuns =
      let funToAbstrVal = compute_invariants man rules startFuns in
      if FunMap.exists (fun _ aV -> not(Abstract1.is_top man aV)) funToAbstrVal then
        Some
          (funToAbstrVal,
           (List.map
              (fun rule ->
                let lhs = Rule.getLeft rule in
                let defSym = Term.getFun lhs in
                let inv = abstr1_to_pc man (FunMap.find defSym funToAbstrVal) in

                (* Map from std names to actually used names: *)
                let subst = Utils.mapi (fun i v -> ("X_" ^ (string_of_int (i+1)), v)) (Term.getArgs lhs) in
                let inv = Pc.instantiate inv subst in

                Rule.create lhs (Rule.getRight rule) (Utils.remdupC Pc.equalAtom (inv@(Rule.getCond rule))))
              rules)
          )
      else
        None
    in

    let get_proof man newRules funToInv i alli =
      let open Printf in
      let invList = pp_invariants man funToInv in
      sprintf
        "Applied AI with '%s' on problem %i to obtain the following invariants:\n%s\nThis yields the following problem:\n%s"
        (Manager.get_library man)
        i
        invList
        (Procs.getStringSccs alli [newRules])
    in

    if not (Utils.containsOne (Trs.getLeftFuns trs) startFuns) then
      let trivial_proof = fun i alli -> Printf.sprintf "Since no start symbol occurs on a left-hand side of problem %i, the problem is trivial." i
      in
        Some (([], Termgraph.compute [], true), trivial_proof)
    else
      let man = Box.manager_alloc () in
      match add_invariants man trs startFuns with
      | None -> None
      | Some (funToInv, newRules) ->
        Some ((newRules, Termgraph.compute newRules, false), get_proof man newRules funToInv)

  let process_koat ctrsobl tgraph rvgraph =
    let add_invariants man rules startFun =
      let sep_rules = Utils.concatMap (fun rule -> List.map (fun rhs -> Rule.create (RuleT.getLeft rule) rhs (RuleT.getCond rule)) (RuleT.getRights rule)) rules in
      let funToAbstrVal = compute_invariants man sep_rules startFun in
      if FunMap.exists (fun _ aV -> not(Abstract1.is_top man aV)) funToAbstrVal then
        Some
          (funToAbstrVal,
           (List.map
              (fun rule ->
                let lhs = RuleT.getLeft rule in
                let defSym = Term.getFun lhs in
                let inv = abstr1_to_pc man (FunMap.find defSym funToAbstrVal) in

                (* Map from std names to actually used names: *)
                let subst = Utils.mapi (fun i v -> ("X_" ^ (string_of_int (i+1)), v)) (Term.getArgs lhs) in
                let inv = Pc.instantiate inv subst in

                let newRule = RuleT.createRule lhs (RuleT.getRights rule) (Utils.remdupC Pc.equalAtom (inv@(RuleT.getCond rule))) in
                (rule, newRule))
              rules)
          )
      else
        None
    in

    let get_proof man funToInv nctrsobl ini outi =
      let open Printf in
      let invList = pp_invariants man funToInv in
      sprintf
        "Applied AI with '%s' on problem %i to obtain the following invariants:\n%s\n\nThis yielded the following problem:\n%s"
        (Manager.get_library man)
        ini
        invList
        (CTRSObl.toStringNumber nctrsobl outi)
    in

    Log.log "Trying apron AI processor ...";

    if CTRSObl.isSolved ctrsobl then
      None
    else
      (
        let man = Oct.manager_alloc () in

        match add_invariants man ctrsobl.ctrs.rules [ctrsobl.ctrs.startFun] with
        | None ->
          None
        | Some (funToInv, oldNewRules) ->
          let (newRules, newCost, newComplexities) =
            List.fold_left
              (fun (newRules, newCost, newComplexities) (oldRule, newRule) ->
                (newRule::newRules,
                 CTRS.RuleMap.add newRule (CTRS.RuleMap.find oldRule ctrsobl.cost) newCost,
                 CTRS.RuleMap.add newRule (CTRS.RuleMap.find oldRule ctrsobl.complexity) newComplexities))
              ([], CTRS.RuleMap.empty, CTRS.RuleMap.empty)
              oldNewRules in
          Log.log "Found new invariants.";
          let ntgraph = TGraph.compute newRules in
          let nctrsobl =
            { ctrs = { rules = newRules ; startFun = ctrsobl.ctrs.startFun }
            ; cost = newCost
            ; complexity = newComplexities
            ; leafCost = ctrsobl.leafCost } in
          Some ((nctrsobl, ntgraph, None), get_proof man funToInv nctrsobl)
      )
end
END
