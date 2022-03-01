if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g fish_prompt_pwd_dir_length 0

    # ===== vi mode =====
    fish_vi_key_bindings
    # Emulates vim's cursor shape behavior
    # Set the normal and visual mode cursors to a block
    set -U fish_cursor_default block
    # Set the insert mode cursor to a line
    set -U fish_cursor_insert line
    # Set the replace mode cursor to an underscore
    set -U fish_cursor_replace_one underscore
    # The following variable can be used to configure cursor shape in
    # visual mode, but due to fish_cursor_default, is redundant here
    set -U fish_cursor_visual block
    set -U fish_vi_force_cursor 1

    # ===== gloabal variables =====
    set -gx LANG "en_US.UTF-8"
    set -gx EDITOR vim
    set -gx LESS "-RiX"
    # ripgrep 
    if command -q rg
        set -Ux FZF_DEFAULT_COMMAND "rg --files --hidden --column --line-number --no-heading --no-ignore --smart-case --ignore-file $HOME/.vim/ignorefile"
    end
    # java
    set -Ux JAVA_HOME "/opt/java"
    set PATH $PATH "$HOME/.local/bin"
    set PATH $PATH "$HOME/bin"
    set PATH $PATH $JAVA_HOME 
    # rust
    set PATH $PATH "$HOME/.cargo/bin"
    # golang
    set PATH $PATH "$HOME/go/bin"
    # Flutter
    set -Ux PUB_HOSTED_URL "https://pub.flutter-io.cn"
    set -Ux FLUTTER_STORAGE_BASE_URL "https://storage.flutter-io.cn"
    set PATH $PATH "$HOME/snap/flutter/common/flutter/bin"
    set PATH $PATH "$HOME/tools/android-studio/bin"

    # ===== abbriviations =====
    abbr --add cls "clear"
    abbr --add gui "gitui"
    abbr --add gst "git status"
    abbr --add gdf "git diff | cat"
    abbr --add gps "git push"
    abbr --add gpl "git pull"
    abbr --add gad "git add"
    abbr --add gcm "git commit -am"

    # key bind
    bind --mode insert \cr "" --sets-mode default

end
