#!/bin/bash -eu

DIR=${1}
FILE_TO_WRITE=${2}

DIR_NOT_FOUND=3
TWO_PARAM=4

if [[ $# -le 1 ]]; then 
    echo "Two parameteres requierd."
    exit "${TWO_PARAM}"
fi

if [[ ! -d ${DIR} ]]; then
    exit "${DIR_NOT_FOUND}"
fi

DATE=$(date --iso-8601)

LIST=$(ls ${DIR})
for FILE in ${LIST}; do
    if [[ -L ${DIR}/${FILE} && ! -e ${DIR}/${FILE} ]]; then
        echo "${FILE} - ${DATE}" >> ${FILE_TO_WRITE}
        rm ${DIR}/${FILE}
    fi
done
