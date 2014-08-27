#!/bin/bash

function reporttime
{
    S=''
    [ -f "$1" ] && S=$(cat "$1")
    if grep -q 'Timeout' <<< "$S"
    then
        echo '' # missing means timeout
    else
        T=$(grep '^real' <<<"$S" | sed 's/^real\t\([0-9]\)m\([0-9]*\)\.\([0-9]\{3\}\).*$/\1 * 60000 + \2 * 1000 + (1\3 - 1000)/')
        echo "'time': " $(( $T ))
    fi
}


function koatresult
{
    if [ -f $1 ]
    then
        ORIGINAL_BOUND="$( grep '^Complexity upper bound' "$1" | sed 's/^Complexity upper bound //g' | tr '[a-z]' '[A-Z]' )"
        echo -n "'originalBound': \"${ORIGINAL_BOUND}\", "
        echo "${ORIGINAL_BOUND}" | bin/parsebound
	echo -n ", "
    fi
}

function pubsresult
{
    if [ -f $1 ]
    then
        ORIGINAL_BOUND="$( grep -A2 'pubs_aux_entry.*THE MAIN ENTRY' "$1" | grep 'Non Asymptotic Upper Bound' | sed 's/.*Non Asymptotic Upper Bound: \(.*\)$/\1/' )"
        echo -n "'originalBound': \"${ORIGINAL_BOUND}\", "
        echo "${ORIGINAL_BOUND}" | bin/parsebound
	echo -n ", "
    fi
}

function sas10result
{
    if [ -f $1 ]
    then
        ORIGINAL_BOUND="$( grep -A10000 'Worst Case Execution Time' "$1" | grep . | grep -v '^[+|\\/]' | tr '\n' ',' | sed 's/^\(.*\),$/max([\1])/' )"
        echo -n "'originalBound': \"${ORIGINAL_BOUND}\", "
        echo "${ORIGINAL_BOUND}" | bin/parsebound
	echo -n ", "
    fi
}
