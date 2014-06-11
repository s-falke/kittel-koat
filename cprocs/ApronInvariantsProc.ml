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

open Apron

module CTRS = Ctrs.Make(Rule)
module RVG = Rvgraph.Make(Rule)
module TGraph = Tgraph.Make(Rule)
module VarMap = Map.Make(String)
module FunMap = Map.Make(String)

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
      binop Mul
        (big_int_to_texpr1 env coeff)
        (binop Add
           (monomial_to_texpr1 env varM mon) res Int Zero)
        Int Zero)
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

let applyTrans man fullEnv onlyPostEnv abstrVal preVars postVars consArray =
  (* Extend abstract value to the full environment: *)
  let newAbstrVal = Abstract1.change_environment man abstrVal fullEnv false in

  (* Create a new abstract value using the constraint *)
  Abstract1.meet_tcons_array_with man newAbstrVal consArray;

  (* First restrict to post-vars, then rename those to pre-vars *)
  Abstract1.change_environment_with man newAbstrVal onlyPostEnv false;
  Abstract1.rename_array_with man newAbstrVal postVars preVars;
  newAbstrVal


let array_exists p a =
  Array.fold_left (fun acc e -> acc || p e) false a

let compute_invariants man rules startFun =
  (* Compute standardized rules, colllect all variables, prepare environments *)
  let (rules, vars) =
    List.fold_left
      (fun (rules, vars) rule ->
        let rule = (Rule.standardize rule) in
        (rule::rules, (Rule.getVars rule)@vars))
      ([], [])
      rules in
  (* List.iter (fun r -> Printf.printf "Std. rule: %s\n" (Rule.toString r)) rules; (* DEBUG *) *)

  let vars = Utils.remdup vars in
  let (fullEnv, varMap) = mk_env vars in
  let (preVars, postVars) =
    ((Array.of_list (List.map (a_var varMap) (Term.getVars (Rule.getLeft (List.hd rules))))),
     (Array.of_list (List.map (a_var varMap) (Term.getVars (Rule.getRight (List.hd rules)))))) in
  let (onlyPreEnv, onlyPostEnv) =
    let (intVars, _) = Environment.vars fullEnv in
    let (notPre, notPost) =
      Array.fold_left
        (fun (notPre, notPost) v ->
          let notPre = if array_exists (fun e -> Var.compare v e = 0) preVars then notPre else v::notPre in
          let notPost = if array_exists (fun e -> Var.compare v e = 0) postVars then notPost else v::notPost in
          (notPre, notPost)
        ) ([], []) intVars in
    (Environment.remove fullEnv (Array.of_list notPre), Environment.remove fullEnv (Array.of_list notPost)) in
  let findWithDef key def map =
    if FunMap.mem key map then
      FunMap.find key map
    else
      def
  in

  (* Construct map from function symbol to outgoing rules, as (converted conditions, destination function symbol) list *)
  let funToConsDst =
    List.fold_left
      (fun acc rule ->
        let f = Term.getFun (Rule.getLeft rule) in
        let dstF = Term.getFun (Rule.getRight rule) in
        if Term.getArity (Rule.getLeft rule) <> Term.getArity(Rule.getRight rule) then
          raise (Invalid_argument "Rule with differing lhs/rhs arities."); (* check *)
        let conss = Rule.getCond rule in
        let consArray = Tcons1.array_make fullEnv (List.length conss) in
        Utils.iteri (fun i c -> Tcons1.array_set consArray i (atom_to_tcons1 fullEnv varMap c)) conss;
        FunMap.add f ((consArray, dstF)::(findWithDef f [] acc)) acc)
      FunMap.empty
      rules in

  (* Stack format: (fun with changed val, list of funs seen since last widening *)
  let stack = ref [(startFun, [])] in

  (* Prepare abstract values for all symbols: Everything is empty, only start value allows everything *)
  let funToAbstrVal = (FunMap.fold (fun key _ acc -> FunMap.add key (Abstract1.bottom man onlyPreEnv) acc) funToConsDst FunMap.empty) in
  let funToAbstrVal = ref (FunMap.add startFun (Abstract1.top man onlyPreEnv) funToAbstrVal) in

  while List.length !stack > 0 do
    let (f, history) = List.hd !stack in
    stack := List.tl !stack;
    let curAbstrVal = FunMap.find f !funToAbstrVal in
    List.iter
      (fun (consArray, dstFun) ->
        let newAbstrVal = applyTrans man fullEnv onlyPostEnv curAbstrVal preVars postVars consArray in
        let dstAbstrVal = FunMap.find dstFun !funToAbstrVal in
        Abstract1.join_with man newAbstrVal dstAbstrVal;
        let resAbstrVal =
          if Utils.contains history dstFun then
            (* We are repeating ourselves and start to get boring. Widen! *)
            Abstract1.widening man dstAbstrVal newAbstrVal
          else
            newAbstrVal
        in
        (*Printf.printf "New invariant for '%s':\n" dstFun; print_abstr_val man resAbstrVal; (* DEBUG *) *)
        funToAbstrVal := FunMap.add dstFun resAbstrVal !funToAbstrVal;

        (* If we changed the dst abstr value, we need to reprocess all outgoing transitions from there *)
        if not(Abstract1.is_eq man dstAbstrVal resAbstrVal) then
            stack := (dstFun, f::history)::!stack
      )
      (findWithDef f [] funToConsDst)
  done;
  !funToAbstrVal

let add_invariants man rcc startFun =
  let rules = List.map CTRS.getRule rcc in
  let funToAbstrVal = compute_invariants man rules startFun in
  if FunMap.exists (fun _ aV -> not(Abstract1.is_top man aV)) funToAbstrVal then
    Some
      (funToAbstrVal,
       (List.map
          (fun r ->
            let rule = CTRS.getRule r in
            let lhs = Rule.getLeft rule in
            let defSym = Term.getFun lhs in
            let inv = abstr1_to_pc man (FunMap.find defSym funToAbstrVal) in

            (* Map from std names to actually used names: *)
            let subst = Utils.mapi (fun i v -> ("X_" ^ (string_of_int (i+1)), v)) (Term.getArgs lhs) in
            let inv = Pc.instantiate inv subst in

            let newRule = Rule.create lhs (Rule.getRight rule) (Utils.remdupC Pc.equalAtom (inv@(Rule.getCond rule))) in
            (newRule, CTRS.getRuleComplexity r, CTRS.getRuleCost r))
          rcc)
      )
  else
    None

let get_proof man funToInv nrccgl ini outi =
  let open Printf in
  let invList =
    FunMap.fold
      (fun k aV acc ->
        if not(Abstract1.is_top man aV) then
          sprintf "%s  For symbol %s: %s\n" acc k (Pc.toString (abstr1_to_pc man aV))
        else
          acc
      ) funToInv "" in
  sprintf
    "Applied AI with '%s' on problem %i to obtain the following invariants:\n%s\n\nThis yielded the following problem:\n%s"
    (Manager.get_library man)
    ini
    invList
    (CTRS.toStringGNumber nrccgl outi)

let process (rcc, g, l) tgraph rvgraph =
  if CTRS.isSolved rcc then
    None
  else
    (
      let man = Box.manager_alloc () in
      match add_invariants man rcc g with
      | None ->
        None
      | Some (funToInv, newRcc) ->
        let rules = List.map CTRS.getRule newRcc in
        let nrccgl = (newRcc, g, l) in
        Some ((nrccgl, TGraph.compute rules, None), get_proof man funToInv nrccgl)
    )

