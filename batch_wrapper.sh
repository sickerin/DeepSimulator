#!/bin/bash

# processing the input parameter
while [[ -n $1 ]]; do
        # echo "\$1=$1"
        case $1 in
                -f | --foldername )       shift
                                                FOLDER=$1
                                                ;;                      
        esac
        shift
done

FOLDER_N=$(basename "$FOLDER")

for %f in FOLDER_N do ./single_batch.sh -f %f

