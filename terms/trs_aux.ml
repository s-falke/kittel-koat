(*
  Convenience function of TRS parsing

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

(* Parses a trs from an in_channel. *)
let rec getTrs chan =
  try
    Trs_lexer.pos := 1;
    Trs_lexer.line := 1;
    let lexbuf = Lexing.from_channel chan in
      check (remdup (Trs_parser.trs_eol Trs_lexer.token lexbuf))
  with
    | Parsing.Parse_error ->
        raise
          (
            ParseException
              (
                !Trs_lexer.line,
                !Trs_lexer.pos,
                Printf.sprintf "Error: Parse error in line %d at position %d." !Trs_lexer.line !Trs_lexer.pos
              )
          )
    | Trs_lexer.Unknown ->
        raise
          (
            ParseException
              (
                !Trs_lexer.line,
                !Trs_lexer.pos,
                Printf.sprintf "Error: Unknown token in line %d at position %d." !Trs_lexer.line !Trs_lexer.pos
              )
          )
and remdup trs =
  List.map remdupRule trs
and remdupRule r =
  Rule.create (Rule.getLeft r) (Rule.getRight r) (Utils.remdupC Pc.equalAtom (Rule.getCond r))
and check trs =
  match trs with
    | [] -> raise (ParseException (0, 0, "A TRS cannot be empty!"))
    | _ -> check_lhs (check_arity trs) (*check_cond (check_lhs (check_arity trs))*)
and check_arity trs =
  let funs = Utils.remdup (List.flatten (List.map (fun rule -> (Rule.getFuns rule)) trs)) in
    List.iter (check_arity_fun trs) funs;
    trs;
and check_arity_fun trs f =
  let arities = Utils.remdup (getArities trs f) in
    if List.length arities > 1 then
      raise (ParseException (0, 0, "All occurrences of function symbol " ^ f ^ " need to have the same arity!"))
and getArities trs f =
  match trs with
    | [] -> []
    | r::rr -> (getAritiesOne (Rule.getLeft r) f) @ (getAritiesOne (Rule.getRight r) f) @ (getArities rr f)
and getAritiesOne (f, args) g =
  if f = g then
    [ List.length args ]
  else
    []
and check_lhs trs =
  match trs with
    | [] -> []
    | r::rr -> if check_lhs_rule r then
                 r::(check_lhs rr)
               else
                 raise (ParseException (0, 0, "Arguments on lhs need to be distinct variables!"))
and check_lhs_rule r =
  let args = Term.getArgs (Rule.getLeft r) in
    (List.for_all Poly.isVar args) && (check_distinct args [])
and check_distinct args seen =
  match args with
    | [] -> true
    | a::l -> let varname = List.hd (Poly.getVars a) in
                if (Utils.contains seen varname) then
                  false
                else
                  check_distinct l (varname::seen)
and check_cond trs =
  match trs with
    | [] -> []
    | r::rr -> if check_cond_rule r then
                 r::(check_cond rr)
               else
                 raise (ParseException (0, 0, "Conditions need to be linear!"))
and check_cond_rule rule =
  (Pc.isLinear (Rule.getCond rule))
