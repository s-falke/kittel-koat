#!/bin/bash
set -e

TIMEOUT=$1
KOAT_VERSION=$2
EXAMPLE_FILE=`pwd`/$3
TIME_FILE=`pwd`/$4

KOAT=`pwd`/provers/${KOAT_VERSION}
STDOUT_FILE=$(echo "${TIME_FILE}" | sed -e 's/.time$/.stdout.txt/')
STDERR_FILE=$(echo "${TIME_FILE}" | sed -e 's/.time$/.stderr.txt/')
INPUT_FILE=$(echo "${TIME_FILE}" | sed -e 's/.time$/.input.txt/')

TEMPDIR=$(mktemp -d)
cd "${TEMPDIR}"
cp "${EXAMPLE_FILE}" main.koat
timeout ${TIMEOUT} "$KOAT" main.koat > "${STDOUT_FILE}" 2> "${STDERR_FILE}" || :
cp main.koat "${INPUT_FILE}" || true
cd - >/dev/null
rm -rf "${TEMPDIR}"
