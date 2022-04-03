#!/usr/bin/env bash

#1
SOURCE_DIR=${1:-lab_uno}
RM_LIST=${2:-2remove}
TARGET_DIR=${3:-bakap}

#2
[[ ! -d ${TARGET_DIR} ]] && mkdir ${TARGET_DIR}

# we have to iterate over files first, because otherwise
# files that haven't been moved or deleted would be
# checked multiple times

for FILENAME in ${SOURCE_DIR}/*; do
    #3
    while read LINE; do
        if [[ "${SOURCE_DIR}/${LINE}" == "${FILENAME}" ]]; then
            rm -rf ${FILENAME}
            echo "Removed ${FILENAME}"
        fi
    done < $RM_LIST;
    #4
    if [[ -f ${FILENAME} ]]; then
        mv ${FILENAME} ${TARGET_DIR}
        echo "Moved ${FILENAME}"
    #5
    elif [[ -d ${FILENAME} ]]; then
        cp -a ${FILENAME} ${TARGET_DIR}
        echo "Copied ${FILENAME} with content"
    fi
done

#7
zip -r "bakap_$(date +'%F')" ${TARGET_DIR}