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

type term =
| AtomT of Poly.poly
| Ite of formula * term * term
and formula =
| And of (formula list)
| AndA of (Pc.atom list) (* shortcut because conj of atoms is so common *)
| Or of (formula list)
| Not of formula
| Atom of Pc.atom
| Let of Poly.var * term * formula (* let var = term in formula *)


let docleanup = true

let smt_solver = ref Yices

let smt_time = ref 0.0

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
    | Let (var, term, formula) ->
      output_string file ("(let (" ^ var ^ " ") ;
      term_to_smt_file file term ;
      output_string file ") (" ;
      formula_to_smt_file file formula ;
      output_string file "))"
and term_to_smt_file file term =
  match term with
  | AtomT term ->
    output_string file (Poly.toSMT term)
  | Ite (condFormula, thenTerm, elseTerm) ->
    output_string file "(ite (" ;
    formula_to_smt_file file condFormula ;
    output_string file ") (" ;
    term_to_smt_file file thenTerm ;
    output_string file ") (" ;
    term_to_smt_file file elseTerm ;
    output_string file "))"

let write_smt_file vars formula =
  let (thefilename, formulafile) = Filename.open_temp_file "FORMULA_1_" ".smt" in
  output_string formulafile "(benchmark kittel_formula\n  :status unknown\n  :logic QF_LIA\n" ;
  output_var_string formulafile vars;
  output_string formulafile "  :formula " ;
  formula_to_smt_file formulafile formula;
  output_string formulafile "\n)" ;
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


(* Sizebound stuff. First the little helpers for absolute values and maximum computation, then the actual checks. *)

let getAbsVarName var =
  "." ^ var ^ "_abs"
let getAbsValueFormulaForTerm term =
  Ite (Atom (Pc.Geq (term, Poly.zero)), AtomT term, AtomT (Poly.negate term))

(* Constructs a formula such that var is assigned the maximum value of term in innerFormula *)
let setToAbsValue var term innerFormula =
  let termVarName = ".T." ^ var in
  Let (termVarName, AtomT term,
       Let (var, getAbsValueFormulaForTerm (Poly.fromVar termVarName),
            innerFormula))

(* Constructs a sequence of (let (.VAR_abs (...) )) statements, with innerFormula in the middle: *)
let absifyVars vars innerFormula =
  List.fold_left
    (fun resFormula var ->
      let absVarName = getAbsVarName var in
      Let (absVarName, getAbsValueFormulaForTerm (Poly.fromVar var), resFormula))
    innerFormula
    vars

(* Constructs a formula that encloses innerFormula, computes the max of the absolutes of a list of variables vars, and sets maxVar to that value. *)
let setToAbsMaxOf maxVar vars innerFormula =
  let maxVarNamePrefix = ".MAX_" in
  let varNum = List.length vars in
  (* Set the maxVar to the computed maximal value. *)
  let resFormula =
    Let (maxVar, AtomT (Poly.fromVar (maxVarNamePrefix ^ (string_of_int varNum))), innerFormula) in
  (* Compute the maximal value of the absolutes, by doing pairwise max using If-then-else *)
  let resFormula =
    Let (maxVarNamePrefix ^ "0",
         AtomT Poly.zero,
         (fst (List.fold_left
                 (fun (resFormula, idx) var ->
                   let previousMaxVar = maxVarNamePrefix ^ (string_of_int (idx - 1)) in
                   (Let (maxVarNamePrefix ^ (string_of_int idx),
                         Ite (Atom (Pc.Gtr (Poly.fromVar previousMaxVar, Poly.fromVar (getAbsVarName var))), 
                              AtomT (Poly.fromVar previousMaxVar), 
                              AtomT (Poly.fromVar (getAbsVarName var))),
                         resFormula),
                    idx - 1))
                 (resFormula, varNum)
                 vars))) in
  (* Finally define all the _abs variables *)
  absifyVars vars resFormula

(* Constructs a formula that encloses innerFormula, computes the sum of the absolutes of a list of variables vars, and sets sumVar to that value. *)
let setToAbsSumOf sumVar vars innerFormula =
  (* Define the sum: *)
  let resFormula =
    Let (sumVar, AtomT (List.fold_left Poly.add Poly.zero (List.map (fun v -> Poly.fromVar (getAbsVarName v)) vars)), innerFormula) in
  (* Define the absolutes: *)
  absifyVars vars resFormula

