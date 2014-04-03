(*
  Lexer for CINTs

  @author Stephan Falke
  @license This file is distributed under the MIT License (MIT)
           See LICENSE for details
*)

{
  open Cint_parser
  exception Unknown

  let pos = ref 1
  let line = ref 1
}

rule token = parse
  | '#'[^'\n']*                      { EOL }
  | '/''/''/''*''*''*'[^'\n']*'*''*''*''/''/''/' { EOL }
  | 'G''O''A''L'                     { pos := !pos + 4; GOAL }
  | 'C''O''M''P''L''E''X''I''T''Y'   { pos := !pos + 9; COMPLEXITY }
  | 'S''T''A''R''T''T''E''R''M'      { pos := !pos + 9; STARTTERM }
  | 'F''U''N''C''T''I''O''N''S''Y''M''B''O''L''S' { pos := !pos + 15; FUNCTIONSYMBOLS }
  | 'V''A''R'                        { pos := !pos + 3; VART }
  | 'R''U''L''E''S'                  { pos := !pos + 5; RULES }
  | 'T''R''U''E'                     { pos := !pos + 4; TRUE }
  | [' ']                            { incr pos; token lexbuf }
  | ['\t']                           { pos := !pos + 8; token lexbuf }
  | ['\n']                           { pos := 1; incr line; EOL }
  | [',']                            { incr pos; COMMA }
  | '-''>'                           { pos := !pos + 2; TO }
  | 'C''o''m''_'['1'-'9']['0'-'9']*  { let s = Lexing.lexeme lexbuf in
                                         pos := !pos + (String.length s);
                                         COM }
  | ['a'-'z' 'A'-'Z' '_' '$']['a'-'z' 'A'-'Z' '0'-'9' '_' '\'' '.']*
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
  | ':''|'':'                        { pos := !pos + 3; CONSTRAINTSEP }
  | '='                              { incr pos; EQU }
  | '!''='                           { pos := !pos + 2; NEQ }
  | '>''='                           { pos := !pos + 2; GEQ }
  | '>'                              { incr pos; GTR }
  | '<''='                           { pos := !pos + 2; LEQ }
  | '<'                              { incr pos; LSS }
  | '&''&'                           { pos := !pos + 2; CONJ }
  | '/''\\'                          { pos := !pos + 2; CONJ }
  | eof                              { EOF }
  | _                                { raise Unknown }
