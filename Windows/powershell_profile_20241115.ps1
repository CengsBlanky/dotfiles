function Cd-D {
    cd D:\
}

function Cd-Home {
    cd $HOME
}

function Cd-Code {
    cd D:\code
}

function Cd-Tmp {
    cd D:\tmp
}

function Cd-Project {
    cd D:\projects
}

function Cd-Note {
    cd D:\notes\$(Get-Date -Format 'yyyy')
}

function Cd-Espanso {
    cd "$HOME\AppData\Roaming\espanso\"
}

function Cd-Nvim {
    cd "$HOME\AppData\Local\nvim"
}

function Edit-Vi {
    vi "$HOME\AppData\Local\nvim\_vimrc"
}

function Clean-Tmpfiles {
    Remove-Item "D:\tmp\*" -Recurse -Force
}

function Open-Download {
    Open-Item "C:\users\z30034089\downloads"
}

function Cd-Learn {
    cd D:\learn
}

function Cd-Music {
    cd D:\music
}

function Cd-Http {
    cd D:\DevTools\http
}

function Open-Item {
    param(
            [PSDefaultValue(Help="default open pwd")]
            [string]$path = $PWD.Path
         )
    Invoke-Item $path
}

function Force-Mkdir {
    param([string]$path)

    New-Item -ItemType Directory -Force -Path $path
}

function Find-Files {
    param([string]$file_name)

    rg --files | rg $file_name
}

function Vi-Fzf {
    vi (fzf)
}

function Copy-Cwd {
    Set-Clipboard -Value $PWD
}

function Check-Note {
    param(
        [PSDefaultValue(Help="days before or after now")]
        [double]$days = 0.0
    )

    $target_date = (Get-Date).AddDays($days)
    $current_year = Get-Date $target_date -Format 'yyyy'
    $current_date = (Get-Date $target_date -Format 'yyyyMMdd')
    $note_dir = "D:\notes\$current_year"
    $note_filename = "$current_date.md"
    $note_file = "$note_dir\$note_filename"

    vi $note_file
}

function Search-Note {
    param(
        [Parameter(Mandatory, HelpMessage="input your search content")]
        [string]$content
    )
    $current_year = Get-Date $target_date -Format 'yyyy'
    $note_dir = "D:\notes\$current_year"
    rg $content $note_dir
}

function Analyze-Bug {
    param(
        [Parameter(Mandatory, HelpMessage="bug id to analize")]
        [string]$bug_id
    )
    $bug_file = "D:\notes\bugs\$bug_id.md"
    vi $bug_file
}

function To-Do {
    param(
        [string]$name
    )
    if ([string]::IsNullOrEmpty($name)) {
        cd "D:\todo"
        return
    }
    $todo_file = "D:\todo\$name.md"

    $current_time = (Get-Date -Format 'yyyy-MM-dd HH:mm:ss')
    if (-not (Test-Path $todo_file -PathType Leaf)) {
        Write-Output "# Todo from $current_time" > $todo_file
    } else {
        Write-Output "## $current_time" >> $todo_file
    }
    vi -c "norm Gzz" $todo_file
}

function Ssh-Blue {
    ssh blue_betam_hc
}
function Ssh-Blue-Hk {
    ssh blue_betam_hk
}
function Ssh-Green {
    ssh green_betam_hc
}
function Ssh-Green-Hk {
    ssh green_betam_hk
}
function Ssh-Master {
    ssh master_alpha
}
function Ssh-Yellow {
    ssh yellow_betam
}
function Ssh-Jumpserver {
    ssh jumpserver
}
function Ssh-Wl3 {
    ssh wl3
}
function Ssh-Transtation {
    ssh trans
}

function Go-Db {
    param(
        [string]$dbname = "marketingcampaigndb"
    )
    mycli -h 172.20.23.199 -u root --pass 8HD5agiwfJrx0ptc@ECS -D $dbname
}

function Go-Hkdb {
    param(
        [string]$dbname = "marketingcampaigndb"
    )
    mycli -h 172.20.64.100 -u root --pass 8HD5agiwfJrx0ptc@ECS  -D $dbname
}

function Go-Campdb {
    Go-Db
}

function Go-Campdbhk {
    Go-Hkdb
}

function Up-Folder {
    Set-Location ..
}

function Make-Tags {
    rg --files | ctags -R --links=no -L -
}

function Switch-Jdk8 {
    [Environment]::SetEnvironmentVariable("JAVA_HOME", "D:\DevTools\huaweiJDK8", [EnvironmentVariableTarget]::Machine)
    [Environment]::SetEnvironmentVariable("MAVEN_HOME", "D:\DevTools\apache-maven-3.8.1", [EnvironmentVariableTarget]::Machine)
    Refresh-EnvironmentVariables
}

function Switch-Jdk17 {
    [Environment]::SetEnvironmentVariable("JAVA_HOME", "D:\DevTools\oracleJDK17", [EnvironmentVariableTarget]::Machine)
    [Environment]::SetEnvironmentVariable("MAVEN_HOME", "D:\DevTools\apache-maven-3.9.9", [EnvironmentVariableTarget]::Machine)
    Refresh-EnvironmentVariables
}

Set-Alias cdd Cd-D
Set-Alias cdcode Cd-Code
Set-Alias cdtmp Cd-Tmp
Set-Alias cdproject Cd-Project
Set-Alias cdnote Cd-Note
Set-Alias cdhome Cd-Home
Set-Alias cdespanso Cd-Espanso
Set-Alias cdnvim Cd-Nvim
Set-Alias cdlearn Cd-Learn
Set-Alias cdmusic Cd-Music
Set-Alias cknote Check-Note
Set-Alias rgnote Search-Note
Set-Alias bug Analyze-Bug
Set-Alias todo To-Do
Set-Alias cwd Copy-Cwd

Set-Alias open Open-Item

Set-Alias l dir
Set-Alias vim D:\DevTools\neovim\bin\nvim
Set-Alias vi D:\DevTools\gvim\Vim\vim91\vim.exe
Set-Alias rg D:\tools\ripgrep\rg.exe
Set-Alias .. Up-Folder
Set-Alias cdhttp Cd-Http
Set-Alias campdb Go-Campdb
Set-Alias campdbhk Go-Campdbhk

# Elixir command alias
Set-Alias ielx iex.bat

Import-Module -Name Terminal-Icons
oh-my-posh --init --shell pwsh --config C:/Code/amro.json | Invoke-Expression

# Save the current value in the $p variable.
$p = [Environment]::GetEnvironmentVariable("PSModulePath")
# Add the new path to the $p variable. Begin with a semi-colon separator.
$p += ";$HOME\PSmodules"
# Add the paths in $p to the PSModulePath value.
[Environment]::SetEnvironmentVariable("PSModulePath",$p)
[Console]::OutputEncoding = [Text.Encoding]::UTF8
[Console]::InputEncoding = [Text.Encoding]::UTF8
$env:LESSCHARSET='utf-8'
$env:POWERSHELL_UPDATECHECK = 'Off'
$env:NODE_PATH = "D:\npm_lib"
$env:RIPGREP_CONFIG_PATH = "$HOME\ripgreprc"
# $env:HTTP_PROXY = "http://proxyhk.huawei.com:8080"
# $env:HTTPS_PROXY = "http://proxyhk.huawei.com:8080"
Set-PSReadLineKeyHandler -Chord Ctrl+r -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert('vi (fzf)')
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}
Set-PSReadLineKeyHandler -Chord Ctrl+u -Function BackwardKillLine
# zoxide config at the end of config file
Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })
