#!/bin/bash

source_fonts_dir="$1"
target_fonts_dir="$2"

for font_name in $source_fonts_dir/*.ttf; do
    ./font-patcher \
        --windows \
        --complete \
        --progressbars \
        --fontawesome \
        --fontawesomeextension \
        --fontlogos \
        --fontlinux \
        --octicons \
        --codicons \
        --powersymbols \
        --pomicons \
        --powerline \
        --powerlineextra \
        --weather \
        $font_name \
        --out $target_fonts_dir
done
