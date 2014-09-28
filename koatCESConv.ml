(*
  Convert KoAT examples to CES

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

module VarMap = Map.Make(String)

let ppLoc l = l
let varToPPVarMap =
  let res = ref VarMap.empty in
  for i = 65 to 90 do
    (
      let letter = Char.escaped (Char.chr i) in
      res := VarMap.add (Printf.sprintf "X_%i"  (i - 64)) letter !res;
      for j = 1 to 20 do
        res := VarMap.add (Printf.sprintf "X_%i"  (i - 64 + j*26)) (Printf.sprintf "%s%i" letter j) !res;
      done
    )
  done;
  !res

let ppVar v =
  if (VarMap.mem v varToPPVarMap) then
    VarMap.find v varToPPVarMap
  else
    assert (false)

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
    | Equ (l, r) -> (ppTerm l) ^ " = " ^ (ppTerm r)
    | Neq (l, r) -> (ppTerm l) ^ " != " ^ (ppTerm r)
    | Geq (l, r) -> (ppTerm l) ^ " >= " ^ (ppTerm r)
    | Gtr (l, r) -> (ppTerm l) ^ " > " ^ (ppTerm r)
    | Leq (l, r) -> (ppTerm r) ^ " >= " ^ (ppTerm l)
    | Lss (l, r) -> (ppTerm l) ^ " < " ^ (ppTerm r) in
  if atoms = [] then
    ""
  else
    String.concat ", " (List.map ppCondAtom atoms)

let print_ces_header preVars startSym =
  let open Printf in
  let varString = String.concat "," (List.map ppVar preVars) in
  printf "eq(pubs_start(%s),0,[%s(%s)],[]).\n" varString startSym varString;
  ()

let print_comrule rule =
  let open Printf in
  let ppRuleTerm t =
    Printf.sprintf "%s(%s)" (ppLoc (Term.getFun t)) (String.concat "," (List.map ppTerm (Term.getArgs t))) in
  let lhsString = ppRuleTerm (Comrule.getLeft rule) in
  let rhsString = String.concat "," (List.map ppRuleTerm (Comrule.getRights rule)) in
  let condString = ppCond (Comrule.getCond rule) in
  printf "eq(%s,1,[%s],[%s]).\n" lhsString rhsString condString;
  ()

let main () =
  let filename = Sys.argv.(1) in
  let (startFun, comtrs ) = Parser.parseCint filename Simple.Ctrls in

  (* Rename variables to X_1, ..., X_N *)
  let standardize rule =
    let (_, subst) =
      List.fold_left
        (fun (i, subst) var ->
          (i + 1, (var, Poly.fromVar ("X_" ^ string_of_int i))::subst))
        (1, [])
        (Utils.remdup (Comrule.getVars rule)) in
    let open Comrule in
    { lhs = Term.instantiate rule.lhs subst ;
      rhss = List.map (fun rhs -> Term.instantiate rhs subst) rule.rhss ;
      cond = Pc.instantiate rule.cond subst ; } in
  let stdtrs = List.map standardize comtrs in
 
  print_ces_header (List.map (fun pv -> List.hd (Poly.getVars pv)) (Term.getArgs (Comrule.getLeft (List.hd stdtrs)))) startFun;
  List.iter print_comrule stdtrs

let _ = main ()
