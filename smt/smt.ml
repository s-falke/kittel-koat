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

let yices thefilename =
  let icc = Unix.open_process_in ("yices -smt " ^ thefilename) in
    let res = input_line_no_cr icc in
      ignore (Unix.close_process_in icc);
      res

let z3 thefilename =
  let icc = Unix.open_process_in ("z3 -smt " ^ thefilename) in
    let res = input_line_no_cr icc in
      ignore (Unix.close_process_in icc);
      res

let mathsat thefilename =
  let icc = Unix.open_process_in ("mathsat -input=smt < " ^ thefilename) in
    let res = input_line_no_cr icc in
      ignore (Unix.close_process_in icc);
      res

let cvc4 thefilename =
  let icc = Unix.open_process_in ("cvc4 --lang=smt1 " ^ thefilename) in
    let res = input_line_no_cr icc in
      ignore (Unix.close_process_in icc);
      res

let yices2 thefilename =
  let icc = Unix.open_process_in ("yices-smt " ^ thefilename) in
    let res = input_line_no_cr icc in
      ignore (Unix.close_process_in icc);
      res

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

(* Executes yices on a formula in a file and gives a satisfying assignment *)
let rec yices_assignment thefilename =
  let start = Unix.gettimeofday () in
  let icc = Unix.open_process_in ("yices -smt -e " ^ thefilename) in
    let res = input_line_no_cr icc in
      (
        smt_time := !smt_time +. (Unix.gettimeofday () -. start);
        if res = "sat" then
          let model = get_yices_model icc [] in
            ignore (Unix.close_process_in icc);
            Some model
        else
        (
          ignore (Unix.close_process_in icc);
          None
        )
      )
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
  let start = Unix.gettimeofday () in
  let icc = Unix.open_process_in ("z3 -smt " ^ thefilename) in
    let res = input_line_no_cr icc in
      (
        smt_time := !smt_time +. (Unix.gettimeofday () -. start);
        if res = "sat" then
          let model = get_z3_model icc [] in
            ignore (Unix.close_process_in icc);
            Some model
        else
        (
          ignore (Unix.close_process_in icc);
          None
        )
    )
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
  let start = Unix.gettimeofday () in
  let icc = Unix.open_process_in ("mathsat -input=smt -model < " ^ thefilename) in
    let res = input_line_no_cr icc in
      smt_time := !smt_time +. (Unix.gettimeofday () -. start);
      if res = "sat" then
        let model = get_mathsat_model icc [] in
          ignore (Unix.close_process_in icc);
          Some model
      else
      (
        ignore (Unix.close_process_in icc);
        None
      )
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
  let start = Unix.gettimeofday () in
  let icc = Unix.open_process_in ("cvc4 --produce-models --dump-models --lang=smt1 " ^ thefilename) in
    let res = input_line_no_cr icc in
      (
        smt_time := !smt_time +. (Unix.gettimeofday () -. start);
        if res = "sat" then
          let model = get_cvc4_model icc [] in
            ignore (Unix.close_process_in icc);
            Some model
        else
        (
          ignore (Unix.close_process_in icc);
          None
        )
    )
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
  let start = Unix.gettimeofday () in
  let icc = Unix.open_process_in ("yices-smt -m " ^ thefilename) in
    let res = input_line_no_cr icc in
      (
        smt_time := !smt_time +. (Unix.gettimeofday () -. start);
        if res = "sat" then
          let model = get_yices2_model icc [] in
            ignore (Unix.close_process_in icc);
            Some model
        else
        (
          ignore (Unix.close_process_in icc);
          None
        )
      )
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

(* Determines whether a list of atoms is conjunctively satisfiable *)
let rec isSatisfiable f =
  match !smt_solver with
    | Yices -> isSatisfiableInternal yices f
    | Z3 -> isSatisfiableInternal z3 f
    | Mathsat -> isSatisfiableInternal mathsat f
    | CVC4 -> isSatisfiableInternal cvc4 f
    | Yices2 -> isSatisfiableInternal yices2 f
