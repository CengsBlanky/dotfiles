#!/bin/bash

books=$(fd . ~/Documents/ebook/ -t file -c never)
declare -A book_loc_map

for book in $books; do
    base_bookname=$(basename $book)
    printf "%s: %s" $base_bookname $book
    book_loc_map["$base_bookname"]=$book
done

selected_choice=$(printf "%s\n" "${!book_loc_map[@]}" | sort -u | dmenu)

if [ -n "$selected_choice" ]; then
    bookname=${book_loc_map["$selected_choice"]}
    open "$bookname"
fi
