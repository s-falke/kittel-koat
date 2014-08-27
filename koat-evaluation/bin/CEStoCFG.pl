#!/usr/bin/perl
use strict;
use warnings;

###############################################################################
# Usage: perl CEStoCFG.pl < something.ces > something.cfg
###############################################################################

sub splitFunApp($);
sub normalize_name($);
sub sprintFunApp($);
sub sprintRhsList($);
sub sprintCondList($);
sub toRuleRepr($$$$);

################# Parse example:
my @rules;
while (my $line = <>) {
	if ($line =~ m{^eq\(
	                     (             #lhs
	                      [^(]+         #name of symbol
	                      (?:
	                       \([^)]+\)    # "(" arguments as string")"
	                      )?            #... and those are optional.
	                     ),
	                     (\d+),        #cost
	                     \[([^\]]*)\], #list of rhs entries
	                     \[(.*)\]      #list of conditions
	                  \)\.$ 
	               }x) {
		my $lhsString = $1;
		my $cost = $2;
		my $rhsListString = $3;
		my $condString = $4;

		my $lhs = splitFunApp($lhsString);

		my @rhsList = ();
		while ($rhsListString =~ /([^()]+?(?:\([^()]+\))?)(,|$)/g) {
			my $rhsString = $1;
			push @rhsList, splitFunApp($rhsString);
		}

		my @condList = split /\s*,\s*/, $condString;

		push @rules, toRuleRepr($lhs, $cost, \@rhsList, \@condList);
	} else {
		print STDERR "Can't parse line '$line'! Aborting.\n";
		exit 1;
	}
}

################# Get start symbol, normalize RHS:

my $startSymbol = $rules[0]->{lhs}->[0]; #first rule, lhs, symbol of funApp there
my @normalizedRules = ();
for my $rule (@rules) {
	my $rhsListRef = $rule->{rhsList};
	if (scalar @$rhsListRef > 1) {
		print STDERR "Can't handle transition with more than one rhs! Aborting.\n";
		exit 1;
	}
	if (scalar @$rhsListRef > 0) { #ignore transitions without endpoint. whatever those are
		my $rhs = $rhsListRef->[0];
		my $rhsArgsRef = $rhs->[1];
		my @newCondList = @{$rule->{condList}}; #clone, to avoid changing original
		my @newRhsArgs = ();
		my $idx = 1;
		for my $arg (@$rhsArgsRef) {
			if ($arg !~ /^[0-9A-Za-z]+$/) {
				my $newVar = 'ConvertVar' . $idx;
				push @newRhsArgs, $newVar;
				push @newCondList, sprintf('%s = %s', $newVar, $arg);
			} else {
				push @newRhsArgs, $arg;
			}
			++$idx;
		}
		my $newRhs = [$rhs->[0], \@newRhsArgs];
		push @normalizedRules, toRuleRepr($rule->{lhs}, $rule->{cost}, [$newRhs], \@newCondList);
	}
}

################# Output:
print <<EOS;
cfg(
    $startSymbol, % the entry node
    [
        % edges
        %
        % source	 target        cost   transition
EOS
my @resRules = ();
for my $rule (@normalizedRules) {
	my $lhs = $rule->{lhs};
	my $cost = $rule->{cost};
	my $rhsList = $rule->{rhsList};
	my $condList = $rule->{condList};
	if (scalar @$rhsList > 0) {
		push @resRules, sprintf('e(%s, %s, %i, %s)', sprintFunApp($lhs), sprintFunApp($rhsList->[0]), $cost, sprintCondList($condList));
	}
}
print '        ', join(",\n        ", @resRules);
print "\n    ]).\n";

exit;

#################

#Takes a string "f(A,B,C)" and returns a ref to a two-element list [f, ["A", "B", "C"]] 
sub splitFunApp($) {
	my $funAppString = shift;
	if ($funAppString !~ /\)$/) {
		return [normalizeName($funAppString), []]
	}
	$funAppString =~ /^(.+)\(([^)]+)\)$/;
	my $funName = $1;
	my $argList = $2;
	return [normalizeName($funName), [split(/\s*,\s*/, $argList)]]
}

sub toRuleRepr($$$$) {
  return { lhs => shift, cost => shift, rhsList => shift, condList => shift };
}

#Remove weird characters from names
sub normalizeName($) {
	my $name = shift;
	$name =~ s!_!__!g;
	$name =~ s!'!_P!g;
	$name =~ s!\(!_LB!g;
	$name =~ s!\)!_RB!g;
	$name =~ s!/!_S!g;
	if ($name !~ /^[a-zA-Z0-9_-]+$/) {
		print STDERR "Name '$name' contains weird characters! Aborting.\n";
		exit 1;
	}
	return $name;
}

sub sprintFunApp($) {
	my $funApp = shift;
	my $name = $funApp->[0];
	my $args = $funApp->[1];
	return $name . "(" . (join ", ", @$args) . ")";
}

sub sprintCondList($) {
	my $condListRef = shift;
	return "[" . (join ", ", @$condListRef) . "]";
}
