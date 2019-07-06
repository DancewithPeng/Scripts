#!/bin/sh

file="${1}"

if [ ! -n "$file" ]
then
    echo "请指定文件或目录"
    exit 0
fi

cover_to_jpeg() {

    f=${1}

    if [ ! ${f##*.} = png ]
    then 
        echo "不是PNG文件 -> ${f}"
        return 0
    fi
      
    f_name="${f%.*}"
    ffmpeg -i "${f}" "${f_name}.jpeg"
}

if [ -d "${file}" ]
then
    for item in "${file}"*
    do 
        cover_to_jpeg "${item}"
    done
elif [ -f "${file}" ]
then    
    cover_to_jpeg "${file}"
else 
    echo "不是目录，也不是文件"
fi