/*
  Parser for TRSs

  @author Stephan Falke
  @license This file is distributed under the MIT License (MIT)
           See LICENSE for details
*/

%token <string> IDENT INFIX VAR INT
%token TO COMMA OPENPAR CLOSEPAR OPENSQ CLOSESQ EOL EQU EOF GEQ GTR LEQ LSS CONJ TIMES POWER

%left INFIX
%left TIMES
%left POWER
%nonassoc IDENT

%start trs_eol
%type <Trs.trs> trs_eol

%%

trs_eol :
| rules
    { $1 }
| eols rules
    { $2 }
;

rules :
| EOF
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
| term TO term
    { ($1, $3, Pc.create []) }
| term TO term OPENSQ cond_list CLOSESQ
    { ($1, $3, Pc.create $5) }
;

term :
| IDENT OPENPAR CLOSEPAR
    { Term.create $1 [] }
| IDENT OPENPAR poly_list CLOSEPAR
    { Term.create $1 $3 }
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
| cond
    { [ $1 ] }
| cond CONJ cond_list
    { $1 :: $3 }
;

cond:
| poly EQU poly
    { ("Equ", $1, $3) }
| poly GEQ poly
    { ("Geq", $1, $3) }
| poly GTR poly
    { ("Gtr", $1, $3) }
| poly LEQ poly
    { ("Leq", $1, $3) }
| poly LSS poly
    { ("Lss", $1, $3) }
;
