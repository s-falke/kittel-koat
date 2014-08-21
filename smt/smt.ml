(*
  Call to yices/z3/...

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

type solver = Yices | Z3 | Mathsat | CVC4 | Yices2

type formula =
          And of (formula list)
        | AndA of (Pc.atom list) (* shortcut because conj of atoms is so common *)
        | Or of (formula list)
        | Not of formula
        | Atom of Pc.atom

let docleanup = true

let smt_solver = ref Yices

let smt_time = ref 0.0

let header = "(benchmark kittel_formula\n  :status unknown\n  :logic QF_LIA\n"

let midder = "  :formula "

let footer = "\n)"

let input_line_no_cr ic =
  let str = input_line ic in
    let len = String.length str in
      if len > 0 && str.[len - 1] = '\r' then
        String.sub str 0 (len - 1)
      else
        str

let setSolver solver =
  match solver with
    | "yices" -> smt_solver := Yices
    | "z3" -> smt_solver := Z3
    | "mathsat5" -> smt_solver := Mathsat
    | "cvc4" -> smt_solver := CVC4
    | "yices2" -> smt_solver := Yices2
    | _ -> failwith ("Unsupported SMT solver: " ^ solver)

let get_res_of_cmd cmdline =
  let icc = Unix.open_process_in cmdline in
    let res = input_line_no_cr icc in
      ignore (Unix.close_process_in icc);
      res
let yices   thefilename = get_res_of_cmd ("yices -smt " ^ thefilename)
let z3      thefilename = get_res_of_cmd ("z3 -smt " ^ thefilename)
let mathsat thefilename = get_res_of_cmd ("mathsat -input=smt < " ^ thefilename)
let cvc4    thefilename = get_res_of_cmd ("cvc4 --lang=smt1 " ^ thefilename)
let yices2  thefilename = get_res_of_cmd ("yices-smt " ^ thefilename)

(* Executes smt solver on a formula *)
let smt solver thefilename =
  let start = Unix.gettimeofday() in
    let res = solver thefilename in
      smt_time := !smt_time +. (Unix.gettimeofday () -. start);
      if res = "sat" then
        Ynm.Yes
      else if res = "unsat" then
        Ynm.No
      else
        Ynm.Maybe

let get_smt_assignment cmdline model_extractor =
  let start = Unix.gettimeofday () in
  let icc = Unix.open_process_in cmdline in
    let res = input_line_no_cr icc in
      (
        smt_time := !smt_time +. (Unix.gettimeofday () -. start);
        if res = "sat" then
          let model = model_extractor icc [] in
            ignore (Unix.close_process_in icc);
            Some model
        else
        (
          ignore (Unix.close_process_in icc);
          None
        )
      )

(* Executes yices on a formula in a file and gives a satisfying assignment *)
let rec yices_assignment thefilename =
  get_smt_assignment ("yices -smt -e " ^ thefilename) get_yices_model
and get_yices_model icc acc =
  try
    get_yices_model icc ((parse_yices (input_line_no_cr icc))::acc)
  with
    End_of_file -> acc
and parse_yices line =
  let f x s = (x, Big_int.big_int_of_string (String.sub s 0 (String.length s - 1))) in
    Scanf.sscanf line "(= %s %s" f

(* Executes z3 on a formula in a file and gives a satisfying assignment *)
let rec z3_assignment thefilename =
   get_smt_assignment ("z3 -smt " ^ thefilename) get_z3_model
and get_z3_model icc acc =
  try
    get_z3_model icc ((parse_z3 (input_line_no_cr icc))::acc)
  with
    End_of_file -> acc
and parse_z3 line =
  let (var_s, val_s) = split_z3 line
  and f x s = (x, Big_int.big_int_of_string s) in
    Scanf.sscanf (var_s ^ " " ^ val_s) "%s %s" f
and split_z3 line =
  let toks = Str.split (Str.regexp " ") line in
    if (List.nth toks 1 = "->") then
      if List.length toks = 3 then
        (List.nth toks 0, List.nth toks 2)
      else
        (List.nth toks 0, "-" ^ (drop_last_char (List.nth toks 3)))
    else
      failwith "Cannot parse Z3's model"
and drop_last_char s =
  String.sub s 0 ((String.length s) - 1)

(* Executes mathsat on a formula in a file and gives a satisfying assignment *)
let rec mathsat_assignment thefilename =
  get_smt_assignment ("mathsat -input=smt -model < " ^ thefilename) get_mathsat_model
and get_mathsat_model icc acc =
  try
    get_mathsat_model icc ((parse_mathsat (input_line_no_cr icc))::acc)
  with
    End_of_file -> acc
and parse_mathsat line =
  let (var_s, val_s) = split_mathsat line
  and f x s = (x, Big_int.big_int_of_string s) in
    Scanf.sscanf (var_s ^ " " ^ val_s ) "%s %s" f
and split_mathsat line =
  let toks = Str.split (Str.regexp " ") line in
    if List.nth toks 0 = "(=" then
      if List.length toks = 3 then
        (List.nth toks 1, drop_last_char (List.nth toks 2))
      else
        (List.nth toks 1, "-" ^ (drop_last_char (drop_last_char (List.nth toks 3))))
    else
      failwith "Cannot parse MathSAT's model"

(* Executes cvc4 on a formula in a file and gives a satisfying assignment *)
let rec cvc4_assignment thefilename =
  get_smt_assignment ("cvc4 --produce-models --dump-models --lang=smt1 " ^ thefilename) get_cvc4_model
and get_cvc4_model icc acc =
  try
    get_cvc4_model icc ((parse_cvc4 (input_line_no_cr icc))::acc)
  with
    End_of_file -> List.filter (fun (x, _) -> x <> "") acc
and parse_cvc4 line =
  if line = "(model" || line = ")" then
    ("", Big_int.zero_big_int)
  else
    let (var_s, val_s) = split_cvc4 line
    and f x s = (x, Big_int.big_int_of_string s) in
      Scanf.sscanf (var_s ^ " -> " ^ val_s) "%s -> %s" f
and split_cvc4 line =
  let toks = Str.split (Str.regexp " ") line in
    try
      if List.length toks = 5 then
        (List.nth toks 1, drop_last_char (List.nth toks 4))
      else if (List.nth toks 4) = "(-" then
        (List.nth toks 1, "-" ^ (drop_last_char (drop_last_char (List.nth toks 5))))
      else
        raise Not_found
    with
      | _ -> failwith "Cannot parse CVC4's model"

(* Executes yices2 on a formula in a file and gives a satisfying assignment *)
let rec yices2_assignment thefilename =
  get_smt_assignment ("yices-smt -m " ^ thefilename) get_yices2_model
and get_yices2_model icc acc =
  try
    get_yices2_model icc ((parse_yices2 (input_line_no_cr icc))::acc)
  with
    End_of_file -> List.filter (fun (x, _) -> x <> "") acc
and parse_yices2 line =
  if line = "" then
    ("", Big_int.zero_big_int)
  else
    let f x s = (x, Big_int.big_int_of_string (String.sub s 0 (String.length s - 1))) in
      Scanf.sscanf line "(= %s %s" f

let model thefilename =
  match !smt_solver with
    | Yices -> yices_assignment thefilename
    | Z3 -> z3_assignment thefilename
    | Mathsat -> mathsat_assignment thefilename
    | CVC4 -> cvc4_assignment thefilename
    | Yices2 -> yices2_assignment thefilename

let output_var_string formulafile vs =
  match vs with
    | [] -> ()
    | _ -> output_string formulafile "  :extrafuns (";
           List.iter (fun v -> output_string formulafile ("(" ^ v ^ " Int) ")) vs;
           output_string formulafile ")\n"

let rec formula_to_smt_file file formula =
  match formula with
    | And []
    | AndA [] ->
            output_string file "true"
    | And fs ->
            output_string file "(and " ;
            List.iter (formula_to_smt_file file) fs ;
            output_string file ")" ;
    | AndA atoms ->
            output_string file "(and ";
            List.iter (fun a -> output_string file (Pc.atomSMT a)) atoms;
            output_string file ")"
    | Or fs ->
            output_string file "(or " ;
            List.iter (formula_to_smt_file file) fs ;
            output_string file ")" ;
    | Not f ->
            output_string file "(not " ;
            formula_to_smt_file file f ;
            output_string file ")" ;
    | Atom atom ->
            output_string file (Pc.atomSMT atom)

let write_smt_file vars formula =
  let (thefilename, formulafile) = Filename.open_temp_file "FORMULA_1_" ".smt" in
    output_string formulafile header;
    output_var_string formulafile vars;
    output_string formulafile midder;
    formula_to_smt_file formulafile formula;
    output_string formulafile footer;
    close_out formulafile;
    thefilename

let smt_file_check_satisfiable filename =
    let solver =
        match !smt_solver with
            | Yices -> yices
            | Z3 -> z3
            | Mathsat -> mathsat
            | CVC4 -> cvc4
            | Yices2 -> yices2
        in
    if docleanup then
    (
      at_exit (fun () -> if Sys.file_exists filename then Sys.remove filename);
    );
    let res = smt solver filename in
      if docleanup then
      (
        Sys.remove filename;
      );
      res

let smt_file_get_model filename =
    let solver =
        match !smt_solver with
            | Yices -> yices_assignment
            | Z3 -> z3_assignment
            | Mathsat -> mathsat_assignment
            | CVC4 -> cvc4_assignment
            | Yices2 -> yices2_assignment
        in
    if docleanup then
    (
      at_exit (fun () -> if Sys.file_exists filename then Sys.remove filename);
    );
    let res = solver filename in
      if docleanup then
      (
        Sys.remove filename;
      );
      res

let atoms_to_smt_file formulafile atoms =
  List.iter (fun atom -> output_string formulafile (Pc.atomSMT atom)) atoms

let conj_to_smt f formulafile =
  match f with
    | [] -> output_string formulafile "true"
    | [x] -> output_string formulafile (Pc.atomSMT x)
    | xs -> (
              output_string formulafile "(and\n";
              atoms_to_smt_file formulafile xs;
              output_string formulafile "\n)"
            )

(* Determines whether a list of atoms is conjunctively satisfiable *)
let isSatisfiable f =
  let filename = write_smt_file (Pc.getVars f) (AndA f) in
  smt_file_check_satisfiable filename

(* Determines whether f conjuncted with the negations of f's is conjunctively satisfiable *)
let isSatisfiableWithNegations f f's =
  let vars = Utils.remdup ((Pc.getVars f) @ (List.flatten (List.map Pc.getVars f's))) in
  let formula = And ((AndA f)::(List.map (fun atoms -> Not (AndA atoms)) f's)) in
  let filename = write_smt_file vars formula in
  smt_file_check_satisfiable filename

(* Determines whether a list of atoms is conjunctively satisfiable and returns a model *)
let getModel f =
  let filename = write_smt_file (Pc.getVars f) (AndA f) in
  smt_file_get_model filename

(* Determines satisfiability for polynomial interpretations *)
let isSatisfiablePolo polyconditions polystrict boundconditions extraconditions vars =
  let onePolyCondForm polCond = (Or (List.map (fun pc -> AndA pc) polCond)) in
  let polyCondFormula = (And (List.map onePolyCondForm polyconditions)) in
  let autoStrictFormula = (Or
    (List.map2 (fun pc bc -> And [onePolyCondForm pc; onePolyCondForm bc]) polystrict boundconditions)) in
  let formula = (And [polyCondFormula ; autoStrictFormula ; AndA extraconditions]) in
  let filename = write_smt_file vars formula in
  smt_file_get_model filename

(* Determines satisfiability for Farkas-based polynomial interpretations *)
let isSatisfiableFarkasPolo weakconds strictconds vars =
  let farkasAutostrict =
      if strictconds = [] then
          (Atom (Pc.Equ (Poly.zero, Poly.zero)))
      else
          (Or (List.map (fun c -> AndA c) strictconds))
      in
  let formula = (And [ (AndA weakconds) ; farkasAutostrict ]) in
  let filename = write_smt_file vars formula in
  smt_file_get_model filename

(* Determines satisfiability for Farkas-based polynomial interpretations with minimal elements *)
let isSatisfiableFarkasPoloMinimal minrestrictions minimplications weakconds weakminconds boundconds strictconds strictminconds vars =
  let getFarkasMinimalAutostrict =
    if strictconds = [] then
      (Atom (Pc.Equ (Poly.zero, Poly.zero)))
    else
      (Or (Utils.map3 (fun bound strict strictmin -> And [ (AndA bound) ; (Or [ (AndA strict) ; (AndA strictmin) ]) ]) boundconds strictconds strictminconds))
    in
  let formula =
    (And [ (AndA minrestrictions)
         ; (And (List.map (function (notMin, paramsZero) -> Or [ (Atom notMin) ; (AndA paramsZero) ]) minimplications))
         ; (And (List.map2 (fun weak weakmin -> Or [ (AndA weak) ; (Atom weakmin) ]) weakconds weakminconds))
         ; getFarkasMinimalAutostrict ])
    in
  let filename = write_smt_file vars formula in
  smt_file_get_model filename

(* sizebound stuff *)
let rec isConstantBound cond t c =
  let (thefilename, formulafile) = Filename.open_temp_file "FORMULA_2_" ".smt"
  and absTerms = getAbsTerms [(t, "T")] in
    output_string formulafile header;
    output_var_string formulafile (Utils.remdup ((Poly.getVars t) @ (Pc.getVars cond)));
    output_string formulafile (midder ^ "\n");
    output_string formulafile (letifyAbsTerms absTerms);
    output_string formulafile "(and ";
    conj_to_smt cond formulafile;
    output_string formulafile " ";
    output_string formulafile (absIsGtrC (getAbsForT absTerms) c);
    output_string formulafile ")\n";
    output_string formulafile (closes ((List.length absTerms) + 1));
    output_string formulafile footer;
    close_out formulafile;
    match (smt_file_check_satisfiable thefilename) with
      | Ynm.No -> true
      | _ -> false
and absIsGtrC name c =
  "(> ?" ^ name ^ " " ^ (Poly.toSMT ([], c)) ^ ")"
and getAbsForT absTerms =
  (fst (snd (List.hd absTerms))) ^ "_abs"
and getAbsTerms ts =
  List.map (function (t, name) -> (t, (name, getAbs t name))) ts
and getAbs t name =
  if name.[0] = 'T' then
    "(ite (>= ?" ^ name ^ " 0) ?" ^ name ^ " (~ ?" ^ name ^ "))"
  else
    "(ite (>= " ^ name ^ " 0) " ^ name ^ " (~ " ^ name ^ "))"
and letifyAbsTerms absterms =
  String.concat "" (List.map letifyAbsTerm absterms)
and letifyAbsTerm (t, (name, defn)) =
  if name.[0] = 'T' then
    "(let (?" ^ name ^ " " ^ (Poly.toSMT t) ^ ")\n" ^
    "(let (?" ^ name ^ "_abs " ^ defn ^ ")\n"
  else
    "(let (?" ^ name ^ "_abs " ^ defn ^ ")\n"
and closes n =
  if n > 0 then
    ")" ^ (closes (n - 1))
  else
    ""

let rec isMaxBound cond t c a =
  if a = [] then
    false
  else
    let (thefilename, formulafile) = Filename.open_temp_file "FORMULA_3_" ".smt"
    and aPolys = List.map (fun x -> (Poly.fromVar x, x)) a in
      let absTerms = getAbsTerms ((t, "T")::aPolys)
      and cond' = List.filter (fun c -> Utils.containsOne a (Pc.getVarsAtom c)) cond in
        let maxTerms = getMaxTerms aPolys 0 in
          output_string formulafile header;
          output_var_string formulafile (Utils.remdup ((Poly.getVars t) @ (Pc.getVars cond')));
          output_string formulafile (midder ^ "\n");
          output_string formulafile (letifyAbsTerms absTerms);
          output_string formulafile (letifyMaxTerms (List.rev maxTerms));
          output_string formulafile (finalMax c (getMax maxTerms));
          output_string formulafile "(and ";
          conj_to_smt cond' formulafile;
          output_string formulafile " ";
          output_string formulafile (absIsGtrMax (getAbsForT absTerms) "?THEMAX");
          output_string formulafile ")\n";
          output_string formulafile (closes ((List.length absTerms) + 1));
          output_string formulafile (closes ((List.length maxTerms) + 1));
          output_string formulafile footer;
          close_out formulafile;
          match (smt_file_check_satisfiable thefilename) with
            | Ynm.No -> true
            | _ -> false
and absIsGtrMax tabs max =
  "(> ?" ^ tabs ^ " " ^ max ^ ")"
and finalMax c varmax =
  "(let (?THEMAX " ^ (getIte (Big_int.string_of_big_int c) varmax) ^ ")\n"
and getMax maxTerms =
  fst (List.hd maxTerms)
and getMaxTerms aPolys i =
  match aPolys with
    | [] -> []
    | [(_, x)] -> [("?MAX_" ^ (string_of_int i), "?" ^ x ^ "_abs")]
    | (_, x)::rest -> let maxRest = getMaxTerms rest (i + 1) in
                        ("?MAX_" ^ (string_of_int i), getIte ("?" ^ x ^ "_abs") (fst (List.hd maxRest)))::maxRest
and getIte a b =
  "(ite (> " ^ a ^ " " ^ b ^ ") " ^ a ^ " " ^ b ^ ")"
and letifyMaxTerms maxTerms =
  String.concat "" (List.map letifyMaxTerm maxTerms)
and letifyMaxTerm (name, defn) =
  "(let (" ^ name ^ " " ^ defn ^ ")\n"

let rec isMaxPlusConstantBound cond t c a =
  if a = [] then
    false
  else
    let (thefilename, formulafile) = Filename.open_temp_file "FORMULA_4_" ".smt"
    and aPolys = List.map (fun x -> (Poly.fromVar x, x)) a in
      let absTerms = getAbsTerms ((t, "T")::aPolys)
      and cond' = List.filter (fun c -> Utils.containsOne a (Pc.getVarsAtom c)) cond in
        let maxTerms = getMaxTerms aPolys 0 in
          output_string formulafile header;
          output_var_string formulafile (Utils.remdup ((Poly.getVars t) @ (Pc.getVars cond')));
          output_string formulafile (midder ^ "\n");
          output_string formulafile (letifyAbsTerms absTerms);
          output_string formulafile (letifyMaxTerms (List.rev maxTerms));
          output_string formulafile "(and ";
          conj_to_smt cond' formulafile;
          output_string formulafile " ";
          output_string formulafile (absIsGtrMaxPlusConstant (getAbsForT absTerms) (getMax maxTerms) c);
          output_string formulafile ")\n";
          output_string formulafile (closes ((List.length absTerms) + 1));
          output_string formulafile (closes (List.length maxTerms));
          output_string formulafile footer;
          close_out formulafile;
          match (smt_file_check_satisfiable thefilename) with
            | Ynm.No -> true
            | _ -> false

and absIsGtrMaxPlusConstant tabs max c =
  "(> ?" ^ tabs ^ " (+ " ^ max ^ " " ^ (Big_int.string_of_big_int c) ^ "))"

let rec isSumPlusConstantBound cond t c a =
  if a = [] then
    false
  else
    let (thefilename, formulafile) = Filename.open_temp_file "FORMULA_5_" ".smt"
    and aPolys = List.map (fun x -> (Poly.fromVar x, x)) a in
      let absTerms = getAbsTerms ((t, "T")::aPolys)
      and cond' = List.filter (fun c -> Utils.containsOne a (Pc.getVarsAtom c)) cond in
        let sumTerm = getSumTerm (List.tl absTerms) in
          output_string formulafile header;
          output_var_string formulafile (Utils.remdup ((Poly.getVars t) @ (Pc.getVars cond')));
          output_string formulafile (midder ^ "\n");
          output_string formulafile (letifyAbsTerms absTerms);
          output_string formulafile (letifySumTerm sumTerm);
          output_string formulafile "(and ";
          conj_to_smt cond' formulafile;
          output_string formulafile " ";
          output_string formulafile (absIsGtrSumPlusConstant (getAbsForT absTerms) (getSum sumTerm) c);
          output_string formulafile ")\n";
          output_string formulafile (closes ((List.length absTerms) + 2));
          output_string formulafile footer;
          close_out formulafile;
          match (smt_file_check_satisfiable thefilename) with
            | Ynm.No -> true
            | _ -> false

and absIsGtrSumPlusConstant tabs sum c =
  "(> ?" ^ tabs ^ " (+ " ^ sum ^ " " ^ (Big_int.string_of_big_int c) ^ "))"
and getSumTerm absTerms =
  let sumterm = getTheSum absTerms in
    ("?SUM", sumterm)
and getTheSum absTerms =
  match absTerms with
    | [] -> "0"
    | [(_, (x, _))] -> "?" ^ x ^ "_abs"
    | _ -> "(+ " ^ (String.concat " " (List.map (fun (_, (x, _)) -> "?" ^ x ^ "_abs") absTerms)) ^ ")"
and getSum (name, _) =
  name
and letifySumTerm (name, defn) =
  "(let (" ^ name ^ " " ^ defn ^ ")\n"

let rec isScaledSumPlusConstantBound cond t c s a =
  if a = [] then
    false
  else
    let (thefilename, formulafile) = Filename.open_temp_file "FORMULA_6_" ".smt"
    and aPolys = List.map (fun x -> (Poly.fromVar x, x)) a in
      let absTerms = getAbsTerms ((t, "T")::aPolys)
      and cond' = List.filter (fun c -> Utils.containsOne a (Pc.getVarsAtom c)) cond in
        let scaledSumTerm = getScaledSumTerm (List.tl absTerms) s in
          output_string formulafile header;
          output_var_string formulafile (Utils.remdup ((Poly.getVars t) @ (Pc.getVars cond')));
          output_string formulafile (midder ^ "\n");
          output_string formulafile (letifyAbsTerms absTerms);
          output_string formulafile (letifyScaledSumTerm scaledSumTerm);
          output_string formulafile "(and ";
          conj_to_smt cond' formulafile;
          output_string formulafile " ";
          output_string formulafile (absIsGtrScaledSumPlusConstant (getAbsForT absTerms) (getScaledSum scaledSumTerm) c);
          output_string formulafile ")\n";
          output_string formulafile (closes ((List.length absTerms) + 2));
          output_string formulafile footer;
          close_out formulafile;
          match (smt_file_check_satisfiable thefilename) with
            | Ynm.No -> true
            | _ -> false
and absIsGtrScaledSumPlusConstant tabs sum c =
  "(> ?" ^ tabs ^ " (+ " ^ sum ^ " " ^ (Big_int.string_of_big_int c) ^ "))"
and getScaledSumTerm absTerms s =
  let sumterm = getTheSum absTerms in
    ("?SUM", "(* " ^ (Big_int.string_of_big_int s) ^ " " ^ sumterm ^ ")")
and getScaledSum (name, _) =
  name
and letifyScaledSumTerm (name, defn) =
  "(let (" ^ name ^ " " ^ defn ^ ")\n"
