#!/bin/bash

clear

echo "=========================================="
echo "         FILE ORGANIZER v1.0"
echo "=========================================="
echo

read -p "Enter folder path: " folder

if [ ! -d "$folder" ]; then
    echo
    echo "Folder does not exist!"
    exit
fi

mkdir -p "$folder/Images"
mkdir -p "$folder/Documents"
mkdir -p "$folder/Videos"
mkdir -p "$folder/Music"
mkdir -p "$folder/Others"

for file in "$folder"/*

do

    [ -f "$file" ] || continue

    case "${file##*.}" in

        jpg|jpeg|png|gif)
            mv "$file" "$folder/Images/"
            ;;

        pdf|doc|docx|txt)
            mv "$file" "$folder/Documents/"
            ;;

        mp4|mkv|mov)
            mv "$file" "$folder/Videos/"
            ;;

        mp3|wav)
            mv "$file" "$folder/Music/"
            ;;

        *)
            mv "$file" "$folder/Others/"
            ;;

    esac

done

echo
echo "===================================="
echo "Files Organized Successfully!"
echo "===================================="
