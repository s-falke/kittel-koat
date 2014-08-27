#!/bin/bash
set -e
PUBS=`pwd`/provers/pubs_static
EXAMPLE_FILE=`pwd`/$1
TIME_FILE=`pwd`/$2
STDOUT_FILE=$(echo "${TIME_FILE}" | sed -e 's/.time$/.stdout/')
STDERR_FILE=$(echo "${TIME_FILE}" | sed -e 's/.time$/.stderr/')

TEMPDIR=$(mktemp -d)
cd "$TEMPDIR"
cp "$EXAMPLE_FILE" main.ces
"$PUBS" -file main.ces > "${STDOUT_FILE}" 2> "${STDERR_FILE}" || :
cd - >/dev/null
rm -rf "$TEMPDIR"
