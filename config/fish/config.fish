if status is-interactive
    # ===== vi mode =====
    fish_vi_key_bindings

    # per dir length
    set -g fish_prompt_pwd_dir_length 0

    # ===== ENV =====
    set -gx LANG "en_US.UTF-8"
    set -gx EDITOR vim
    set -gx LESS "-RiXF"
    # set -gx MANPAGER most
    # bc scale
    set -gx BC_ENV_ARGS "/home/zengshuai/.bc"
    # ripgrep 
    if command -q rg
        set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --column --line-number --no-heading --no-ignore --smart-case --ignore-file $HOME/.config/nvim/ignorefile"
    end
    # current location
    set -gx MY_CUR_LOCATION '雨花台'
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
    # ruby binaries
    set PATH $PATH "$HOME/.local/share/gem/ruby/3.0.0/bin"
    # general
    set PATH $PATH "$HOME/.local/bin"
    set PATH $PATH "$HOME/bin"
    # kubectl autocompletion
    # kubectl completion fish | source

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
