#!/bin/bash
set -e

TIMEOUT=$1
KOAT_VERSION=$2
EXAMPLE_FILE=`pwd`/$3
TIME_FILE=`pwd`/$4

KOAT=`pwd`/provers/${KOAT_VERSION}
STDOUT_FILE=$(echo "${TIME_FILE}" | sed -e 's/.time$/.stdout/')
STDERR_FILE=$(echo "${TIME_FILE}" | sed -e 's/.time$/.stderr/')
TEMPDIR=$(mktemp -d)

cd "${TEMPDIR}"
cp "${EXAMPLE_FILE}" main.koat
timeout ${TIMEOUT} "$KOAT" main.koat > "${STDOUT_FILE}" 2> "${STDERR_FILE}" || :
cd - >/dev/null
rm -rf "${TEMPDIR}"
