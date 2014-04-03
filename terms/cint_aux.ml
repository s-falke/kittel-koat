(*
  Convenience function of CINT parsing

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

(* General parse exception. *)
exception ParseException of int * int * string

(* Parses a cint from a filename *)
let rec parse filename =
  let inchan = open_in filename in
    let res = getCint inchan in
      close_in inchan;
      res
and getCint chan =
  try
    Cint_lexer.pos := 1;
    Cint_lexer.line := 1;
    let lexbuf = Lexing.from_channel chan in
      let (startFun, tmp) = Cint_parser.cint_eol Cint_lexer.token lexbuf in
        let tmp1 = check (remdup tmp) in
          let (startFun', tmp2) = sanitize tmp1 startFun in
            (startFun', internalize (removeNeq tmp2))
  with
    | Parsing.Parse_error ->
        raise
          (
            ParseException
              (
                !Cint_lexer.line,
                !Cint_lexer.pos,
                Printf.sprintf "Error: Parse error in line %d at position %d." !Cint_lexer.line !Cint_lexer.pos
              )
          )
    | Cint_lexer.Unknown ->
        raise
          (
            ParseException
              (
                !Cint_lexer.line,
                !Cint_lexer.pos,
                Printf.sprintf "Error: Unknown token in line %d at position %d." !Cint_lexer.line !Cint_lexer.pos
              )
          )

and remdup cint =
  List.map remdupComrule cint
and remdupComrule (l, rs, c) =
  (l, rs, remdupC c)
and remdupC c =
  match c with
    | [] -> []
    | x::xs -> x::(remdupC (List.filter (fun y -> not (Pc.equalAtom x y)) xs))

and check cint =
  match cint with
    | [] -> raise (ParseException (0, 0, "A CINT cannot be empty!"))
    | _ -> check_lhs (check_arity cint)
and check_arity cint =
  let funs = Utils.remdup (List.flatten (List.map (fun rule -> (Comrule.getFuns rule)) cint)) in
    List.iter (check_arity_fun cint) funs;
    cint;
and check_arity_fun cint f =
  let arities = Utils.remdup (getArities cint f) in
    if List.length arities > 1 then
      raise (ParseException (0, 0, "All occurrences of function symbol " ^ f ^ " need to have the same arity!"))
and getArities cint f =
  match cint with
    | [] -> []
    | (l, rs, _)::rr -> (getAritiesOne l f) @ (List.flatten (List.map (fun r -> getAritiesOne r f) rs)) @ (getArities rr f)
and getAritiesOne (f, args) g =
  if f = g then
    [ List.length args ]
  else
    []
and check_lhs cint =
  match cint with
    | [] -> []
    | r::rr -> if check_lhs_rule r then
                 r::(check_lhs rr)
               else
                 raise (ParseException (0, 0, "Arguments on lhs need to be distinct variables!"))
and check_lhs_rule r =
  let args = Term.getArgs (Comrule.getLeft r) in
    (List.for_all Poly.isVar args) && (check_distinct args [])
and check_distinct args seen =
  match args with
    | [] -> true
    | a::l -> let varname = List.hd (Poly.getVars a) in
                if (Utils.contains seen varname) then
                  false
                else
                  check_distinct l (varname::seen)

and sanitize trs startFun =
  let (newtrs, newstart) = sanitizeFuns trs startFun in
    (newstart, List.map sanitizeRule newtrs)
and sanitizeFuns trs startFun =
  let funs = Cint.getFuns trs in
    let mapping = createFunMapping funs funs in
      (List.map (applyFunMapping mapping) trs, List.assoc startFun mapping)
and createFunMapping funs used =
  match funs with
    | [] -> []
    | f::ff -> if isBad f then
                 let fnew = getNewName f used in
                   (f, fnew)::(createFunMapping ff (fnew::used))
                 else
                   (f, f)::(createFunMapping ff used)
and applyFunMapping mapping (l, rs, c) =
  (applyFunMappingTerm mapping l, List.map (applyFunMappingTerm mapping) rs, c)
and applyFunMappingTerm mapping (f, args) =
  (List.assoc f mapping, args)
and sanitizeRule (l, rs, c) =
  let vars = Comrule.getVars (l, rs, c) in
    let varmapping = createVarMapping vars vars in
      (Term.renameVars varmapping l, List.map (Term.renameVars varmapping) rs, Pc.renameVars varmapping c)
and createVarMapping vars used =
  match vars with
    | [] -> []
    | v::vv -> if isBad v then
                 let vnew = getNewName v used in
                   (v, vnew)::(createVarMapping vv (vnew::used))
               else
                 createVarMapping vv used
and isBad v =
  (v.[0] = '$') || (v.[0] = '_') || (v.[0] >= 'A' && v.[0] <= 'Z')
and getNewName v used =
  let cand = getCand v in
    attachPrimes cand used
and getCand v =
  let rest = (String.sub v 1 ((String.length v) - 1)) in
    if v.[0] = '$' then
      "dollar" ^ rest
    else if v.[0] = '_' then
      "underscore" ^ rest
    else
      String.uncapitalize v
and attachPrimes cand used =
  if (Utils.contains used cand) then
    attachPrimes (cand ^ "'") used
  else
    cand

and removeNeq trs =
  List.flatten (List.map removeNeqRule trs)
and removeNeqRule (l, r, c) =
  let c's = removeNeqConstraint c in
    List.map (fun c' -> (l, r, c')) c's
and removeNeqConstraint c =
  match c with
    | [] -> [[]]
    | a::rest -> let c's = removeNeqConstraint rest in
                   match a with
                     | Pc.Neq (l, r) -> (addIn (Pc.Gtr (l, r)) c's) @ (addIn (Pc.Lss (l, r)) c's)
                     | _ -> addIn a c's
and addIn atom cs =
  List.map (fun c -> atom::c) cs

and internalize cint =
  List.map Comrule.internalize cint
