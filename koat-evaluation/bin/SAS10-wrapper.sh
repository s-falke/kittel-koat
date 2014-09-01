#!/bin/bash
set -e
export LD_LIBRARY_PATH=`pwd`/lib
ASPIC=`pwd`/provers/aspic64
RANK=`pwd`/provers/rank
FILE=`pwd`/$1
EXAMPLE_FILE=`pwd`/$1
TIME_FILE=`pwd`/$2

ASPIC_ERR_FILE=$(echo "${TIME_FILE}" | sed -e 's/.fst.SAS10.*/.fst.SAS10.aspic.stderr.txt/')
ASPIC_OUT_FILE=$(echo "${TIME_FILE}" | sed -e 's/.fst.SAS10.*/.fst.SAS10.aspic.stdout.txt/')
RANK_ERR_FILE=$(echo "${TIME_FILE}" | sed -e 's/.fst.SAS10.*/.fst.SAS10.rank.stderr.txt/')
RANK_OUT_FILE=$(echo "${TIME_FILE}" | sed -e 's/.fst.SAS10.*/.fst.SAS10.rank.stdout.txt/')
INPUT_FILE=$(echo "${TIME_FILE}" | sed -e 's/.time$/.input.txt/')

TEMPDIR=$(mktemp -d)
cd "$TEMPDIR"
cp "$EXAMPLE_FILE" main.fst
"$ASPIC" -ranking main.fst > "${ASPIC_OUT_FILE}" 2> "${ASPIC_ERR_FILE}" &&
  "$RANK" -wcet main.fstb > "${RANK_OUT_FILE}" 2> "${RANK_ERR_FILE}" ||:
cp main.fst "${INPUT_FILE}" || true
cd - >/dev/null
rm -rf "$TEMPDIR"

