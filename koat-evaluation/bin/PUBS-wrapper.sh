#!/bin/bash
set -e
PUBS=`pwd`/provers/pubs_static
EXAMPLE_FILE=`pwd`/$1
TIME_FILE=`pwd`/$2

STDOUT_FILE=$(echo "${TIME_FILE}" | sed -e 's/.time$/.stdout.txt/')
STDERR_FILE=$(echo "${TIME_FILE}" | sed -e 's/.time$/.stderr.txt/')
INPUT_FILE=$(echo "${TIME_FILE}" | sed -e 's/.time$/.input.txt/')

TEMPDIR=$(mktemp -d)
cd "$TEMPDIR"
cp "$EXAMPLE_FILE" main.ces
"$PUBS" -file main.ces > "${STDOUT_FILE}" 2> "${STDERR_FILE}" || :
cp main.ces "${INPUT_FILE}" || true
cd - >/dev/null
rm -rf "$TEMPDIR"
