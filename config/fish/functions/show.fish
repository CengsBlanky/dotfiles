function show
    if command -q bat
        bat --tabs 0 --number $argv
    else if command -q batcat
        batcat --tabs 0 --number $argv
    else
        /usr/bin/cat $argv
    end
end
