#!/bin/bash
cd img

mogrify -format jpg *.png
for file in *.jpg; do
    if [[ $file != optimized* ]];
    then
        echo "Making optimized-$file"
        convert $file -strip -interlace Plane -gaussian-blur 0.03 -quality 80 -resize 1140 optimized-$file
    fi
done
