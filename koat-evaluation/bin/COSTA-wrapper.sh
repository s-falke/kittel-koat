#!/bin/bash
set -e
PUBS=`pwd`/provers/pubs_static
CESTOCFG=`pwd`/bin/CEStoCFG.pl
CFGTOPUBS=`pwd`/provers/cfg2pubs_static

EXAMPLE_FILE=`pwd`/$1
TIME_FILE=`pwd`/$2

STDOUT_FILE=$(echo "${TIME_FILE}" | sed -e 's/.time$/.stdout.txt/')
STDERR_FILE=$(echo "${TIME_FILE}" | sed -e 's/.time$/.stderr.txt/')
INPUT_FILE=$(echo "${TIME_FILE}" | sed -e 's/.time$/.input.txt/')

TEMPDIR=$(mktemp -d)
cd "$TEMPDIR"
cp "$EXAMPLE_FILE" main.ces
(
if "$CESTOCFG" < main.ces > main.cfg
then
    "$CFGTOPUBS" main.cfg
else
    cp main.ces main.cfg.ces
fi
"$PUBS" -file main.cfg.ces
) > "${STDOUT_FILE}" 2> "${STDERR_FILE}" || :
cp main.cfg.ces "${INPUT_FILE}" || true
rm -rf "$TEMPDIR"
