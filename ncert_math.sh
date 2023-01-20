#!/bin/bash

#Array of names
filename=("iemh1" "jemh1" "kemh1" "lemh1" "lemh2")
foldername=("math/9" "math/10" "math/11" "math/12-1" "math/12-2")
len=${#filename[@]}

#Download the pdf
for (( i = 0; i < $len; i++ )); do
    fold=${foldername[i]}
    if [[ -d $fold ]]; then
        rm -rf $fold
    fi
    mkdir -p $fold
    echo "Downloading files to $fold"
    #Download the pdfs
    for j in $(seq -f "%02g" 1 99); do
        file="${filename[i]}$j.pdf"
        wget https://ncert.nic.in/textbook/pdf/${file} -O "${fold}/${file}"
        #Break at Error
        if [[ $? -ne 0 ]]; then
            break
        fi
    done
    echo "OK"
    echo ""
    echo "-----------------------------"
    echo ""
done
echo "DONE"