(* Check if cond -> argument <= constBound *)
let isConstantBound cond argument constBound =
  (* We construct 
     (let (.T argument) 
      (let (.T_abs (ite (>= .T 0) .T (- .T))) 
       (and cond (> ?T_abs constBound))))
     and then check if this is UNSAT.
     If yes, maxBound is a constant bound.
     We use "." as prefix because we do not allow variables from the input to start with "." 
   *)
  let absArgumentVarName = getAbsVarName ".T" in

  let checkFormula = AndA ((Pc.Gtr ((Poly.fromVar absArgumentVarName), (Poly.fromConstant constBound))) :: cond) in
  let checkFormula = setToAbsValue absArgumentVarName argument checkFormula in
  let vars = Utils.remdup ((Pc.getVars cond) @ (Poly.getVars argument)) in

  let filename = write_smt_file vars checkFormula in
  match (smt_file_check_satisfiable filename) with
  | Ynm.No -> true
  | _ -> false

(* Check if cond -> argument <= max { abs(v) | v \in (constBound :: inVars) } *)
let isMaxBound cond argument constBound inVars =
  if inVars = [] then
    false (* should be a constant bound then, which we check first. *)
  else
    (* We construct
       (let (.T argument)
        (let (.T_abs (ite (>= T. 0) .T (- .T)))
         (let (.VAR1_abs (ite (>= VAR1 0) VAR1 (- VAR1))) 
          (let (.VAR2_abs (ite (>= VAR2 0) VAR2 (- VAR2))) 
           ...
           (let (.VARK_abs (ite (>= VARK 0) VARK (- VARK))) 
            (let (.MAX_0 0)
             (let (.MAX_1 (ite (> .MAX_0 .VAR1_abs) .MAX_0 .VAR1_abs))
              (let (.MAX_2 (ite (> .MAX_1 .VAR2_abs) .MAX_1 .VAR2_abs))
              ...
               (let (.MAX_K (ite (> .MAX_{K-1} .VARK_abs) .MAX_{K-1} .VARK_abs))
                (let (.MAX (ite (> .MAX_K constBound) .MAX_K constBound))
                 (and cond (> .T_abs .MAX))))))))))))
       and check for UNSAT. If yes, then we have a max-bound.
       We use "." as prefix because we do not allow variables from the input to start with ".".
    *)
    let maxVarName = ".MAX" in
    let absArgumentVarName = getAbsVarName ".T" in

    (* We build this from the inner part out, starting wit the actual check: *)
    let checkFormula = AndA ((Pc.Gtr (Poly.fromVar absArgumentVarName, Poly.fromVar maxVarName)) :: cond) in

    (* Now define the .MAX variable as max(.MAX_VALUES, constBound) *)
    let checkFormula =
      Let (maxVarName,
           (Ite (Atom (Pc.Gtr (Poly.fromVar ".MAX_VALUES", Poly.fromConstant constBound)),
                 AtomT (Poly.fromVar ".MAX_VALUES"),
                 AtomT (Poly.fromConstant constBound))),
           checkFormula) in

    (* Compute the .MAX_VALUES variable: *)
    let checkFormula = setToAbsMaxOf ".MAX_VALUES" inVars checkFormula in

    (* Finally define the thing that we want to bound *)
    let checkFormula = setToAbsValue absArgumentVarName argument checkFormula in

    let vars = Utils.remdup ((Pc.getVars cond) @ (Poly.getVars argument) @ inVars) in
    let filename = write_smt_file vars checkFormula in
    match (smt_file_check_satisfiable filename) with
    | Ynm.No -> true
    | _ -> false

