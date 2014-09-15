#!/usr/bin/perl
use strict;
use warnings;

my @vars = ();
my @rules = (); #format


(GOAL COMPLEXITY)
(STARTTERM (FUNCTIONSYMBOLS l0))
(VAR A B)
(RULES
  l0(A,B) -> Com_1(l1(A,B))
  l1(A,B) -> Com_1(l1(A - 1,B + 1)) :|: A >= 1
  l1(A,B) -> Com_1(l2(A,B)) :|: 0 >= A
  l2(A,B) -> Com_1(l2(A,B - 1)) :|: B >= 1
)
 perl -pe 's!^  !eq(!;s! -> Com_\d!,1,[!; s!\)\)!)],[!; s! :\|: !!; s!\&\&!,!g; s!/\\!,!g; s!$!]).!'
