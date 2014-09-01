(*
  Convert KoAT examples to C

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

module VarMap = Map.Make(String)
module FunMap = Map.Make(String)

let findWithDef def k map =
  if FunMap.mem k map then
    FunMap.find k map
  else
    def

let ppLoc l =
  "loc_" ^ l

let (varToPreVarMap, varToPostVarMap) =
  let preRes = ref VarMap.empty in
  let postRes = ref VarMap.empty in
  for i = 65 to 90 do
    (
      let letter = Char.escaped (Char.chr i) in
      preRes := VarMap.add (Printf.sprintf "X_%i"  (i - 64)) letter !preRes;
      postRes := VarMap.add (Printf.sprintf "X_%i'" (i - 64)) (letter ^ "_") !postRes;
      for j = 1 to 9 do
        preRes := VarMap.add (Printf.sprintf "X_%i"  (i - 64 + j*26)) (Printf.sprintf "%s%i" letter j) !preRes;
        postRes := VarMap.add (Printf.sprintf "X_%i'" (i - 64 + j*26)) (Printf.sprintf "%s%i_" letter j) !postRes;
      done
    )
  done;
  (!preRes, !postRes)

let ppVar v =
  if (VarMap.mem v varToPreVarMap) then
    VarMap.find v varToPreVarMap
  else if (VarMap.mem v varToPostVarMap) then
    VarMap.find v varToPostVarMap
  else
    Str.global_replace (Str.regexp "'") "_" v

let ppTerm (monomials, const) =
  let open Big_int in
  let ppMonomialCoeff (coeff, mon) =
    let ppMonomial mon =
      let ppPower var exp =
        assert (exp > 0);
        String.concat "*" (Utils.getCopies (ppVar var) exp) in
      String.concat " * " (List.map (fun (var, exp) -> ppPower var exp) mon) in
    if (eq_big_int coeff zero_big_int) then
      "0"
    else
      if (lt_big_int coeff zero_big_int) then
        if (eq_big_int coeff (minus_big_int unit_big_int)) then
          Printf.sprintf "-%s" (ppMonomial mon)
        else
          Printf.sprintf "-%s * %s" (string_of_big_int (abs_big_int coeff)) (ppMonomial mon)
      else
        if (eq_big_int coeff unit_big_int) then
          Printf.sprintf "%s" (ppMonomial mon)
        else
          Printf.sprintf "%s * %s" (string_of_big_int (abs_big_int coeff)) (ppMonomial mon) in
  
  if monomials = [] then
    Printf.sprintf "%s" (string_of_big_int const)
  else
    let constPrefix = 
      if (eq_big_int const zero_big_int) then
        ""
      else
        Printf.sprintf "%s + " (string_of_big_int const) in
    
    constPrefix ^ (String.concat " + " (List.map ppMonomialCoeff monomials))

let ppCond atoms =
  let ppCondAtom a =
    let open Pc in
    match a with
    | Equ (l, r) -> (ppTerm l) ^ " == " ^ (ppTerm r)
    | Neq (l, r) -> (ppTerm l) ^ " != " ^ (ppTerm r)
    | Geq (l, r) -> (ppTerm l) ^ " >= " ^ (ppTerm r)
    | Gtr (l, r) -> (ppTerm l) ^ " > " ^ (ppTerm r)
    | Leq (l, r) -> (ppTerm l) ^ " <= " ^ (ppTerm r)
    | Lss (l, r) -> (ppTerm l) ^ " < " ^ (ppTerm r) in
  if atoms = [] then
    "1 >= 0"
  else
    String.concat " && " (List.map ppCondAtom atoms)

let print_c_header preVars postVars startFun =
  let open Printf in
  printf "int nondet() { int a; return a; }\n";
  printf "_Bool nondet_bool() { _Bool a; return a; }\n";
  let varString = String.concat ", " (List.map (fun v -> "int " ^ (ppVar v)) preVars) in
  printf "int foo (%s) {\n" varString;
  printf " goto %s;\n\n" (ppLoc startFun);
  ()

let print_c_footer defSymToRules allSyms =
  let open Printf in
  (* We have to generate labels for all the symbols that are used, but are not defined: *)
  let undefSyms = Utils.removeAll (Utils.remdup allSyms) (FunMap.fold (fun key _ keys -> key::keys) defSymToRules []) in
  List.iter (fun sym -> printf " %s:\n" (ppLoc sym)) undefSyms;
  printf " end: return 0;\n";
  printf "}\n";
  ()

let splitOutDefEq cond var =
  let isDefEq condAtom var =
    let varPoly = Poly.fromVar var in
    match condAtom with
    | Pc.Equ (t1, t2) ->
      if Poly.equal varPoly t1 then
        Some t2
      else if Poly.equal varPoly t2 then
        Some t1
      else
        None
    | _ -> None in
  let rec splitOutDefEq' cond var acc =
    match cond with
    | [] -> None
    | atom::cond ->
      (
        match isDefEq atom var with
        | None -> splitOutDefEq' cond var (atom::acc)
        | Some t -> Some (t, acc@cond)
      ) in
  splitOutDefEq' cond var []

(* This only checks the condition, not the defined symbol, which needs to be checked by appropriate labels *)
let print_rule preVars postVars rule =
  (* Find non-pre/post vars *)
  let cond = Rule.getCond rule in
  let condVars = Utils.remdup (Utils.removeAll (Pc.getVars cond) (preVars @ postVars)) in

  let open Printf in
  printf "   if (nondet_bool()) {\n";
  (* Reset those post variables that are not simply staying the same *)
  let (cleanedCond, unchangedPreVars, varResets, varDefs) =
    List.fold_left 
      (fun (cleanedCond, unchangedPreVars, varResets, varDefs) (preVar, postVar) ->
        match splitOutDefEq cleanedCond postVar with
        | Some (defTerm, c) ->
          if Poly.equal (Poly.fromVar preVar) defTerm then
            (c, preVar::unchangedPreVars, varResets, varDefs)
          else
            (
              let varDef = sprintf "int %s = %s;" (ppVar postVar) (ppTerm defTerm) in
              (c, unchangedPreVars, varResets, varDef::varDefs)
            )
        | None ->
          let varReset = sprintf "int %s = nondet();" (ppVar postVar) in
          (cleanedCond, unchangedPreVars, varReset::varResets, varDefs))
      (cond, [], [], [])
      (List.combine preVars postVars) in
  List.iter (fun v -> printf "    int %s = nondet();\n" (ppVar v)) condVars;
  List.iter (fun r -> printf "    %s\n" r) varResets;
  List.iter (fun d -> printf "    %s\n" d) varDefs;
  printf "    if (%s) {\n" (ppCond cleanedCond);
  let updateVars = List.filter (fun (preV, postV) -> not(Utils.contains unchangedPreVars preV)) (List.combine preVars postVars) in
  List.iter (fun (preV, postV) -> printf "     %s = %s;\n" (ppVar preV) (ppVar postV)) updateVars;
  printf "     goto %s;\n" (ppLoc (Term.getFun (Rule.getRight rule)));
  printf "    }\n";
  printf "   }\n";
  ()

let printDefSym preVars postVars defSym definingRules =
  let open Printf in
  printf " %s:\n" (ppLoc defSym);
  printf " {\n";
  List.iter (print_rule preVars postVars) definingRules; (* check / variable setting / goto per rule *)
  printf "  goto end;\n"; (* fall-through, instead of break *)
  printf " }\n";
  ()

let main () =
  let filename = Sys.argv.(1) in
  let (startFun, cint) = Parser.parseCint filename Simple.Ctrls in
  if Cint.isUnary cint then
    let trs = Cint.toTrs cint in
    (* Collect rules by defined symbol *)
    let (defSymToRules, allSyms) =
      List.fold_left
        (fun (defSymToRules, allSyms) r ->
          let rule = Rule.standardize r in
          let defSym = Term.getFun (Rule.getLeft rule) in
          let rhsSym = Term.getFun (Rule.getRight rule) in
          (FunMap.add defSym (rule::(findWithDef [] defSym defSymToRules)) defSymToRules, defSym::rhsSym::allSyms)
        )
        (FunMap.empty, [])
        trs in
    let preVars = Term.getVars (Rule.getLeft (Rule.standardize (List.hd trs))) in
    let postVars = List.map (fun v -> v ^ "'") preVars in

    print_c_header preVars postVars startFun;
    FunMap.iter (printDefSym preVars postVars) defSymToRules;
    print_c_footer defSymToRules allSyms
  else
    (
      Printf.eprintf "Cannot convert non-unary KoAT files to C.\n";
    )

let _ = main ()
