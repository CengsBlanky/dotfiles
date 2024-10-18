if status is-interactive
    # ===== vi mode =====
    fish_vi_key_bindings
    bind --mode insert --sets-mode default jk repaint
    set fish_cursor_default block
    set fish_cursor_insert line
    set fish_cursor_replace_one underscore

    # per dir length
    set -g fish_prompt_pwd_dir_length 0

    # ===== ENV =====
    set -gx LANG "en_US.UTF-8"
    set -gx EDITOR /usr/local/bin/vim
    set -gx GIT_EDITOR $EDITOR
    set -gx LESS "-RiXF"
    # set -gx MANPAGER most
    # bc scale
    set -gx BC_ENV_ARGS "$HOME/.bc"
    # ripgrep 
    set -gx RIPGREP_CONFIG_PATH "$HOME/.config/rg/ripgreprc"
    if command -q rg
        set -gx FZF_DEFAULT_COMMAND "rg --files --column --line-number --no-heading --no-ignore"
    end
    set -gx NOTEDIR '$HOME/notes'
    # current location
    set -gx MY_CUR_LOCATION '雨花台'
    # add nvim default install path
    set PATH $PATH "/usr/local/nvim/bin"
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
    # springboot
    set -gx SPRING_HOME "$SDKMAN_CANDIDATES/springboot/current"
    set PATH $PATH "$SPRING_HOME/bin"

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
    # golang path
    set PATH $PATH "/usr/local/go/bin"
    # bun setup
    set --export BUN_INSTALL "$HOME/.bun"
    set --export PATH $BUN_INSTALL/bin $PATH
    # deno
    set PATH $PATH "$HOME/.deno/bin"

    # general
    set PATH $PATH "$HOME/.local/bin"
    set PATH $PATH "$HOME/bin"
    # kubectl autocompletion
    # kubectl completion fish | source
    # fzf
    set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --smart-case"
    bind --mode insert \cr "vim (fzf --preview='batcat --color=always --style=numbers {}')"

    # ===== abbriviations =====
    abbr --add cls "clear"
    abbr --add gui "gitui"
    abbr --add gst "git status"
    abbr --add gck "git checkout"
    abbr --add gdf "git diff"
    abbr --add gps "git push"
    abbr --add gpl "git pull --rebase"
    abbr --add gad "git add"
    abbr --add gcm "git commit -a"
    abbr --add glg "git log --author=(git config user.name) --oneline -n 10"
    abbr --add gsh "git show"
    abbr --add note "joplin"
    # django
    abbr --add pymanage "python manage.py"
    # replace which command
    abbr --add which "command -s"
    # better hibernate
    abbr --add hibernate "sudo pm-hibernate"
    # take little notes
    abbr --add nt notenow
    # yt-dlp
    abbr --add yd --set-cursor "yt-dlp '%'"
    # find files
    abbr --add found "fzf --preview='batcat --color=always --style=plain,numbers {}'"


    # source asdf version manager
    set -l asdf_conf "$HOME/.asdf/asdf.fish"
    if test -e $asdf_conf
        source $asdf_conf
    end
    # zoxide config
    if command -q zoxide
        zoxide init --cmd cd fish | source
    end
end

