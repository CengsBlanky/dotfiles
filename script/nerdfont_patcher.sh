#!/bin/bash

source_fonts_dir="$1"
target_fonts_dir="$2"

for font_name in $source_fonts_dir/*.ttf; do
    fontforge --script ./font-patcher \
        --complete \
        $font_name \
        --out $target_fonts_dir
done
