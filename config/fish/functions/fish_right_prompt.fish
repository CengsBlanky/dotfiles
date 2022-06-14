function fish_right_prompt
    # set_color -o
    set -g __fish_git_prompt_showcolorhints true
    set -g __fish_git_prompt_showdirtystate true
    set -g __fish_git_prompt_showuntrackedfiles true
    # set -g __fish_git_prompt_showupstream auto
    set -g __fish_git_prompt_char_stateseparator ' '
    set -g __fish_git_prompt_char_upstream_ahead ''
    set -g __fish_git_prompt_char_upstream_behind ''
    set -g __fish_git_prompt_char_upstream_diverged ''
    set -g __fish_git_prompt_char_upstream_equal ""

    echo -n (fish_git_prompt)
end
