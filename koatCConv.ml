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

module FunMap = Map.Make(String)

let findWithDef def k map =
  if FunMap.mem k map then
    FunMap.find k map
  else
    def

let ppLoc l =
  "loc_" ^ l

let ppVar v =
  Str.global_replace(Str.regexp "'") "_" (Str.global_replace (Str.regexp "_") "__" v)  (* Escape _ to __, escape "'" to "_" *)

let ppCond atoms =
  let ppCondAtom a =
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
        
        constPrefix ^ (String.concat " + " (List.map ppMonomialCoeff monomials)) in
    let open Pc in
    match a with
    | Equ (l, r) -> (ppTerm l) ^ " == " ^ (ppTerm r)
    | Neq (l, r) -> (ppTerm l) ^ " != " ^ (ppTerm r)
    | Geq (l, r) -> (ppTerm l) ^ " >= " ^ (ppTerm r)
    | Gtr (l, r) -> (ppTerm l) ^ " > " ^ (ppTerm r)
    | Leq (l, r) -> (ppTerm l) ^ " <= " ^ (ppTerm r)
    | Lss (l, r) -> (ppTerm l) ^ " < " ^ (ppTerm r) in
  String.concat " && " (List.map ppCondAtom atoms)

let print_c_header preVars postVars startFun =
  let open Printf in
  printf "int nondet() { int a; return a; }\n";
  printf "_Bool nondet_bool() { _Bool a; return a; }\n";
  printf "int main () {\n";
  List.iter (fun v -> printf " int %s = nondet();\n" (ppVar v)) preVars;
  printf " goto %s;\n\n" (ppLoc startFun);
  ()

let print_c_footer () =
  let open Printf in
  printf " end: return 0;\n";
  printf "}\n";
  ()

(* This only checks the condition, not the defined symbol, which needs to be checked by appropriate labels *)
let print_rule preVars postVars rule =
  (* Find non-pre/post vars *)
  let condVars = 
    Utils.remdup (Utils.removeAll (Pc.getVars (Rule.getCond rule)) (preVars @ postVars)) in

  let open Printf in
  printf "   if (nondet_bool()) {\n";
  List.iter (fun v -> printf "    int %s = nondet();\n" (ppVar v)) condVars;
  printf "    if (%s) {\n" (ppCond (Rule.getCond rule));
  List.iter2 (fun preV postV -> printf "     %s = %s;\n" (ppVar preV) (ppVar postV)) preVars postVars;
  printf "     goto %s;\n" (ppLoc (Term.getFun (Rule.getRight rule)));
  printf "    }\n";
  printf "   }\n";
  ()

let printDefSym preVars postVars defSym definingRules =
  let open Printf in
  printf " %s:\n" (ppLoc defSym);
  printf " {\n";
  List.iter (fun v -> printf "  int %s = nondet();\n" (ppVar v)) postVars; (* reset post variables *)
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
    let defSymToRules =
      List.fold_left
        (fun acc r ->
          let rule = Rule.standardize r in
          let defSym = Term.getFun (Rule.getLeft rule) in
          FunMap.add defSym (rule::(findWithDef [] defSym acc)) acc
        )
        FunMap.empty
        trs in
    let preVars = Term.getVars (Rule.getLeft (Rule.standardize (List.hd trs))) in
    let postVars = List.map (fun v -> v ^ "'") preVars in

    print_c_header preVars postVars startFun;
    FunMap.iter (printDefSym preVars postVars) defSymToRules;
    print_c_footer ()
  else
    (
      Printf.eprintf "Cannot convert non-unary KoAT files to C";
    )

let _ = main ()
