/*
  Parser for complexity bounds

  @author Marc Brockschmidt
  @license This file is distributed under the MIT License (MIT)
           See LICENSE for details
*/

%token EOL EOF
%token PLUS MINUS TIMES DIV POWER 
%token LOG POW MAX NAT
%token COMMA LPAREN RPAREN LBRACK RBRACK

%token <Big_int.big_int> INT
%token <string> IDENT

%left PLUS MINUS
%left TIMES DIV
%left UMINUS
%left POWER
%nonassoc IDENT

%start bound_expr
%type <Bound.bound> bound_expr

%%

bound_expr:
| INT                                             { Bound.Num $1 }
| IDENT                                           { Bound.Var $1 }

| MINUS bound_expr %prec UMINUS                   { Bound.Sub (Bound.Num Big_int.zero_big_int, $2) }
| bound_expr PLUS bound_expr                      { Bound.Add ($1, $3) }
| bound_expr MINUS bound_expr                     { Bound.Sub ($1, $3) }
| bound_expr TIMES bound_expr                     { Bound.Mul ($1, $3) }
| bound_expr DIV bound_expr                       { Bound.Div ($1, $3) }
| bound_expr POWER bound_expr                     { Bound.Pow ($1, $3) }

| LOG LPAREN bound_expr COMMA bound_expr RPAREN   { Bound.Log ($3, $5) }
| POW LPAREN bound_expr COMMA bound_expr RPAREN   { Bound.Pow ($3, $5) }
| MAX LPAREN bound_expr_list RPAREN               { Bound.Max $3 }
| MAX LBRACK bound_expr_list RBRACK               { Bound.Max $3 }
| MAX LPAREN LBRACK bound_expr_list RBRACK RPAREN { Bound.Max $4 }
| NAT LPAREN bound_expr RPAREN                    { Bound.Max [ Bound.Num Big_int.zero_big_int ; $3 ] }

| LPAREN bound_expr RPAREN                        { $2 }
;

bound_expr_list:
| bound_expr COMMA bound_expr_list { $1::$3 }
| bound_expr                       { [$1] }
;
