#!/bin/bash -eu

DIR_1=${1}
DIR_2=${2}

DIR_NOT_FOUND=3
TWO_PARAM=4

if [[ $# -le 1 ]]; then 
    echo "Two parameteres requierd."
    exit "${TWO_PARAM}"
fi

if [[ ! -d ${DIR_1} || ! -d ${DIR_2} ]]; then
    exit "${DIR_NOT_FOUND}"
fi

LIST=$(ls ${DIR_1})
for FILE in ${LIST}; do
    if [[ -d ${DIR_1}/${FILE} ]]; then
        echo "${FILE} - directory"
    fi
    if [[ -L ${DIR_1}/${FILE} ]]; then
        echo "${FILE} - symbolic link"
    fi
    if [[ -f ${DIR_1}/${FILE} && ! -L ${DIR_1}/${FILE} ]]; then
        echo "${FILE} - regular file"
    fi
done

for FILE in ${LIST}; do
    if [[ (-f ${DIR_1}/${FILE} && ! -L ${DIR_1}/${FILE}) || -d ${DIR_1}/${FILE} ]]; then
        EXTENSION=".${FILE##*.}"
        SYMLINK_NAME="${FILE%.*}"
        if [[ ${EXTENSION} == ".${SYMLINK_NAME}" ]]; then
            EXTENSION=""
        fi
        SYMLINK_NAME=${SYMLINK_NAME^^}
        SYMLINK_NAME="${SYMLINK_NAME}_ln${EXTENSION}"
        if [[ "${DIR_1}" == /* ]]; then
            ln -s ${DIR_1}/${FILE} ${DIR_2}/${SYMLINK_NAME}
        else
            ln -s ../${DIR_1}/${FILE} ${DIR_2}/${SYMLINK_NAME}
        fi
    fi
done
