#!/bin/bash
set -e
source bin/output_funs.sh

RUN_NAME=$1

echo "results['${RUN_NAME}'] = {"
for TIME_FILE in `find runs/${RUN_NAME}/ -name \*.time`; do
    STDOUT_FILE=$(echo "${TIME_FILE}" | sed -e 's/.time$/.stdout.txt/')
    STDERR_FILE=$(echo "${TIME_FILE}" | sed -e 's/.time$/.stderr.txt/')
    EXAMPLE=$(echo "${TIME_FILE}" | cut -d "/" -f 3- | sed -e 's/.\(koat.KoAT\|ces.PUBS\|ces.COSTA\|fst.SAS10\|cofloco.ces.CoFloCo\|koat.Loopus.c\).*//')

    echo -n " '$EXAMPLE': { "

    if grep -q '^KoAT' <<<"${RUN_NAME}"; then
        test -f "${STDERR_FILE}" && test $(stat -c%s "${STDERR_FILE}") -gt 0 && echo -n '"errors": true, '
        test -f "${STDOUT_FILE}" && test $(stat -c%s "${STDOUT_FILE}") -gt 0 && echo -n '"stdout": true, '
        koatresult "${STDOUT_FILE}"
        echo -n $(reporttime "${TIME_FILE}")
    fi

    if [ $RUN_NAME = "PUBS" ]; then
        test -f "${STDERR_FILE}" && test $(stat -c%s "${STDERR_FILE}") -gt 0 && echo -n '"errors": true, '
        test -f "${STDOUT_FILE}" && test $(stat -c%s "${STDOUT_FILE}") -gt 0 && echo -n '"stdout": true, '
        pubsresult "${STDOUT_FILE}"
        echo -n $(reporttime "${TIME_FILE}")
    fi

    if [ $RUN_NAME = "COSTA" ]; then
        test -f "${STDERR_FILE}" && test $(stat -c%s "${STDERR_FILE}") -gt 0 && echo -n '"errors": true, '
        test -f "${STDOUT_FILE}" && test $(stat -c%s "${STDOUT_FILE}") -gt 0 && echo -n '"stdout": true, '
        pubsresult "${STDOUT_FILE}"
        echo -n $(reporttime "${TIME_FILE}")
    fi

    if [ $RUN_NAME = "CoFloCo" ]; then
        test -f "${STDERR_FILE}" && test $(stat -c%s "${STDERR_FILE}") -gt 0 && echo -n '"errors": true, '
        test -f "${STDOUT_FILE}" && test $(stat -c%s "${STDOUT_FILE}") -gt 0 && echo -n '"stdout": true, '
        coflocoresult "${STDOUT_FILE}"
        echo -n $(reporttime "${TIME_FILE}")
    fi

    if [ $RUN_NAME = "Loopus" ]; then
        test -f "${STDERR_FILE}" && test $(stat -c%s "${STDERR_FILE}") -gt 0 && echo -n '"errors": true, '
        test -f "${STDOUT_FILE}" && test $(stat -c%s "${STDOUT_FILE}") -gt 0 && echo -n '"stdout": true, '
        loopusresult "${STDOUT_FILE}"
        echo -n $(reporttime "${TIME_FILE}")
    fi

    if [ $RUN_NAME = "SAS10" ]; then
        ASPIC_ERR_FILE=$(echo "${TIME_FILE}" | sed -e 's/.fst.SAS10.*/.fst.SAS10.aspic.stderr.txt/')
        ASPIC_OUT_FILE=$(echo "${TIME_FILE}" | sed -e 's/.fst.SAS10.*/.fst.SAS10.aspic.stdout.txt/')
        RANK_ERR_FILE=$(echo "${TIME_FILE}" | sed -e 's/.fst.SAS10.*/.fst.SAS10.rank.stderr.txt/')
        RANK_OUT_FILE=$(echo "${TIME_FILE}" | sed -e 's/.fst.SAS10.*/.fst.SAS10.rank.stdout.txt/')
        test -f "${ASPIC_ERR_FILE}" && test $(stat -c%s "${ASPIC_ERR_FILE}") -gt 0 && echo -n '"aspic_stderr": true, '
        test -f "${ASPIC_OUT_FILE}" && test $(stat -c%s "${ASPIC_OUT_FILE}") -gt 0 && echo -n '"aspic_stdout": true, '
        test -f "${RANK_ERR_FILE}" && test $(stat -c%s "${RANK_ERR_FILE}") -gt 0 && echo -n '"errors": true, '
        test -f "${RANK_OUT_FILE}" && test $(stat -c%s "${RANK_OUT_FILE}") -gt 0 && echo -n '"stdout": true, '
        sas10result "${RANK_OUT_FILE}"
        echo -n $(reporttime "${TIME_FILE}")
    fi

    echo ' },'

done
echo "}"
