(*
  Parsing and transformation of complexity bounds.

  @author Marc Brockschmidt
  @license This file is distributed under the MIT License (MIT)
           See LICENSE for details
*)

let parse inputStr =
  Bound_lexer.pos := 1;
  let lexbuf = Lexing.from_string inputStr in
  Bound_parser.bound_expr Bound_lexer.token lexbuf

let _ =
  let input = input_line stdin in
  try
    let bound = parse input in
    Printf.printf "'parsedBound': \"%s\", degree: %.1f, variableCount: %i" (Bound.pp bound) (Bound.tonumdegree bound) (List.length (Bound.getVars bound));
  with
  | _ -> Printf.printf "'parseError': 'Could not parse bound'"
      
