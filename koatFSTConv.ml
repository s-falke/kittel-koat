(*
  Convert KoAT examples to FST

  @author Marc Brockschmidt

  Copyright 2014 Marc Brockschmidt

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

let ppLoc l = l
let ppVar v = v

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
    String.concat ", " (List.map ppCondAtom atoms)

let print_fst_header preVars allSyms =
  let open Printf in
  printf "model main {\n";
  printf "  var %s;\n" (String.concat ", " (List.map ppVar preVars));
  printf "  states %s;\n" (String.concat ", " (List.map ppLoc allSyms));
  ()

let print_fst_footer startSym =
  let open Printf in
  printf "}\n";
  printf "strategy dumb {\n";
  printf "  Region init := { state = %s };\n" (ppLoc startSym);
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

let trans_counter = ref 0
let print_rule preVars postVars rule =
  let open Printf in
  let cond = Rule.getCond rule in
  let (cleanedCond, varDefs) =
    List.fold_left
      (fun (cleanedCond, varDefs) (preVar, postVar) ->
        match splitOutDefEq cleanedCond postVar with
        | Some (defTerm, c) ->
          if Poly.equal (Poly.fromVar preVar) defTerm then
            (c, (ppVar postVar, ppVar preVar) :: varDefs)
          else
            (c, (ppVar postVar, ppTerm defTerm) :: varDefs)
        | None ->
          (cleanedCond, (ppVar postVar, "?") :: varDefs))
      (cond, [])
      (List.combine preVars postVars) in
  trans_counter := !trans_counter + 1;
  printf "  transition t%i := {\n" !trans_counter;
  printf "    from   := %s;\n" (ppLoc (Term.getFun (Rule.getLeft rule)));
  printf "    to     := %s;\n" (ppLoc (Term.getFun (Rule.getRight rule)));
  printf "    guard  := %s;\n" (ppCond cleanedCond);
  printf "    action := %s;\n" (String.concat ", " (List.map (fun (preVar, value) -> preVar ^ " = " ^ value) varDefs));
  printf "  };\n";
  ()

let main () =
  let filename = Sys.argv.(1) in
  let (startFun, cint) = Parser.parseCint filename Simple.Ctrls in
  if Cint.isUnary cint then
    let trs = List.map Rule.standardize (Cint.toTrs cint) in

    (* Collect defined symbols *)
    let allSyms =
      Utils.remdup
        (List.fold_left
           (fun allSyms rule ->
             let defSym = Term.getFun (Rule.getLeft rule) in
             let rhsSym = Term.getFun (Rule.getRight rule) in
             defSym :: rhsSym :: allSyms)
        [] trs) in
    let preVars = Term.getVars (Rule.getLeft (List.hd trs)) in
    let postVars = List.map (fun v -> v ^ "'") preVars in

    print_fst_header preVars allSyms;
    List.iter (print_rule preVars postVars) trs;
    print_fst_footer startFun
  else
    (
      Printf.eprintf "Cannot convert non-unary KoAT files to FST.\n";
    )

let _ = main ()
