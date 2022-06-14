function todo
    set -l todo_thing $argv[1]
    set -l cur_time (date +%F\ %H:%M:%S)
    set -l cur_date (date +%F)
    set -l time_header "# "$cur_time
    set -l todo_file $HOME/tmp/"$cur_date"_todo.md

    echo $time_header >> $todo_file

    if test -z "$todo_thing"
        vim -c "norm G2o" \
            -c "norm O" \
            -c "norm zz" \
            -c "startinsert" $todo_file
    else
        printf '\n%s\n\n' $todo_thing >> $todo_file
        printf 'Add todo:\n%s\n' $todo_thing
    end
end
