/*
  Parser for CINTs

  @author Stephan Falke
  @license This file is distributed under the MIT License (MIT)
           See LICENSE for details
*/

%token <string> IDENT INFIX VAR INT
%token TO COMMA OPENPAR CLOSEPAR OPENSQ CLOSESQ CONSTRAINTSEP EOL EQU NEQ EOF GEQ GTR LEQ LSS CONJ TIMES POWER GOAL COMPLEXITY STARTTERM FUNCTIONSYMBOLS VART RULES COM TRUE

%left INFIX
%left TIMES
%left POWER
%nonassoc IDENT

%start cint_eol
%type <string * Cint.cint> cint_eol

%%

cint_eol :
| header OPENPAR RULES eols rules
    { ($1, $5) }
| eols header OPENPAR RULES eols rules
    { ($2, $6) }
;

header :
| OPENPAR GOAL COMPLEXITY CLOSEPAR eols OPENPAR STARTTERM OPENPAR FUNCTIONSYMBOLS IDENT CLOSEPAR CLOSEPAR eols OPENPAR VART varlist CLOSEPAR eols
    { $10 }
| OPENPAR GOAL COMPLEXITY CLOSEPAR eols OPENPAR STARTTERM OPENPAR FUNCTIONSYMBOLS IDENT CLOSEPAR CLOSEPAR eols OPENPAR VART CLOSEPAR eols
    { $10 }
;

rules :
| CLOSEPAR eols EOF
    { [] }
| rule eols rules
    { ($1::$3) }
;

eols:
| EOL
    { }
| EOL eols
    { }
;

rule :
| term TO COM OPENPAR term_list CLOSEPAR
    { ($1, $5, Pc.create []) }
| term TO term
    { ($1, [$3], Pc.create []) }
| term TO COM OPENPAR term_list CLOSEPAR CONSTRAINTSEP cond_list
    { ($1, $5, Pc.create $8) }
| term TO term CONSTRAINTSEP cond_list
    { ($1, [$3], Pc.create $5) }
| term TO COM OPENPAR term_list CLOSEPAR OPENSQ cond_list CLOSESQ
    { ($1, $5, Pc.create $8) }
| term TO term OPENSQ cond_list CLOSESQ
    { ($1, [$3], Pc.create $5) }
;

term :
| IDENT OPENPAR CLOSEPAR
    { Term.create $1 [] }
| IDENT OPENPAR poly_list CLOSEPAR
    { Term.create $1 $3 }
;

term_list :
| term
    { [ $1 ] }
| term COMMA term_list
    { $1 :: $3 }
;

poly_list :
| poly
    { [ $1 ] }
| poly COMMA poly_list
    { $1 :: $3 }
;

poly:
| mult_monomial
    { [ $1 ] }
| mult_monomial INFIX poly
    { let push_sign sgn l =
        match l with
          | [] -> []
          | (c, s)::l' -> (Big_int.mult_big_int c sgn, s)::l'
      in
        $1 :: (push_sign (if $2 = "+" then Big_int.unit_big_int else (Big_int.minus_big_int Big_int.unit_big_int)) $3)
    }
| mult_monomial INFIX OPENPAR poly CLOSEPAR
    { let rec push_sign_all sgn l =
        match l with
          | [] -> []
          | (c, s)::l' -> (Big_int.mult_big_int c sgn, s)::(push_sign_all sgn l')
      in
        $1 :: (push_sign_all (if $2 = "+" then Big_int.unit_big_int else (Big_int.minus_big_int Big_int.unit_big_int)) $4)
    }
| mult_monomial INFIX OPENPAR poly CLOSEPAR INFIX poly
    { let rec push_sign sgn l =
        match l with
          | [] -> []
          | (c, s)::l' -> (Big_int.mult_big_int c sgn, s)::l'
      and push_sign_all sgn l =
        match l with
          | [] -> []
          | (c, s)::l' -> (Big_int.mult_big_int c sgn, s)::(push_sign sgn l')
      in
        [$1] @ (push_sign_all (if $2 = "+" then Big_int.unit_big_int else (Big_int.minus_big_int Big_int.unit_big_int)) $4) @ (push_sign (if $6 = "+" then Big_int.unit_big_int else (Big_int.minus_big_int Big_int.unit_big_int)) $7)
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
| INFIX OPENPAR INT CLOSEPAR
    { if $1 = "+" then
        (Big_int.big_int_of_string $3, [("$!@", 1)])
      else
        (Big_int.minus_big_int (Big_int.big_int_of_string $3), [("$!@", 1)]) }
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
| INFIX OPENPAR INT CLOSEPAR TIMES monomial
    { if $1 = "+" then
        (Big_int.big_int_of_string $3, $6)
      else
        (Big_int.minus_big_int (Big_int.big_int_of_string $3), $6) }
;

monomial:
| var_power
    { [ $1 ] }
| var_power TIMES monomial
    { $1 :: $3 }
;

var_power:
| IDENT
    { ($1, 1) }
| IDENT POWER INT
    { ($1, int_of_string $3) }
;

cond_list:
| TRUE
    { [] }
| cond
    { [ $1 ] }
| cond CONJ cond_list
    { $1 :: $3 }
;

cond:
| poly EQU poly
    { ("Equ", $1, $3) }
| poly NEQ poly
    { ("Neq", $1, $3) }
| poly GEQ poly
    { ("Geq", $1, $3) }
| poly GTR poly
    { ("Gtr", $1, $3) }
| poly LEQ poly
    { ("Leq", $1, $3) }
| poly LSS poly
    { ("Lss", $1, $3) }
;

varlist:
| IDENT
    { }
| IDENT varlist
    { }
;