and isSatisfiableInternal solver f =
  let (thefilename, formulafile) = Filename.open_temp_file "FORMULA" ".smt" in
    output_string formulafile header;
    output_var_string formulafile (Pc.getVars f);
    output_string formulafile midder;
    conj_to_smt formulafile f;
    output_string formulafile footer;
    close_out formulafile;
    if docleanup then
    (
      at_exit (fun () -> if Sys.file_exists thefilename then Sys.remove thefilename);
    );
    let res = smt solver thefilename in
      if docleanup then
      (
        Sys.remove thefilename;
      );
      res
and output_var_string formulafile vs =
  match vs with
    | [] -> ()
    | _ -> output_string formulafile "  :extrafuns (";
           output_var_string_aux formulafile vs;
           output_string formulafile ")\n"
and output_var_string_aux formulafile vs =
  List.iter (fun v -> output_string formulafile ("(" ^ v ^ " Int) ")) vs
and conj_to_smt formulafile f =
  match f with
    | [] -> output_string formulafile "true"
    | [x] -> output_string formulafile (Pc.atomSMT x)
    | xs -> (
              output_string formulafile "(and\n";
              atoms_to_smt formulafile xs;
              output_string formulafile "\n)"
            )
and atoms_to_smt formulafile atoms =
  List.iter (fun atom -> output_string formulafile (Pc.atomSMT atom)) atoms