(* Check if cond -> argument <= max { abs(v) | v \in inVars } + constSum *)
let isMaxPlusConstantBound cond argument constSum inVars =
  if inVars = [] then
    false (* should be a constant bound then, which we check first. *)
  else
    (* We construct
       (let (.T argument)
        (let (.T_abs (ite (>= T. 0) .T (- .T)))
         (let (.VAR1_abs (ite (>= VAR1 0) VAR1 (- VAR1))) 
          (let (.VAR2_abs (ite (>= VAR2 0) VAR2 (- VAR2))) 
           ...
           (let (.VARK_abs (ite (>= VARK 0) VARK (- VARK))) 
            (let (.MAX0 0)
             (let (.MAX1 (ite (> .MAX0 .VAR1_abs) .MAX0 .VAR1_abs))
              (let (.MAX2 (ite (> .MAX1 .VAR2_abs) .MAX1 .VAR2_abs))
              ...
               (let (.MAXK (ite (> .MAX{K-1} .VARK_abs) .MAX{K-1} .VARK_abs))
                (and cond (> .T_abs (+ .MAXK constBound)))))))))))
       and check for UNSAT. If yes, then we have a constant add-bound.
    *)
    let absArgumentVarName = getAbsVarName ".T" in
    let maxVarName = ".MAX" in

    (* We build this from the inner part out, starting wit the actual check: *)
    let checkFormula = AndA (Pc.Gtr (Poly.fromVar absArgumentVarName, (Poly.add (Poly.fromVar maxVarName) (Poly.fromConstant constSum))) :: cond) in

    (* Compute the .MAX_VALUES variable: *)
    let checkFormula = setToAbsMaxOf maxVarName inVars checkFormula in    

    (* Define the absolute value of the thing that we want to bound *)
    let checkFormula = setToAbsValue absArgumentVarName argument checkFormula in

    let vars = Utils.remdup ((Pc.getVars cond) @ (Poly.getVars argument) @ inVars) in
    let filename = write_smt_file vars checkFormula in
    match (smt_file_check_satisfiable filename) with
    | Ynm.No -> true
    | _ -> false


(* Check if cond -> argument <= sum { abs(v) | v \in inVars } + constSum *)
let isSumPlusConstantBound cond argument constSum inVars =
  if inVars = [] then
    false (* Should be a constant bound then, which we check first. *)
  else
    (* We construct
       (let (.T argument)
        (let (.T_abs (ite (>= T. 0) .T (- .T)))
         (let (.VAR1_abs (ite (>= VAR1 0) VAR1 (- VAR1))) 
          (let (.VAR2_abs (ite (>= VAR2 0) VAR2 (- VAR2))) 
           ...
           (let (.VARK_abs (ite (>= VARK 0) VARK (- VARK)))
            (let (.SUM_abs (+ (+ ... (+ VAR1_abs VAR2_abs) VAR3_abs) ...))
             (and cond (> argument (+ .SUM_abs constSum)))))))))
       and check for UNSAT. If yes, then we have a sum-bound.
    *)
    let absArgumentVarName = getAbsVarName ".T" in
    let sumVarName = ".SUM" in

    (* We build this from the inner part out, starting wit the actual check: *)
    let checkFormula = AndA (Pc.Gtr (Poly.fromVar absArgumentVarName, (Poly.add (Poly.fromVar sumVarName) (Poly.fromConstant constSum))) :: cond) in

    (* Compute the .SUM variable: *)
    let checkFormula = setToAbsSumOf sumVarName inVars checkFormula in    

    (* Define the absolute value of the thing that we want to bound *)
    let checkFormula = setToAbsValue absArgumentVarName argument checkFormula in

    let vars = Utils.remdup ((Pc.getVars cond) @ (Poly.getVars argument) @ inVars) in
    let filename = write_smt_file vars checkFormula in
    match (smt_file_check_satisfiable filename) with
    | Ynm.No -> true
    | _ -> false

(* Check if cond -> argument <= (constScale * sum { abs(v) | v \in inVars } + constSum) *)
let isScaledSumPlusConstantBound cond argument constSum constScale inVars =
  if inVars = [] then
    false (* Should be a constant bound then, which we check first. *)
  else
    (* We construct
       (let (.T argument)
        (let (.T_abs (ite (>= T. 0) .T (- .T)))
         (let (.VAR1_abs (ite (>= VAR1 0) VAR1 (- VAR1))) 
          (let (.VAR2_abs (ite (>= VAR2 0) VAR2 (- VAR2))) 
           ...
           (let (.VARK_abs (ite (>= VARK 0) VARK (- VARK)))
            (let (.SUM_abs (+ (+ ... (+ VAR1_abs VAR2_abs) VAR3_abs) ...))
             (and cond (> argument ( * constScale (+ .SUM_abs constSum))))))))))
       and check for UNSAT. If yes, then we have a sum-bound.
    *)
    let absArgumentVarName = getAbsVarName ".T" in
    let sumVarName = ".SUM" in

    (* We build this from the inner part out, starting wit the actual check: *)
    let checkFormula = AndA (Pc.Gtr (Poly.fromVar absArgumentVarName, (Poly.constmult (Poly.add (Poly.fromVar sumVarName) (Poly.fromConstant constSum)) constScale)) :: cond) in

    (* Compute the .SUM variable: *)
    let checkFormula = setToAbsSumOf sumVarName inVars checkFormula in    

    (* Define the absolute value of the thing that we want to bound *)
    let checkFormula = setToAbsValue absArgumentVarName argument checkFormula in

    let vars = Utils.remdup ((Pc.getVars cond) @ (Poly.getVars argument) @ inVars) in
    let filename = write_smt_file vars checkFormula in
    match (smt_file_check_satisfiable filename) with
    | Ynm.No -> true
    | _ -> false
