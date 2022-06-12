function cktodo
    set -l cur_date (date +%F)
    set -l todo_file $HOME/tmp/"$cur_date"_todo.md

    if test -f $todo_file
        vim $todo_file
    else
        echo "Nothing to do by now ✅"
    end
end
