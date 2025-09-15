# ===== vi mode =====
fish_vi_key_bindings
bind --mode insert --sets-mode default jk repaint
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore

# per dir length
set -g fish_prompt_pwd_dir_length 0

# ===== ENV =====
# general
fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/bin"
set -gx LANG "en_US.UTF-8"
set -gx EDITOR vim
set -gx GIT_EDITOR /usr/local/bin/vim
set -gx LESS "-RiXF"
# set nvim as pager
if command -q nvim
    set -gx MANPAGER "nvim +Man!"
else
    set -gx MANPAGER "less --incsearch"
end
# bc config file
set -gx BC_ENV_ARGS "$HOME/.bc"
# ripgrep
set -gx RIPGREP_CONFIG_PATH "$HOME/.config/rg/ripgreprc"
set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --smart-case"
set -gx NOTEDIR '$HOME/notes'
# current location
set -gx MY_CUR_LOCATION '江宁区'
# add nvim default install path
fish_add_path "/usr/local/nvim/bin"
# === SDKMAN start ===
set -l SDKMAN_CANDIDATES "$HOME/.sdkman/candidates"
# java
set -gx JAVA_HOME "$SDKMAN_CANDIDATES/java/current"
fish_add_path "$JAVA_HOME/bin"
# maven
set -gx MAVEN_HOME "$SDKMAN_CANDIDATES/maven/current"
fish_add_path "$MAVEN_HOME/bin"
# gradle
set -gx GRADLE_HOME "$SDKMAN_CANDIDATES/gradle/current"
fish_add_path "$GRADLE_HOME/bin"
# springboot
set -gx SPRING_HOME "$SDKMAN_CANDIDATES/springboot/current"
fish_add_path "$SPRING_HOME/bin"
# jdtls
# set -gx JDTLS_JVM_ARGS "-javaagent:$HOME/.m2/lib/lombok-1.18.24.jar"
# Kotlin
set -gx KOTLIN_HOME "$SDKMAN_CANDIDATES/kotlin/current"
fish_add_path "$KOTLIN_HOME/bin"
# === SDKMAN end ===

# rust
fish_add_path "$HOME/.cargo/bin"
# golang
fish_add_path "$HOME/go/bin"
# flatpak app path
fish_add_path "$HOME/.local/share/flatpak/exports/bin"
# Flutter
fish_add_path "$HOME/Apps/flutter/bin"
set -gx PUB_HOSTED_URL "https://mirrors.tuna.tsinghua.edu.cn/dart-pub"
set -gx FLUTTER_STORAGE_BASE_URL "https://mirrors.tuna.tsinghua.edu.cn/flutter"
# Android
set -gx ANDROID_HOME "$HOME/Android/Sdk"
set -gx ADB "$ANDROID_HOME/platform-tools/adb"
# for google gemini-cli
set -gx GOOGLE_CLOUD_PROJECT "initialz-250717"
# nvm bin config
fish_add_path "$HOME/.local/share/nvm/current/bin"
# spring boot cli
fish_add_path "$HOME/tools/spring-2.6.4/bin"
# ruby binaries
fish_add_path "$HOME/.local/share/gem/ruby/3.0.0/bin"
# golang path
fish_add_path "/usr/local/go/bin"
# bun setup
set -gx BUN_INSTALL "$HOME/.bun"
fish_add_path "$BUN_INSTALL/bin"
# deno
fish_add_path "$HOME/.deno/bin"
# ruby
fish_add_path --path "$HOME/.rubies/ruby-stable/bin"
# zig binary
fish_add_path "$HOME/.local/share/zig0151/"
# doom emacs
fish_add_path "$HOME/.config/emacs/bin"
# exa config
set -gx EXA_COLORS "*.mp3=38;2;227;138;174"

# kubectl autocompletion
# kubectl completion fish | source
bind --mode insert \cs "vim (fzf --preview='bat --color=always --theme=Nord --style=numbers {}')"

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
abbr --add gcp --set-cursor "git commit -am '%' && git push"
abbr --add note "joplin"
# replace which command
abbr --add which "command -s"
# take little notes
abbr --add nt notenow
# goto dotfiles
abbr --add cddot cd ~/.dotfiles
# yt-dlp
abbr --add yd --set-cursor "yt-dlp '%'"
# fzf find files
abbr --add found "fzf --preview='batcat --color=always --style=plain,numbers {}'"
# py for python
abbr --add py "python"
# django
abbr --add pymanage "python manage.py"
# activate python venv
abbr --add pyactive "source .venv/bin/activate.fish"

# source asdf version manager
set -l asdf_conf "$HOME/.asdf/asdf.fish"
if test -e $asdf_conf
    source $asdf_conf
end
# zoxide config
if command -q zoxide
    zoxide init --cmd cd fish | source
end
# generate uv autocompletion
# uv generate-shell-completion fish > $uv_cmp
# uvx --generate-shell-completion fish > $uvx_cmp
