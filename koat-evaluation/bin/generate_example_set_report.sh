#!/bin/bash
set -e

echo 'var files = ['
for PROPERTY_FILE in `find examples/ -name \*.properties`; do
    EXAMPLE_FILE=$(echo "${PROPERTY_FILE}" | cut -d "/" -f 2- | sed -e 's/.properties$//')
    echo " { 'filename': '${EXAMPLE_FILE}', " $(cat ${PROPERTY_FILE}) "},"
done
echo ']'
