#!/bin/bash

#Array of names
filename=("ieep2" "jeep2" "keep2" "leep2")
foldername=("exemplar/9" "exemplar/10" "exemplar/11" "exemplar/12")
classname=("IX" "X" "XI" "XII")
len=${#filename[@]}

#Download the pdf
for (( i = 0; i < $len; i++ )); do
    fold=${foldername[i]}
    class=${classname[i]}
    if [[ -d $fold ]]; then
        rm -rf $fold
    fi
    mkdir -p $fold
    echo "Downloading files to $fold"
    #Download the pdfs
    for j in $(seq -f "%02g" 1 99); do
        file="${filename[i]}$j.pdf"
        wget https://ncert.nic.in/pdf/publication/exemplarproblem/class${class}/mathematics/${file} -O "${fold}/${file}"
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
