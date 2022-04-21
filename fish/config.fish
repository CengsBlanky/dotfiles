if status is-interactive
    # ===== vi mode =====
    fish_vi_key_bindings
    # Emulates vim's cursor shape behavior
    # Set the normal and visual mode cursors to a block
    set -g fish_cursor_default block
    # Set the insert mode cursor to a line
    set -g fish_cursor_insert line
    # Set the replace mode cursor to an underscore
    set -g fish_cursor_replace_one underscore
    # The following variable can be used to configure cursor shape in
    # visual mode, but due to fish_cursor_default, is redundant here
    set -g fish_cursor_visual block
    set -g fish_vi_force_cursor 1

    # ===== gloabal variables =====
    set -g __fish_git_prompt_showcolorhints true
    set -g __fish_git_prompt_showdirtystate true
    set -g __fish_git_prompt_showuntrackedfiles true
    set -g __fish_git_prompt_showupstream auto
    set -g __fish_git_prompt_char_upstream_ahead ' ⇡'
    set -g __fish_git_prompt_char_upstream_behind ' ⇣'
    set -g __fish_git_prompt_char_upstream_diverged ' ⇵'
    set -g __fish_git_prompt_char_upstream_equal ""

    # ===== ENV =====
    set -gx LANG "en_US.UTF-8"
    set -gx EDITOR nvim
    set -gx LESS "-RiXF"
    # bc scale
    set -gx BC_ENV_ARGS "/home/zengshuai/.bc"
    # ripgrep 
    if command -q rg
        set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --column --line-number --no-heading --no-ignore --smart-case --ignore-file $HOME/.vim/ignorefile"
    end
    # java
    set -gx JAVA_HOME "/opt/jdk"
    set PATH $PATH $JAVA_HOME 
    # gradle
    set PATH $PATH "/opt/gradle/gradle-7.4.1/bin"
    # rust
    set PATH $PATH "$HOME/.cargo/bin"
    # golang
    set PATH $PATH "$HOME/go/bin"
    # Flutter
    set -gx PUB_HOSTED_URL "https://pub.flutter-io.cn"
    set -gx FLUTTER_STORAGE_BASE_URL "https://storage.flutter-io.cn"
    set PATH $PATH "$HOME/snap/flutter/common/flutter/bin"
    set PATH $PATH "$HOME/tools/android-studio/bin"
    # spring boot cli
    set PATH $PATH "$HOME/tools/spring-2.6.4/bin"
    # general
    set PATH $PATH "$HOME/.local/bin"
    set PATH $PATH "$HOME/bin"

    # ===== abbriviations =====
    abbr --add cls "clear"
    abbr --add gui "gitui"
    abbr --add gst "git status"
    abbr --add gdf "git diff"
    abbr --add gps "git push"
    abbr --add gpl "git pull"
    abbr --add gad "git add"
    abbr --add gcm "git commit -am"
    abbr --add cdnote "cd $HOME/notes/journal"

    # key bind
    bind --mode insert \cr "" --sets-mode default

end
