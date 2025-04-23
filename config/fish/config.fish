if status is-interactive
    # ===== vi mode =====
    # fish_vi_key_bindings
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
    # bc scale
    set -gx BC_ENV_ARGS "$HOME/.bc"
    # ripgrep
    set -gx RIPGREP_CONFIG_PATH "$HOME/.config/rg/ripgreprc"
    set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --smart-case"
    # fzf find files
    abbr --add found "fzf --preview='batcat --color=always --style=plain,numbers {}'"
    set -gx NOTEDIR '$HOME/notes'
    # current location
    set -gx MY_CUR_LOCATION '雨花台'
    # add nvim default install path
    fish_add_path --path --append "/usr/local/nvim/bin"
    # SDKMAN start
    set -l SDKMAN_CANDIDATES "$HOME/.sdkman/candidates"
    # java
    set -gx JAVA_HOME "$SDKMAN_CANDIDATES/java/current"
    fish_add_path --path --append "$JAVA_HOME/bin"
    # maven
    set -gx MAVEN_HOME "$SDKMAN_CANDIDATES/maven/current"
    fish_add_path --path --append "$MAVEN_HOME/bin"
    # gradle
    set -gx GRADLE_HOME "$SDKMAN_CANDIDATES/gradle/current"
    fish_add_path --path --append "$GRADLE_HOME/bin"
    # springboot
    set -gx SPRING_HOME "$SDKMAN_CANDIDATES/springboot/current"
    fish_add_path --path --append "$SPRING_HOME/bin"
    # jdtls
    # set -gx JDTLS_JVM_ARGS "-javaagent:$HOME/.m2/lib/lombok-1.18.24.jar"
    # Kotlin
    set -gx KOTLIN_HOME "$SDKMAN_CANDIDATES/kotlin/current"
    fish_add_path --path --append "$KOTLIN_HOME/bin"
    # SDKMAN end

    # rust
    fish_add_path --path --append "$HOME/.cargo/bin"
    # golang
    fish_add_path --path --append "$HOME/go/bin"
    # Flutter
    fish_add_path --path --append "$HOME/Apps/flutter/bin"
    set -gx PUB_HOSTED_URL "https://mirrors.tuna.tsinghua.edu.cn/dart-pub"
    set -gx FLUTTER_STORAGE_BASE_URL "https://mirrors.tuna.tsinghua.edu.cn/flutter"
    # Android
    set -gx ANDROID_HOME "$HOME/Android/Sdk"
    set -gx ADB "$ANDROID_HOME/platform-tools/adb"
    fish_add_path --path --append "$ANDROID_HOME/platform-tools"
    fish_add_path --path --append "$ANDROID_HOME/tools"
    fish_add_path --path --append "$ANDROID_HOME/tools/bin"
    fish_add_path --path --append "$ANDROID_HOME/tools/platform-tools"
    # npm config
    fish_add_path --path --append "$HOME/.local/share/npm/bin"
    # spring boot cli
    fish_add_path --path --append "$HOME/tools/spring-2.6.4/bin"
    # ruby binaries
    fish_add_path --path --append "$HOME/.local/share/gem/ruby/3.0.0/bin"
    # golang path
    fish_add_path --path --append "/usr/local/go/bin"
    # bun setup
    set -gx BUN_INSTALL "$HOME/.bun"
    fish_add_path --path --append "$BUN_INSTALL/bin"
    # deno
    fish_add_path --path --append "$HOME/.deno/bin"
    # ruby
    fish_add_path --path "$HOME/.rubies/ruby-stable/bin"
    # zig
    fish_add_path --path --append "$HOME/Apps/zig-linux-x86_64-0.13.0/"

    # general
    fish_add_path --path --append "$HOME/.local/bin"
    fish_add_path --path --append "$HOME/bin"
    # kubectl autocompletion
    # kubectl completion fish | source
    bind --mode insert \cf "vim (fzf --preview='batcat --color=always --style=numbers {}')"

    # ===== abbriviations =====
    abbr --add cls "clear"
    abbr --add gui "gitui"
    abbr --add gst "git status"
    abbr --add gck "git checkout"
    abbr --add grs "git restore"
    abbr --add gdf "git diff"
    abbr --add gps "git push"
    abbr --add gpl "git pull --rebase"
    abbr --add gad "git add"
    abbr --add gcm "git commit -a"
    abbr --add glg "git log --author=(git config user.name) --oneline -n 10"
    abbr --add gsh "git show"
    abbr --add note "joplin"
    # py for python
    abbr --add py "python"
    # django
    abbr --add pymanage "python manage.py"
    # replace which command
    abbr --add which "command -s"
    # better hibernate
    abbr --add hibernate "sudo pm-hibernate"
    # take little notes
    abbr --add nt notenow
    # goto dotfiles
    abbr --add cddot cd ~/.dotfiles
    # yt-dlp
    abbr --add yd --set-cursor "yt-dlp '%'"

    # source asdf version manager
    set -l asdf_conf "$HOME/.asdf/asdf.fish"
    if test -e $asdf_conf
        source $asdf_conf
    end
    # zoxide config
    if command -q zoxide
        zoxide init --cmd cd fish | source
    end
    # uv autocompletion
    set -l uv_cmp $HOME/.config/fish/completions/uv.fish
    set -l uvx_cmp $HOME/.config/fish/completions/uvx.fish
    if not test -e $uv_cmp; or not test -e $uvx_cmp
        if command -q uv
            uv generate-shell-completion fish > $uv_cmp
            uvx --generate-shell-completion fish > $uvx_cmp
        end
    end
end