(* Determines whether f conjuncted with the negations of f's is conjunctively satisfiable *)
let rec isSatisfiableWithNegations f f's =
  match !smt_solver with
    | Yices -> isSatisfiableWithNegationsInternal yices f f's
    | Z3 -> isSatisfiableWithNegationsInternal z3 f f's
    | Mathsat -> isSatisfiableWithNegationsInternal mathsat f f's
    | CVC4 -> isSatisfiableWithNegationsInternal cvc4 f f's
    | Yices2 -> isSatisfiableWithNegationsInternal yices2 f f's
and isSatisfiableWithNegationsInternal solver f f's =
  let (thefilename, formulafile) = Filename.open_temp_file "FORMULA" ".smt" in
    output_string formulafile header;
    output_var_string formulafile (Utils.remdup ((Pc.getVars f) @ (List.flatten (List.map Pc.getVars f's))));
    output_string formulafile midder;
    output_string formulafile "(and ";
    conj_to_smt formulafile f;
    List.iter (negateConj formulafile) f's;
    output_string formulafile ")";
    output_string formulafile footer;
    close_out formulafile;
    if docleanup then
    (
      at_exit (fun () -> if Sys.file_exists thefilename then Sys.remove thefilename);
    );
    let res = smt solver thefilename in
      if docleanup then
      (
        Sys.remove thefilename;
      );
      res
and negateConj formulafile f =
  output_string formulafile "(not ";
  conj_to_smt formulafile f;
  output_string formulafile ")"

(* Determines whether a list of atoms is conjunctively satisfiable and returns a model *)
let rec getModel f =
  match !smt_solver with
    | Yices -> getModelInternal yices_assignment f
    | Z3 -> getModelInternal z3_assignment f
    | Mathsat -> getModelInternal mathsat_assignment f
    | CVC4 -> getModelInternal cvc4_assignment f
    | Yices2 -> getModelInternal yices2_assignment f
and getModelInternal solver f =
  let (thefilename, formulafile) = Filename.open_temp_file "FORMULA" ".smt" in
    output_string formulafile header;
    output_var_string formulafile (Pc.getVars f);
    output_string formulafile midder;
    conj_to_smt formulafile f;
    output_string formulafile footer;
    close_out formulafile;
    if docleanup then
    (
      at_exit (fun () -> if Sys.file_exists thefilename then Sys.remove thefilename);
    );
    let res = solver thefilename in
      if docleanup then
      (
        Sys.remove thefilename;
      );
      res

(* Determines satisfiability for polynomial interpretations *)
let rec isSatisfiablePolo polyconditions polystrict boundconditions vars =
  match !smt_solver with
    | Yices -> isSatisfiablePoloInternal yices_assignment polyconditions polystrict boundconditions vars
    | Z3 -> isSatisfiablePoloInternal z3_assignment polyconditions polystrict boundconditions vars
    | Mathsat -> isSatisfiablePoloInternal mathsat_assignment polyconditions polystrict boundconditions vars
    | CVC4 -> isSatisfiablePoloInternal cvc4_assignment polyconditions polystrict boundconditions vars
    | Yices2 -> isSatisfiablePoloInternal yices2_assignment polyconditions polystrict boundconditions vars
and isSatisfiablePoloInternal solver polyconditions polystrict boundconditions vars =
  let (thefilename, formulafile) = Filename.open_temp_file "FORMULA" ".smt" in
    output_string formulafile header;
    output_var_string formulafile vars;
    output_string formulafile midder;
    mytoSMT polyconditions polystrict boundconditions formulafile;
    output_string formulafile footer;
    close_out formulafile;
    if docleanup then
    (
      at_exit (fun () -> if Sys.file_exists thefilename then Sys.remove thefilename);
    );
    let res = solver thefilename in
      if docleanup then
      (
        Sys.remove thefilename;
      );
      res
and mytoSMT polyconditions polystrict boundconditions formulafile =
  output_string formulafile "(and ";
  getPolyCond polyconditions formulafile;
  output_string formulafile " ";
  getAutostrict polystrict boundconditions formulafile;
  output_string formulafile ")"
and getPolyCond polyconditions formulafile =
  output_string formulafile "(and ";
  List.iter (fun pc -> getPolyCondOne formulafile pc) polyconditions;
  output_string formulafile ")"
and getPolyCondOne formulafile polycond =
  output_string formulafile "(or ";
  output_list formulafile (List.map Pc.toSMT polycond);
  output_string formulafile ")"
and getAutostrict polystrict boundconditions formulafile =
  output_string formulafile "(or ";
  List.iter2 (fun pc bc -> getAutostrictOne formulafile pc bc) polystrict boundconditions;
  output_string formulafile ")"
and getAutostrictOne formulafile polycond boundcond =
  output_string formulafile "(and ";
  getPolyCondOne formulafile polycond;
  output_string formulafile " ";
  getPolyCondOne formulafile boundcond;
  output_string formulafile ")"
and output_list formulafile list =
  match list with
    | [] -> ()
    | [x] -> output_string formulafile x
    | x::xs -> output_string formulafile (x ^ " "); output_list formulafile xs

(* Determines satisfiability for Farkas-based polynomial interpretations *)
let rec isSatisfiableFarkasPolo weakconds strictconds vars =
  match !smt_solver with
    | Yices -> isSatisfiableFarkasPoloInternal yices_assignment weakconds strictconds vars
    | Z3 -> isSatisfiableFarkasPoloInternal z3_assignment weakconds strictconds vars
    | Mathsat -> isSatisfiableFarkasPoloInternal mathsat_assignment weakconds strictconds vars
    | CVC4 -> isSatisfiableFarkasPoloInternal cvc4_assignment weakconds strictconds vars
    | Yices2 -> isSatisfiableFarkasPoloInternal yices2_assignment weakconds strictconds vars
and isSatisfiableFarkasPoloInternal solver weakconds strictconds vars =
  let (thefilename, formulafile) = Filename.open_temp_file "FORMULA" ".smt" in
    output_string formulafile header;
    output_var_string formulafile vars;
    output_string formulafile midder;
    mytoFarkasSMT weakconds strictconds formulafile;
    output_string formulafile footer;
    close_out formulafile;
    if docleanup then
    (
      at_exit (fun () -> if Sys.file_exists thefilename then Sys.remove thefilename);
    );
    let res = solver thefilename in
      if docleanup then
      (
        Sys.remove thefilename;
      );
      res
and mytoFarkasSMT weakconds strictconds formulafile =
  output_string formulafile "(and ";
  getFarkasPolyCond weakconds formulafile;
  output_string formulafile " ";
  getFarkasAutostrict strictconds formulafile;
  output_string formulafile ")"
and getFarkasPolyCond weakconds formulafile =
  output_string formulafile (Pc.toSMT weakconds)
and getFarkasAutostrict strictconds formulafile =
  if strictconds <> [] then
  (
    output_string formulafile "(or ";
    List.iter (fun pc -> getFarkasAutostrictOne formulafile pc) strictconds;
    output_string formulafile ")"
  )
and getFarkasAutostrictOne formulafile polycond =
  getFarkasPolyCond polycond formulafile

(* Determines satisfiability for Farkas-based polynomial interpretations with minimal elements *)
let rec isSatisfiableFarkasPoloMinimal minrestrictions minimplications weakconds weakminconds boundconds strictconds strictminconds vars =
  match !smt_solver with
    | Yices -> isSatisfiableFarkasPoloMinimalInternal yices_assignment minrestrictions minimplications weakconds weakminconds boundconds strictconds strictminconds vars
    | Z3 -> isSatisfiableFarkasPoloMinimalInternal z3_assignment minrestrictions minimplications weakconds weakminconds boundconds strictconds strictminconds vars
    | Mathsat -> isSatisfiableFarkasPoloMinimalInternal mathsat_assignment minrestrictions minimplications weakconds weakminconds boundconds strictconds strictminconds vars
    | CVC4 -> isSatisfiableFarkasPoloMinimalInternal cvc4_assignment minrestrictions minimplications weakconds weakminconds boundconds strictconds strictminconds vars
    | Yices2 -> isSatisfiableFarkasPoloMinimalInternal yices2_assignment minrestrictions minimplications weakconds weakminconds boundconds strictconds strictminconds vars
and isSatisfiableFarkasPoloMinimalInternal solver minrestrictions minimplications weakconds weakminconds boundconds strictconds strictminconds vars =
  let (thefilename, formulafile) = Filename.open_temp_file "FORMULA" ".smt" in
    output_string formulafile header;
    output_var_string formulafile vars;
    output_string formulafile midder;
    mytoFarkasMinimalSMT minrestrictions minimplications weakconds weakminconds boundconds strictconds strictminconds formulafile;
    output_string formulafile footer;
    close_out formulafile;
    if docleanup then
    (
      at_exit (fun () -> if Sys.file_exists thefilename then Sys.remove thefilename);
    );
    let res = solver thefilename in
      if docleanup then
      (
        Sys.remove thefilename;
      );
      res
and mytoFarkasMinimalSMT minrestrictions minimplications weakconds weakminconds boundconds strictconds strictminconds formulafile =
  output_string formulafile "(and ";
  getFarkasMinimalMinRestrictions minrestrictions formulafile;
  output_string formulafile " ";
  getFarkasMinimalMinImplications minimplications formulafile;
  output_string formulafile " ";
  getFarkasMinimalPolyCond weakconds weakminconds formulafile;
  output_string formulafile " ";
  getFarkasMinimalAutostrict boundconds strictconds strictminconds formulafile;
  output_string formulafile ")"
and getFarkasMinimalMinRestrictions minrestrictions formulafile =
  output_string formulafile (Pc.toSMT minrestrictions)
and getFarkasMinimalMinImplications minimplications formulafile =
  List.iter (getFarkasMinimalMinImplicationsOne formulafile) minimplications
and getFarkasMinimalMinImplicationsOne formulafile (notMin, paramsZero) =
  output_string formulafile "(or ";
  output_string formulafile (Pc.atomSMT notMin);
  output_string formulafile " ";
  output_string formulafile (Pc.toSMT paramsZero);
  output_string formulafile ")"
and getFarkasMinimalPolyCond weakconds weakminconds formulafile =
  List.iter2 (getFarkasMinimalPolyCondOne formulafile) weakconds weakminconds
and getFarkasMinimalPolyCondOne formulafile weak weakmin =
  output_string formulafile "(or ";
  output_string formulafile (Pc.toSMT weak);
  output_string formulafile (Pc.atomSMT weakmin);
  output_string formulafile ")"
and getFarkasMinimalAutostrict boundconds strictconds strictminconds formulafile =
  if strictconds <> [] then
  (
    output_string formulafile "(or ";
    iter3 (getFarkasMinimalAutostrictOne formulafile) boundconds strictconds strictminconds;
    output_string formulafile ")"
  )
and iter3 func a b c =
  match a with
    | [] -> ()
    | x::rest -> func x (List.hd b) (List.hd c); iter3 func rest (List.tl b) (List.tl c)
and getFarkasMinimalAutostrictOne formulafile bound strict strictmin =
  output_string formulafile "(and ";
  output_string formulafile (Pc.toSMT bound);
  output_string formulafile "(or ";
  output_string formulafile (Pc.toSMT strict);
  output_string formulafile (Pc.toSMT strictmin);
  output_string formulafile "))"

(* sizebound stuff *)
let rec isConstantBound cond t c =
  match !smt_solver with
    | Yices -> isConstantBoundInternal yices cond t c
    | Z3 -> isConstantBoundInternal z3 cond t c
    | Mathsat -> isConstantBoundInternal mathsat cond t c
    | CVC4 -> isConstantBoundInternal cvc4 cond t c
    | Yices2 -> isConstantBoundInternal yices2 cond t c
and isConstantBoundInternal solver cond t c =
  let (thefilename, formulafile) = Filename.open_temp_file "FORMULA" ".smt"
  and absTerms = getAbsTerms [(t, "T")] in
    output_string formulafile header;
    output_var_string formulafile (Utils.remdup ((Poly.getVars t) @ (Pc.getVars cond)));
    output_string formulafile (midder ^ "\n");
    output_string formulafile (letifyAbsTerms absTerms);
    output_string formulafile "(and ";
    conj_to_smt formulafile cond;
    output_string formulafile " ";
    output_string formulafile (absIsGtrC (getAbsForT absTerms) c);
    output_string formulafile ")\n";
    output_string formulafile (closes ((List.length absTerms) + 1));
    output_string formulafile footer;
    close_out formulafile;
    if docleanup then
    (
      at_exit (fun () -> if Sys.file_exists thefilename then Sys.remove thefilename);
    );
    let isSat = smt solver thefilename in
      if docleanup then
      (
        Sys.remove thefilename;
      );
      match isSat with
        | Ynm.No -> true
        | _ -> false
and absIsGtrC name c =
  "(> ?" ^ name ^ " " ^ (Poly.toSMT ([], c)) ^ ")"
and getAbsForT absTerms =
  (fst (snd (List.hd absTerms))) ^ "_abs"
and getAbsTerms ts =
  match ts with
    | [] -> []
    | (t, name)::rest -> (t, (name, getAbs t name))::(getAbsTerms rest)
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
    match !smt_solver with
      | Yices -> isMaxBoundInternal yices cond t a c
      | Z3 -> isMaxBoundInternal z3 cond t a c
      | Mathsat -> isMaxBoundInternal mathsat cond t a c
      | CVC4 -> isMaxBoundInternal cvc4 cond t a c
      | Yices2 -> isMaxBoundInternal yices2 cond t a c
and isMaxBoundInternal solver cond t a c =
  let (thefilename, formulafile) = Filename.open_temp_file "FORMULA" ".smt"
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
        conj_to_smt formulafile cond';
        output_string formulafile " ";
        output_string formulafile (absIsGtrMax (getAbsForT absTerms) "?THEMAX");
        output_string formulafile ")\n";
        output_string formulafile (closes ((List.length absTerms) + 1));
        output_string formulafile (closes ((List.length maxTerms) + 1));
        output_string formulafile footer;
        close_out formulafile;
        if docleanup then
        (
          at_exit (fun () -> if Sys.file_exists thefilename then Sys.remove thefilename);
        );
        let isSat = smt solver thefilename in
          if docleanup then
          (
            Sys.remove thefilename;
          );
          match isSat with
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
    match !smt_solver with
      | Yices -> isMaxPlusConstantBoundInternal yices cond t a c
      | Z3 -> isMaxPlusConstantBoundInternal z3 cond t a c
      | Mathsat -> isMaxPlusConstantBoundInternal mathsat cond t a c
      | CVC4 -> isMaxPlusConstantBoundInternal cvc4 cond t a c
      | Yices2 -> isMaxPlusConstantBoundInternal yices2 cond t a c
and isMaxPlusConstantBoundInternal solver cond t a c =
  let (thefilename, formulafile) = Filename.open_temp_file "FORMULA" ".smt"
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
        conj_to_smt formulafile cond';
        output_string formulafile " ";
        output_string formulafile (absIsGtrMaxPlusConstant (getAbsForT absTerms) (getMax maxTerms) c);
        output_string formulafile ")\n";
        output_string formulafile (closes ((List.length absTerms) + 1));
        output_string formulafile (closes (List.length maxTerms));
        output_string formulafile footer;
        close_out formulafile;
        if docleanup then
        (
          at_exit (fun () -> if Sys.file_exists thefilename then Sys.remove thefilename);
        );
        let isSat = smt solver thefilename in
          if docleanup then
          (
            Sys.remove thefilename;
          );
          match isSat with
            | Ynm.No -> true
            | _ -> false
and absIsGtrMaxPlusConstant tabs max c =
  "(> ?" ^ tabs ^ " (+ " ^ max ^ " " ^ (Big_int.string_of_big_int c) ^ "))"

let rec isSumPlusConstantBound cond t c a =
  if a = [] then
    false
  else
    match !smt_solver with
      | Yices -> isSumPlusConstantBoundInternal yices cond t a c
      | Z3 -> isSumPlusConstantBoundInternal z3 cond t a c
      | Mathsat -> isSumPlusConstantBoundInternal mathsat cond t a c
      | CVC4 -> isSumPlusConstantBoundInternal cvc4 cond t a c
      | Yices2 -> isSumPlusConstantBoundInternal yices2 cond t a c
and isSumPlusConstantBoundInternal solver cond t a c =
  let (thefilename, formulafile) = Filename.open_temp_file "FORMULA" ".smt"
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
        conj_to_smt formulafile cond';
        output_string formulafile " ";
        output_string formulafile (absIsGtrSumPlusConstant (getAbsForT absTerms) (getSum sumTerm) c);
        output_string formulafile ")\n";
        output_string formulafile (closes ((List.length absTerms) + 2));
        output_string formulafile footer;
        close_out formulafile;
        if docleanup then
        (
          at_exit (fun () -> if Sys.file_exists thefilename then Sys.remove thefilename);
        );
        let isSat = smt solver thefilename in
          if docleanup then
          (
            Sys.remove thefilename;
          );
          match isSat with
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
    match !smt_solver with
      | Yices -> isScaledSumPlusConstantBoundInternal yices cond t a c s
      | Z3 -> isScaledSumPlusConstantBoundInternal z3 cond t a c s
      | Mathsat -> isScaledSumPlusConstantBoundInternal mathsat cond t a c s
      | CVC4 -> isScaledSumPlusConstantBoundInternal cvc4 cond t a c s
      | Yices2 -> isScaledSumPlusConstantBoundInternal yices2 cond t a c s
and isScaledSumPlusConstantBoundInternal solver cond t a c s =
  let (thefilename, formulafile) = Filename.open_temp_file "FORMULA" ".smt"
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
        conj_to_smt formulafile cond';
        output_string formulafile " ";
        output_string formulafile (absIsGtrScaledSumPlusConstant (getAbsForT absTerms) (getScaledSum scaledSumTerm) c);
        output_string formulafile ")\n";
        output_string formulafile (closes ((List.length absTerms) + 2));
        output_string formulafile footer;
        close_out formulafile;
        if docleanup then
        (
          at_exit (fun () -> if Sys.file_exists thefilename then Sys.remove thefilename);
        );
        let isSat = smt solver thefilename in
          if docleanup then
          (
            Sys.remove thefilename;
          );
          match isSat with
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
