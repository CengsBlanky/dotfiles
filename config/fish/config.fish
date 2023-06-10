if status is-interactive
    # ===== vi mode =====
    fish_vi_key_bindings

    # per dir length
    set -g fish_prompt_pwd_dir_length 0

    # ===== ENV =====
    set -gx LANG "en_US.UTF-8"
    set -gx EDITOR nvim
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
    set -gx JAVA_HOME "/usr/lib/jvm/java-17-openjdk-amd64"
    set PATH $PATH "$JAVA_HOME/bin"
    set -gx MAVEN_HOME "/opt/apache-maven-3.9.0/"
    set PATH $PATH "$MAVEN_HOME/bin"
    # jdtls
    # set -gx JDTLS_JVM_ARGS "-javaagent:$HOME/.m2/lib/lombok-1.18.24.jar"
    # gradle
    set PATH $PATH "/opt/gradle/gradle-7.4.1/bin"
    # rust
    set PATH $PATH "$HOME/.cargo/bin"
    # golang
    set PATH $PATH "$HOME/go/bin"
    # Flutter
    set -gx PUB_HOSTED_URL "https://pub.flutter-io.cn"
    set -gx FLUTTER_STORAGE_BASE_URL "https://storage.flutter-io.cn"
    set -gx ANDROID_HOME "$HOME/Android/Sdk"
    set -gx ADB "$ANDROID_HOME/platform-tools/adb"
    set PATH $PATH "$ANDROID_HOME/platform-tools"
    set PATH $PATH "$HOME/Applications/flutter/bin"
    set PATH $PATH "$HOME/Applications/android-studio/bin"
    set PATH $PATH "$ANDROID_HOME/tools"
    set PATH $PATH "$ANDROID_HOME/tools/bin"
    set PATH $PATH "$ANDROID_HOME/tools/platform-tools"
    set PATH $PATH "$ANDROID_HOME/cmdline-tools/latest/bin"
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
    abbr --add note "joplin"
    abbr --add cdshare "cd /home/share/"
    # django
    abbr --add pymanage "python manage.py"
    # replace which command
    abbr --add which "command -s"

    # key bind
    bind --mode insert \cr "" --sets-mode default
end
