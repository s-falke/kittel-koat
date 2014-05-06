#!/bin/bash

OUTFILE=$1
GIT_SHA1=`git describe --always --dirty --abbrev=40 --match=NeVeRmAtCh`

cat > ${OUTFILE}.tmp << EOP
let git_sha1 = "${GIT_SHA1}"
EOP

if [ -e ${OUTFILE} ]
then
  diff ${OUTFILE} ${OUTFILE}.tmp --brief > /dev/null
  CHANGED=$?
  if [ ${CHANGED} -eq 0 ]
  then
    # unchanged
    rm -f ${OUTFILE}.tmp
    exit
  fi
fi

mv -f ${OUTFILE}.tmp ${OUTFILE}
rm -f ${OUTFILE}.tmp
