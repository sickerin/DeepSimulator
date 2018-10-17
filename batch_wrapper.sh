#!/bin/bash

# processing the input parameter
while [[ -n $1 ]]; do
        # echo "\$1=$1"
        case $1 in
                -f | --foldername )       shift
                                                FOLDER=$1
                                                ;;               
                -r | --runumber )         shift
                                                RUN=$1
                                                ;;
        esac
        shift
done

FOLDER_N=$(basename "$FOLDER")
RUN_N=$(basename "$RUN")

mkdir -p $RUN_N

# run single sh, then move them into the run folder
for f in ${FOLDER_N}/*.fasta
 do echo "here"
 y=${f%.fasta}
 echo "${y##*/}"
#  echo "after"
#  echo "${f}"
 ./single_batch.sh -f "$f"
 echo "${RUN_N}"
#  echo "here"
#  echo "${f%%.fasta}"
#  echo "after"
 mv ${y##*/} ${RUN_N} -f
done

