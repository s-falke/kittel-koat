#!/bin/bash
set -e
export LD_LIBRARY_PATH=`pwd`/lib

TIMEOUT=$1
EXAMPLE_FILE=`pwd`/$2
TIME_FILE=`pwd`/$3

LOOPUS=`pwd`/provers/loopus
KOATCCONV=`pwd`/bin/koatCConv
CLANG=`pwd`/clang-2.9/bin/clang

STDOUT_FILE=$(echo "${TIME_FILE}" | sed -e 's/.time$/.stdout/')
STDERR_FILE=$(echo "${TIME_FILE}" | sed -e 's/.time$/.stderr/')

TEMPDIR=$(mktemp -d)
cd "${TEMPDIR}"
cp "${EXAMPLE_FILE}" main.koat
"${KOATCCONV}" main.koat > main.koat.Loopus.c 2>"${STDERR_FILE}"
"${CLANG}" -g -emit-llvm -c main.koat.Loopus.c -o main.koat.Loopus.o 2>"${STDERR_FILE}"
"${LOOPUS}" -zT "${TIMEOUT}" -zDisableFunctions -zExpressBoundsInFunctionParameters -zAssumeUpperBoundsOnNonDetValues -zPrintComplexity -zPrintFunctionBound main.koat.Loopus.o > "${STDOUT_FILE}" 2> "${STDERR_FILE}" || :
cd - >/dev/null
rm -rf "$TEMPDIR"
