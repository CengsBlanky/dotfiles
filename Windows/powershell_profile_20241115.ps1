function Cd-D {
    cd D:\
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

function Clean-Download {
    Remove-Item "C:\users\z30034089\downloads\*" -Recurse -Force
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

function Go-Mkdir {
    param([string]$path)

    Force-Mkdir $path
    cd $path
}

function Find-Files {
    param([string]$file_name)

    rg --files | rg $file_name
}

function Vi-Fzf {
    vim (fzf)
}

function Copy-Cwd {
    Set-Clipboard -Value $PWD
}

function todo {
    param(
        [string]$Something = "",
        [switch]$Read
    )

    $todo_file = "D:\notes\todo.md"
    if ($Read) {
        vi $todo_file
        return
    }
    $todo_time = Get-Date -Format 'yyyy-MM-dd HH:mm:ss ddd'
    $newline = "`r`n"

    if (Test-Path $todo_file -PathType Leaf) {
        Write-Output $newline >> $todo_file
    }
    Write-Output "## $todo_time" >> $todo_file
    Add-Content -Path $todo_file -Value "$newline- [] $Something"
    vi -c "norm GzzA" $todo_file
}

function note {
    param(
        [PSDefaultValue(Help="days before or after now")]
        [double]$days = 0.0
    )

    $target_date = (Get-Date).AddDays($days)

    $current_year = Get-Date $target_date -Format 'yyyy'
    $current_date = (Get-Date $target_date -Format 'yyyyMMdd')
    $current_time = Get-Date $target_date -Format 'HH:mm:ss'
    $weekday = Get-Date $target_date -UFormat "%A"
    $note_dir = "D:\notes\$current_year"
    $note_filename = "$current_date.md"
    $note_file = "$note_dir\$note_filename"
    $newline = "`r`n"

    if (-not (Test-Path $note_dir)) {
        New-Item -Type Directory -Force -Path $note_dir
    }

    if (-not (Test-Path $note_file -PathType Leaf)) {
        Write-Output "# Note for $current_date $weekday" > $note_file
    }
    Add-Content -Path $note_file -Value "$newline## $current_time$newline"

    vi -c "norm Gzzo" $note_file
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
    rg -i $content $note_dir
}

function Analyze-Bug {
    param(
        [Parameter(Mandatory, HelpMessage="bug id to analize")]
        [string]$bug_id
    )
    $bug_file = "D:\notes\bugs\$bug_id.md"
    vi $bug_file
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

function Up-Folder {
    Set-Location ..
}

function Remove-Dir {
    param([string]$path)
    Remove-Item -Force -Recurse $path
}

function Make-Tags {
    rg --files | ctags -R --links=no -L -
}

function Switch-Jdk17 {
    [Environment]::SetEnvironmentVariable("JAVA_HOME", "D:\DevTools\oracleJDK17", [EnvironmentVariableTarget]::Machine)
    [Environment]::SetEnvironmentVariable("MAVEN_HOME", "D:\DevTools\apache-maven-3.8.8", [EnvironmentVariableTarget]::Machine)
    Refresh-EnvironmentVariables
}

function Switch-Jdk21 {
    [Environment]::SetEnvironmentVariable("JAVA_HOME", "D:\DevTools\jdk21", [EnvironmentVariableTarget]::Machine)
    [Environment]::SetEnvironmentVariable("MAVEN_HOME", "D:\DevTools\apache-maven-3.9.9", [EnvironmentVariableTarget]::Machine)
    Refresh-EnvironmentVariables
}

function Invoke-Chrome {
    param([string]$group)
    $chrome = 'C:\Program Files\Google\Chrome\Application\chrome.exe'
    $arg = "--user-data-dir=$group"
    & $chrome $arg
}

function Beta-Chrome {
    Invoke-Chrome -group "D:\appData\chrome_beta"
}

function Dev-Chrome {
    Invoke-Chrome -group "D:\appData\chrome_dev"
}

function Service-Chrome {
    Invoke-Chrome -group "D:\appData\chrome_service"
}

function Cors-Chrome {
    $chrome = 'C:\Program Files\Google\Chrome\Application\chrome.exe'
    $userDir = "D:\appData\chrome_cors"
    $arg = "--user-data-dir=$userDir"
    & $chrome $arg --disable-web-security
}

Set-Alias cdd Cd-D
Set-Alias cdcode Cd-Code
Set-Alias cdtmp Cd-Tmp
Set-Alias cdproject Cd-Project
Set-Alias cdnote Cd-Note
Set-Alias cdespanso Cd-Espanso
Set-Alias cdnvim Cd-Nvim
Set-Alias cdlearn Cd-Learn
Set-Alias cdmusic Cd-Music
Set-Alias cknote Check-Note
Set-Alias rgnote Search-Note
Set-Alias bug Analyze-Bug
Set-Alias cwd Copy-Cwd
Set-Alias mkin Go-Mkdir
Set-Alias rmdir Remove-Dir

Set-Alias open Open-Item

Set-Alias l dir
Set-Alias vim D:\DevTools\neovim\bin\nvim
Set-Alias vi D:\DevTools\gvim\Vim\vim91\vim.exe
Set-Alias rg D:\DevTools\ripgrep\rg.exe
Set-Alias .. Up-Folder

# Elixir command alias
Set-Alias elx iex.bat

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
$env:PYTHONUTF8 = 1
$env:HTTP_PROXY = 'http://user:password@proxy.com:8080'
$env:HTTPS_PROXY = 'http://user:password@proxy.com:8080'
Set-PSReadLineKeyHandler -Chord Ctrl+r -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert('vim (fzf)')
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}
Set-PSReadLineKeyHandler -Chord Ctrl+u -Function BackwardKillLine
# zoxide config at the end of config file
Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })
