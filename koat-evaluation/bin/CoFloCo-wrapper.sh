#!/bin/bash
set -e
export LD_LIBRARY_PATH=`pwd`/lib

COFLOCO=`pwd`/provers/cofloco
EXAMPLE_FILE=`pwd`/$1
TIME_FILE=`pwd`/$2
STDOUT_FILE=$(echo "${TIME_FILE}" | sed -e 's/.time$/.stdout/')
STDERR_FILE=$(echo "${TIME_FILE}" | sed -e 's/.time$/.stderr/')

TEMPDIR=$(mktemp -d)
cd "$TEMPDIR"
cp "$EXAMPLE_FILE" main.cofloco
"$COFLOCO" -i main.cofloco > "${STDOUT_FILE}" 2> "${STDERR_FILE}" || :
cd - >/dev/null
rm -rf "$TEMPDIR"
