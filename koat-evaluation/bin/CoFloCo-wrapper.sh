#!/bin/bash
set -e
export LD_LIBRARY_PATH=`pwd`/lib

COFLOCO=`pwd`/provers/cofloco
EXAMPLE_FILE=`pwd`/$1
TIME_FILE=`pwd`/$2
STDOUT_FILE=$(echo "${TIME_FILE}" | sed -e 's/.time$/.stdout.txt/')
STDERR_FILE=$(echo "${TIME_FILE}" | sed -e 's/.time$/.stderr.txt/')
INPUT_FILE=$(echo "${TIME_FILE}" | sed -e 's/.time$/.input.txt/')

TEMPDIR=$(mktemp -d)
cd "$TEMPDIR"
cp "$EXAMPLE_FILE" main.cofloco
"$COFLOCO" -v 2 -stats  -n_rankings 2 -assume_sequential -maximize_fast 9 -i main.cofloco > "${STDOUT_FILE}" 2> "${STDERR_FILE}" || :
cp main.cofloco "${INPUT_FILE}" || true
cd - >/dev/null
rm -rf "$TEMPDIR"
