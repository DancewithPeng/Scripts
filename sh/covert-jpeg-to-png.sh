#!/bin/sh

file="${1}"

if [ ! -n "$file" ]
then
    echo "请指定文件或目录"
    exit 0
fi

cover_to_png() {

    f=${1}

    if [ ! ${f##*.} = jpeg -a ! ${f##*.} = jpg ]
    then 
        echo "不是JPEG文件 -> ${f}"
        return 0
    fi
      
    f_name="${f%.*}"
    ffmpeg -i "${f}" "${f_name}.png"
}

if [ -d "${file}" ]
then
    for item in "${file}"*
    do 
        cover_to_png "${item}"
    done
elif [ -f "${file}" ]
then    
    cover_to_png "${file}"
else 
    echo "不是目录，也不是文件"
fi