#!/bin/bash
set -e
PUBS=`pwd`/provers/pubs_static
CESTOCFG=`pwd`/bin/CEStoCFG.pl
CFGTOPUBS=`pwd`/provers/cfg2pubs_static
EXAMPLE_FILE=`pwd`/$1
TIME_FILE=`pwd`/$2
STDOUT_FILE=$(echo "${TIME_FILE}" | sed -e 's/.time$/.stdout/')
STDERR_FILE=$(echo "${TIME_FILE}" | sed -e 's/.time$/.stderr/')
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
rm -rf "$TEMPDIR"
