#! /bin/sh
# @since   2021-09-30 16:11
# @author  zengshuai
# @version 1.0

# myDotfiles="$HOME/dotfiles"

myDotfiles="$HOME/dotfiles"
targetFolder="$HOME"

declare -A noDotConfigFiles
noDotConfigFiles=(
["emacs"]="emacs"
["maven"]="maven"
)

declare -A dotConfigFiles=(
["git"]="git"
["npm"]="npm"
["nvim"]="nvim"
["rust"]="rust"
["sbcl"]="sbcl"
["tmux"]="tmux"
["vue"]="vue"
["yabai"]="yabai"
["zsh"]="zsh"
)

for file in "$myDotfiles"/*
do
    if [ -d "$file" ] && [ -s "$file" ]
    then
        cd $myDotfiles
        directoryName=$(basename $file)
        if [ ${noDotConfigFiles["$directoryName"]} ]
        then
            stow --verbose -t $targetFolder $directoryName
        elif [ ${dotConfigFiles["$directoryName"]} ]
        then
            stow --verbose -t $targetFolder --dotfiles $directoryName
        fi
    fi
done
