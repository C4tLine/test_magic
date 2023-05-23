#!/bin/bash

if [[ ! -n $1 ]]; then 
    echo "Wrong argument!"
    echo "Use: $0 folder_1"
    exit 1
fi

count=0
echo "1. png > jpg"
echo "2. jpg > png"
read -p "Choose number to convert: " format

if [[ $format -lt 1 ]] || [[ $format -gt 2 ]]; then
    echo "Wrong number!"
    exit 0
fi

if [[ $format == 2 ]]; then
    form="jpg"
    morf="png"
else
    form="png"
    morf="jpg"
fi
for file in $(ls $1)
do 
    image="$1/$file"
    if [[ $image == *.$form ]]; then
        echo "Convert $image"
        convert "$image" "${image%.$form}.$morf"
        count=$(($count+1))
    else
        echo "File $image is not $form, skip"
    fi
done

echo "All $count images have been converted!"