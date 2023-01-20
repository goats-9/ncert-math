#!/bin/bash

#Array of names
zipname=("iemh1dd" "jemh1dd" "kemh1dd" "lemh1dd" "lemh2dd")
classname=("9" "10" "11" "12-1" "12-2")
len=${#zipname[@]}

#Download, unzip and create the folder
for (( i = 0; i < $len; i++ )); do
    z="${zipname[i]}.zip"
    f=${classname[i]}
    if [[ -e $z ]]; then
        rm $z
    fi
    if [[ -d $f ]]; then
        rm -rf $f
    fi
    echo "Downloading files for class $f"
    wget https://ncert.nic.in/textbook/pdf/$z
    mkdir $f
    echo "Unzipping files"
    unzip -q $z -d $f
    rm $z
    echo "OK"
    echo ""
    echo "-----------------------------"
    echo ""
done
echo "DONE"
