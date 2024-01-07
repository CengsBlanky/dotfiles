if status is-interactive
    # ===== vi mode =====
    fish_vi_key_bindings
    bind --mode insert --sets-mode default jk repaint
    set fish_cursor_default block
    set fish_cursor_insert line blink
    set fish_cursor_replace_one underscore

    # per dir length
    set -g fish_prompt_pwd_dir_length 3

    # ===== ENV =====
    set -gx LANG "en_US.UTF-8"
    set -gx EDITOR nvim
    set -gx GIT_EDITOR nvim
    set -gx LESS "-RiXF"
    # set -gx MANPAGER most
    # bc scale
    set -gx BC_ENV_ARGS "$HOME/.bc"
    # ripgrep 
    set -gx RIPGREP_CONFIG_PATH "$HOME/.config/rg/ripgreprc"
    if command -q rg
        set -gx FZF_DEFAULT_COMMAND "rg --files --column --line-number --no-heading --no-ignore"
    end
    # current location
    set -gx MY_CUR_LOCATION '雨花台'
    # sdkman
    set -l SDKMAN_CANDIDATES "$HOME/.sdkman/candidates"
    # java
    set -gx JAVA_HOME "$SDKMAN_CANDIDATES/java/current"
    set PATH $PATH "$JAVA_HOME/bin" 
    # maven
    set -gx MAVEN_HOME "$SDKMAN_CANDIDATES/maven/current"
    set PATH $PATH "$MAVEN_HOME/bin"
    # gradle
    set -gx GRADLE_HOME "$SDKMAN_CANDIDATES/gradle/current"
    set PATH $PATH "$GRADLE_HOME/bin"
    # jdtls
    # set -gx JDTLS_JVM_ARGS "-javaagent:$HOME/.m2/lib/lombok-1.18.24.jar"
    # kotlin
    set -gx KOTLIN_HOME "$SDKMAN_CANDIDATES/kotlin/current"
    set PATH $PATH "$KOTLIN_HOME/bin"
    # rust
    set PATH $PATH "$HOME/.cargo/bin"
    # golang
    set PATH $PATH "$HOME/go/bin"
    # Flutter
    set PATH $PATH "$HOME/Apps/flutter/bin"
    set -gx PUB_HOSTED_URL "https://mirrors.tuna.tsinghua.edu.cn/dart-pub"
    set -gx FLUTTER_STORAGE_BASE_URL "https://mirrors.tuna.tsinghua.edu.cn/flutter"
    # Android
    set -gx ANDROID_HOME "$HOME/Android/Sdk"
    set -gx ADB "$ANDROID_HOME/platform-tools/adb"
    set PATH $PATH "$ANDROID_HOME/platform-tools"
    set PATH $PATH "$ANDROID_HOME/tools"
    set PATH $PATH "$ANDROID_HOME/tools/bin"
    set PATH $PATH "$ANDROID_HOME/tools/platform-tools"
    # npm config
    set PATH $PATH "$HOME/.local/share/npm/bin"
    # spring boot cli
    set PATH $PATH "$HOME/tools/spring-2.6.4/bin"
    # ruby binaries
    set PATH $PATH "$HOME/.local/share/gem/ruby/3.0.0/bin"
    # source asdf version manager
    source ~/.asdf/asdf.fish

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
    abbr --add gcm "git commit -a"
    abbr --add glg "git log --author=(git config user.name) --oneline -n 10"
    abbr --add gsh "git show"
    abbr --add note "joplin"
    # django
    abbr --add pymanage "python manage.py"
    # replace which command
    abbr --add which "command -s"
    # quick to nvim config
    abbr --add cddot "cd $HOME/.dotfiles"
    abbr --add cdnvim "cd $HOME/.config/nvim"
    abbr --add cdshare "cd /home/share/"
    abbr --add cdnote "cd $HOME/notes/journal"
    # better hibernate
    abbr --add hibernate "sudo pm-hibernate"

    # key bind
    bind --mode insert \cr "" --sets-mode default
end
