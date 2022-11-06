if status is-interactive
    # ===== vi mode =====
    fish_vi_key_bindings
    # Emulates vim's cursor shape behavior
    # Set the normal and visual mode cursors to a block
    set -g fish_cursor_default block
    # Set the insert mode cursor to a line
    set -g fish_cursor_insert block
    # Set the replace mode cursor to an underscore
    # set -g fish_cursor_replace_one underscore
    # The following variable can be used to configure cursor shape in
    # visual mode, but due to fish_cursor_default, is redundant here
    set -g fish_cursor_visual block
    set -g fish_vi_force_cursor 1
    # set pwd length
    set -g fish_prompt_pwd_dir_length 0

    # ===== ENV =====
    set -gx LANG "en_US.UTF-8"
    set -gx EDITOR vim
    set -gx LESS "-FRiX"
    set -gx CUR_LOCATION '雨花台'
    set -gx ESPANSO_CONFIG "$HOME/Library/Application Support/espanso"
    # ripgrep 
    if command -q rg
        set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --column --line-number --no-heading --no-ignore --smart-case --ignore-file $HOME/.vim/ignorefile"
    end
    # java
    set -l JAVA8_HOME "/Library/Java/JavaVirtualMachines/jdk1.8.0_311.jdk/Contents/Home"
    set -l JAVA11_HOME "/Library/Java/JavaVirtualMachines/jdk-11.0.7.jdk/Contents/Home"
    set -gx JAVA_HOME $JAVA11_HOME
    set PATH $PATH "$HOME/.local/bin"
    set PATH $PATH "$HOME/bin"
    set PATH $PATH $JAVA_HOME 
    # rust
    set PATH $PATH "$HOME/.cargo/bin"
    # golang
    set -gx GOPATH "$HOME/go"
    set -gx GO111MODULE "auto"
    set PATH $PATH "$HOME/go/bin"
    # php
    set -gx PHP_HOME "/usr/local/opt/php/bin"
    set PATH $PATH "/usr/local/opt/openldap/bin"
    set PATH $PATH "/usr/local/opt/curl/bin"
    set PATH $PATH "/usr/local/opt/libpq/bin"
    set PATH $PATH $PHP_HOME
    # llvm 
    set PATH $PATH "/usr/local/opt/llvm/bin"
    set PATH $PATH "/usr/local/opt/llvm"
    # mysql
    set PATH $PATH "/usr/local/opt/mysql/bin"
    # android cmd line tools
    set -gx ANDROID_CMD "$HOME/.android_cmd"
    set PATH $PATH "$ANDROID_CMD/bin"
    # Flutter
    set PATH $PATH "$HOME/tools/flutter/bin"
    # ruby
    set PATH $PATH "/usr/local/opt/ruby/bin"
    set -gx GEM_HOME "$HOME/.gem"
    set PATH $PATH "$GEM_HOME/bin"
    # nvm
    set -gx NVM_DIR "$HOME/.nvm"

    # ===== abbriviations =====
    abbr --add cls "clear"
    abbr --add note "joplin"
    abbr --add cdespanso "cd $ESPANSO_CONFIG"
    # git abbr
    abbr --add gst "git status"
    abbr --add gad "git add"
    abbr --add gcm "git commit"
    abbr --add gps "git push"
    abbr --add gpl "git pull"
    abbr --add gdf "git diff"
    abbr --add gck "git checkout"
    abbr --add gbr "git branch"

    # key bind
    bind --mode insert \cr "" --sets-mode default
    
    # startup
    # nvm use --lts > /dev/null
end
