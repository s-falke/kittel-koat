(*
  Lexer for programs in a fragment of Simple

  @author Stephan Falke
  @license This file is distributed under the MIT License (MIT)
           See LICENSE for details
*)

{
  open Simple_parser
  exception Unknown

  let pos = ref 1
  let line = ref 1
}

rule token = parse
  | '/''*' [^'\n']* '*''/'           { token lexbuf }
  | [' ']                            { incr pos; token lexbuf }
  | ['\t']                           { pos := !pos + 8; token lexbuf }
  | ['\n']                           { pos := 1; incr line; token lexbuf }
  | ';'                              { incr pos; SEMI }
  | ':'                              { incr pos; COLON }
  | ','                              { incr pos; COMMA }
  | ['+' '-' ]                       { let s = Lexing.lexeme lexbuf in
                                         pos := !pos + (String.length s);
                                         INFIX s }
  | [ '*' ]                          { incr pos; TIMES }
  | '0'                              { incr pos; INT "0" }
  | ['1'-'9']['0'-'9']*              { let s = Lexing.lexeme lexbuf in
                                         pos := !pos + (String.length s);
                                         INT s }
  | '('                              { incr pos; OPENPAR }
  | ')'                              { incr pos; CLOSEPAR }
  | '=''='                           { incr pos; EQU }
  | '='                              { incr pos; ASSIGN }
  | '>''='                           { pos := !pos + 2; GEQ }
  | '>'                              { incr pos; GTR }
  | '<''='                           { pos := !pos + 2; LEQ }
  | '<'                              { incr pos; LSS }
  | 'a''n''d'                        { pos := !pos + 3; AND }
  | 'o''r'                           { pos := !pos + 2; OR }
  | 's''k''i''p'                     { pos := !pos + 4; SKIP }
  | 'h''a''l''t'                     { pos := !pos + 4; HALT }
  | 'f''a''i''l'                     { pos := !pos + 4; HALT }
  | 'a''s''s''u''m''e'               { pos := !pos + 6; ASSUME }
  | 'r''a''n''d''o''m'               { pos := !pos + 6; RANDOM }
  | 'b''r''a''n''d''o''m'            { pos := !pos + 7; BRANDOM }
  | 'i''f'                           { pos := !pos + 2; IF }
  | 't''h''e''n'                     { pos := !pos + 4; THEN }
  | 'e''l''s''e'                     { pos := !pos + 4; ELSE }
  | 'e''n''d''i''f'                  { pos := !pos + 5; ENDIF }
  | 'w''h''i''l''e'                  { pos := !pos + 5; WHILE }
  | 'd''o'                           { pos := !pos + 2; DO }
  | 'd''o''n''e'                     { pos := !pos + 4; DONE }
  | 't''r''u''e'                     { pos := !pos + 4; TRUE }
  | 'f''a''l''s''e'                  { pos := !pos + 5; FALSE }
  | 'b''e''g''i''n'                  { pos := !pos + 5; BEGIN }
  | 'e''n''d'                        { pos := !pos + 3; END }
  | 'i''n''t'                        { pos := !pos + 3; INTT }
  | 'v''a''r'                        { pos := !pos + 3; VAR }
  | 'n''o''t'                        { pos := !pos + 3; NOT }
  | 'p''r''o''c'                     { pos := !pos + 4; PROC }
  | 'r''e''t''u''r''n''s'            { pos := !pos + 7; RETURNS }
  | ['a'-'z' 'A' - 'Z']['a'-'z' 'A'-'Z' '0'-'9']*
                                     { let s = Lexing.lexeme lexbuf in
                                         pos := !pos + (String.length s);
                                         IDENT s }
  | eof                              { EOF }
  | _                                { raise Unknown }
