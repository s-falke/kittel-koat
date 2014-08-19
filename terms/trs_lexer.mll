(*
  Lexer for TRSs

  @author Stephan Falke
  @license This file is distributed under the MIT License (MIT)
           See LICENSE for details
*)

{
  open Trs_parser
  exception Unknown

  let pos = ref 1
  let line = ref 1
}

rule token = parse
  | '#'[^'\n']*                      { EOL }
  | '/''/''/''*''*''*'[^'\n']*'*''*''*''/''/''/' { EOL }
  | [' ']                            { incr pos; token lexbuf }
  | ['\t']                           { pos := !pos + 8; token lexbuf }
  | ['\r' '\n']                      { pos := 1; incr line; EOL }
  | [',']                            { incr pos; COMMA }
  | '-''>'                           { pos := !pos + 2; TO }
  | ['a'-'z']['a'-'z' 'A'-'Z' '0'-'9' '_' '\'' '.']*
                                     { let s = Lexing.lexeme lexbuf in
                                         pos := !pos + (String.length s);
                                         IDENT s }
  | ['+' '-' ]                       { let s = Lexing.lexeme lexbuf in
                                         pos := !pos + (String.length s);
                                         INFIX s }
  | [ '*' ]                          { incr pos; TIMES }
  | [ '^' ]                          { incr pos; POWER }
  | '0'                              { incr pos; INT "0" }
  | ['1'-'9']['0'-'9']*              { let s = Lexing.lexeme lexbuf in
                                         pos := !pos + (String.length s);
                                         INT s }
  | '('                              { incr pos; OPENPAR }
  | ')'                              { incr pos; CLOSEPAR }
  | '['                              { incr pos; OPENSQ }
  | ']'                              { incr pos; CLOSESQ }
  | '='                              { incr pos; EQU }
  | '>''='                           { pos := !pos + 2; GEQ }
  | '>'                              { incr pos; GTR }
  | '<''='                           { pos := !pos + 2; LEQ }
  | '<'                              { incr pos; LSS }
  | '/''\\'                          { pos := !pos + 2; CONJ }
  | eof                              { EOF }
  | _                                { raise Unknown }
