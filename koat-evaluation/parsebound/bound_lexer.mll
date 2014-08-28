(*
  Lexer for complexity bounds

  @author Marc Brockschmidt
  @license This file is distributed under the MIT License (MIT)
           See LICENSE for details
*)

{
  open Bound_parser
  exception Unknown

  let pos = ref 1
  let line = ref 1
}

let digit    = ['0'-'9']
let alphlet  = [        'a'-'z' 'A'-'Z' '_' '\'' '.' ]
let letdig   = ['0'-'9' 'a'-'z' 'A'-'Z' '_' '\'' '.' ]
let ws       = [' ' '\009' '\012']

rule token = parse
  | ws                            { pos := !pos + 1; token lexbuf }
  | ['\r' '\n']                   { pos := 1; incr line; EOL }
  | eof                           { EOF }

  | '+'                           { pos := !pos + 1; PLUS }
  | '-'                           { pos := !pos + 1; MINUS }
  | '*'                           { pos := !pos + 1; TIMES }
  | '/'                           { pos := !pos + 1; DIV }
  | '^'                           { pos := !pos + 1; POWER }

  | ['l' 'L'] ['o' 'O'] ['g' 'G'] { pos := !pos + 3; LOG }
  | ['p' 'P'] ['o' 'O'] ['w' 'W'] { pos := !pos + 3; POW }
  | ['m' 'M'] ['a' 'A'] ['x' 'X'] { pos := !pos + 3; MAX }
  | ['m' 'M'] ['i' 'I'] ['n' 'N'] { pos := !pos + 3; MIN }
  | ['n' 'N'] ['a' 'A'] ['t' 'T'] { pos := !pos + 3; NAT }

  | ','                           { pos := !pos + 1; COMMA }
  | '('                           { pos := !pos + 1; LPAREN }
  | ')'                           { pos := !pos + 1; RPAREN }
  | '['                           { pos := !pos + 1; LBRACK }
  | ']'                           { pos := !pos + 1; RBRACK }

  | (digit)+                      { let s = Lexing.lexeme lexbuf in
                                    pos := !pos + (String.length s);
                                    INT (Big_int.big_int_of_string s) }
  | (alphlet)(letdig)*            { let s = Lexing.lexeme lexbuf in
                                    pos := !pos + (String.length s);
                                    IDENT s }
