for x in {0..255}; do  printf "\x1b[38;5;${x}mcolor%-5i\x1b[0m" $x ; if ! (( ($x + 1 ) % 8 )); then echo ; fi ; done
