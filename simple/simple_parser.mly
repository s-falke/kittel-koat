/*
  Parser for programs in a fragment of Simple

  @author Stephan Falke
  @license This file is distributed under the MIT License (MIT)
           See LICENSE for details
*/

%token <string> IDENT INFIX INT
%token COLON SEMI COMMA OPENPAR CLOSEPAR EOL ASSIGN EQU EOF GEQ GTR LEQ LSS AND TIMES SKIP HALT ASSUME RANDOM IF TTHEN EELSE EENDIF WHILE DO DONE TRUE FALSE BRANDOM BEGIN EEND INTT VAR OR NOT PROC RETURNS

%left INFIX
%left TIMES
%nonassoc IDENT

%start program
%type <Simple.program> program

%%

program:
| VAR vars_decl SEMI BEGIN statement_list EEND
    { ([], $2, $5) }
| proc_def_list VAR vars_decl SEMI BEGIN statement_list EEND
    { ($1, $3, $6) }
| BEGIN statement_list EEND
    { ([], [], $2) }
| proc_def_list BEGIN statement_list EEND
    { ($1, [], $3) }
;

proc_def_list:
| proc_def
    { [$1] }
| proc_def proc_def_list
    { $1::$2 }
;

proc_def:
| PROC IDENT OPENPAR vars_decl CLOSEPAR RETURNS OPENPAR CLOSEPAR BEGIN statement_list EEND
    { ($2, $4, None, [], $10) }
| PROC IDENT OPENPAR vars_decl CLOSEPAR RETURNS OPENPAR CLOSEPAR VAR vars_decl SEMI BEGIN statement_list EEND
    { ($2, $4, None, $10, $13) }
| PROC IDENT OPENPAR vars_decl CLOSEPAR RETURNS OPENPAR var_decl CLOSEPAR BEGIN statement_list EEND
    { ($2, $4, Some $8, [], $11) }
| PROC IDENT OPENPAR vars_decl CLOSEPAR RETURNS OPENPAR var_decl CLOSEPAR VAR vars_decl SEMI BEGIN statement_list EEND
    { ($2, $4, Some $8, $11, $14) }
;

var_decl:
| IDENT COLON INTT
    { $1 }
;

vars_decl:
| IDENT COLON INTT
    { [$1] }
| IDENT COLON INTT COMMA vars_decl
    { $1::$5 }
;

statement_list:
| statement
    { [$1] }
| statement statement_list
    { $1::$2 }
;

statement:
| SKIP SEMI
    { Simple.Skip }
| HALT SEMI
    { Simple.Halt }
| ASSUME OPENPAR bexpr CLOSEPAR SEMI
    { Simple.Assume $3 }
| IDENT ASSIGN RANDOM SEMI
    { Simple.Random $1 }
| IDENT ASSIGN poly SEMI
    { Simple.Assign ($1, Poly.construct_poly $3) }
| IF OPENPAR bexpr CLOSEPAR TTHEN statement_list EELSE statement_list EENDIF SEMI
    { Simple.ITE ($3, $6, $8) }
| IF OPENPAR bexpr CLOSEPAR TTHEN statement_list EENDIF SEMI
    { Simple.ITE ($3, $6, [Simple.Skip]) }
| WHILE OPENPAR bexpr CLOSEPAR DO statement_list DONE SEMI
    { Simple.While ($3, $6) }
| IDENT ASSIGN IDENT OPENPAR var_list CLOSEPAR SEMI
    { Simple.Call (Some $1, $3, $5) }
| OPENPAR CLOSEPAR ASSIGN IDENT OPENPAR var_list CLOSEPAR SEMI
    { Simple.Call (None, $4, $6) }
;

var_list:
| IDENT
    { [$1] }
| IDENT COMMA var_list
    { $1::$3 }
;

bexpr:
| TRUE
    { Simple.True }
| FALSE
    { Simple.False }
| BRANDOM
    { Simple.BRandom }
| cond
    { Simple.Atom $1 }
| NOT OPENPAR bexpr CLOSEPAR
    { Simple.Not $3 }
| OPENPAR bexpr CLOSEPAR OR OPENPAR bexpr CLOSEPAR
    { Simple.Or ($2, $6) }
| OPENPAR bexpr CLOSEPAR AND OPENPAR bexpr CLOSEPAR
    { Simple.And ($2, $6) }
;

poly:
| mult_monomial
    { [$1] }
| mult_monomial INFIX poly
    { let push_sign sgn l =
        match l with
          | [] -> []
          | (c, s)::l' -> (Big_int.mult_big_int c sgn, s)::l'
      in
        $1::(push_sign (if $2 = "+" then Big_int.unit_big_int else (Big_int.minus_big_int Big_int.unit_big_int)) $3)
    }
;

mult_monomial:
| INT
    { (Big_int.big_int_of_string $1, [("$!@", 1)]) }
| INFIX INT
    { if $1 = "+" then
        (Big_int.big_int_of_string $2, [("$!@", 1)])
      else
        (Big_int.minus_big_int (Big_int.big_int_of_string $2), [("$!@", 1)]) }
| monomial
    { (Big_int.unit_big_int, $1) }
| INFIX monomial
    { if $1 = "+" then
        (Big_int.unit_big_int, $2)
      else
        (Big_int.minus_big_int Big_int.unit_big_int, $2) }
| INT TIMES monomial
    { (Big_int.big_int_of_string $1, $3) }
| INFIX INT TIMES monomial
    { if $1 = "+" then
        (Big_int.big_int_of_string $2, $4)
      else
        (Big_int.minus_big_int (Big_int.big_int_of_string $2), $4) }
;

monomial:
| IDENT
    { [($1, 1)] }
| IDENT TIMES monomial
    { ($1, 1)::$3 }
;

cond:
| poly EQU poly
    { Pc.Equ (Poly.construct_poly $1, Poly.construct_poly $3) }
| poly GEQ poly
    { Pc.Geq (Poly.construct_poly $1, Poly.construct_poly $3) }
| poly GTR poly
    { Pc.Gtr (Poly.construct_poly $1, Poly.construct_poly $3) }
| poly LEQ poly
    { Pc.Leq (Poly.construct_poly $1, Poly.construct_poly $3) }
| poly LSS poly
    { Pc.Lss (Poly.construct_poly $1, Poly.construct_poly $3) }
;
