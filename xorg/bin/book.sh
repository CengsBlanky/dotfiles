#!/bin/bash

book_path="$HOME/Documents/ebook/"
declare -A book_loc_map

count=1
while IFS= read -r book; do
    base_bookname=$(basename "$book")
    # Map base name to full path
    choose_names="$count: $base_bookname"
    book_loc_map["$choose_names"]="$book"
    count=$(($count+1))
done < <(fd . "$book_path" -t file -c never)

selected_choice=$(printf "%s\n" "${!book_loc_map[@]}" | sort -gu | dmenu)

if [ -n "$selected_choice" ]; then
    bookname=${book_loc_map["$selected_choice"]}
    open "$bookname"
fi
