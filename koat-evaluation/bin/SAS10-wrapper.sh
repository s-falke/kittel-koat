#!/bin/bash
set -e
export LD_LIBRARY_PATH=`pwd`/lib
ASPIC=`pwd`/provers/aspic64
RANK=`pwd`/provers/rank
FILE=`pwd`/$1
EXAMPLE_FILE=`pwd`/$1
TIME_FILE=`pwd`/$2
ASPIC_ERR_FILE=$(echo "${TIME_FILE}" | sed -e 's/.fst.SAS10.*/.fst.SAS10.aspic.stderr/')
ASPIC_OUT_FILE=$(echo "${TIME_FILE}" | sed -e 's/.fst.SAS10.*/.fst.SAS10.aspic.stdout/')
RANK_ERR_FILE=$(echo "${TIME_FILE}" | sed -e 's/.fst.SAS10.*/.fst.SAS10.rank.stderr/')
RANK_OUT_FILE=$(echo "${TIME_FILE}" | sed -e 's/.fst.SAS10.*/.fst.SAS10.rank.stdout/')
TEMPDIR=$(mktemp -d)
cd "$TEMPDIR"
cp "$EXAMPLE_FILE" main.fst
"$ASPIC" -ranking main.fst > "${ASPIC_OUT_FILE}" 2> "${ASPIC_ERR_FILE}" &&
"$RANK" -wcet main.fstb > "${RANK_OUT_FILE}" 2> "${RANK_ERR_FILE}" ||:
cd - >/dev/null
rm -rf "$TEMPDIR"

