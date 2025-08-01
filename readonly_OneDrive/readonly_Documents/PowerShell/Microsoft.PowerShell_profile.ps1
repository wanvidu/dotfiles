# Ctrl + t - Search file and folders
# Alt + c - Search folders

# Ctrl + r - Search history

# Alt + f - Complete suggestion word by word
# Ctrl + l - clear screen
# F2 - toggle autosuggestion view

# c - clear

# prg - rigrep

# History Path

# C:\Users\wanvi\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt

#----------------------------------------------

Set-PSReadLineOption –HistoryNoDuplicates:$True
Set-PSReadLineOption –MaximumHistoryCount:100000

# Reverse Search
# Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-PSReadLineKeyHandler -Chord "Alt+f" -Function ForwardWord

Set-PSReadLineOption -PredictionViewStyle ListView

# $ENV:STARSHIP_CONFIG = "$HOME\.config\starship.toml"

Invoke-Expression (&starship init powershell)

Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })

#---------------------------------------
# https://github.com/kelleyma49/PSFzf

# Install-Module -Name PSFzf

# replace 'Ctrl+t' and 'Ctrl+r' with your preferred bindings:
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

# 'Alt+c' - Search folders
$commandOverride = [ScriptBlock]{ param($Location) Write-Host $Location }
# pass your override to PSFzf:
Set-PsFzfOption -AltCCommand $commandOverride

# Tab completion 
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

# <command> **<Tab> for following items. 
# 	git, Get-Service, Start-Service, Stop-Service, Get-Process, Start-Process

# rigrep file content
function prg {
    Invoke-PsFzfRipgrep
}

#---------------------------------------

function y {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp -Encoding UTF8
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath ([System.IO.Path]::GetFullPath($cwd))
    }
    Remove-Item -Path $tmp
}

function cvim {
    $Env:NVIM_APPNAME = 'nvim-distro\nvchad'
    nvim .
    $Env:NVIM_APPNAME = $null
}

function avim {
    $Env:NVIM_APPNAME = 'nvim-distro\astrovim'
    nvim .
    $Env:NVIM_APPNAME = $null
}

function nnvim {
    $Env:NVIM_APPNAME = 'nvim-distro\normalnvim'
    nvim .
    $Env:NVIM_APPNAME = $null
}

function kvim {
    $Env:NVIM_APPNAME = 'nvim-distro\kickstartnvim'
    nvim .
    $Env:NVIM_APPNAME = $null
}

function which($name)
{
    Get-Command $name | Select-Object -ExpandProperty Definition
}

Set-Alias -Name c -Value clear

# =============================================================================
#
# Utility functions for zoxide.
#

# Call zoxide binary, returning the output as UTF-8.
function global:__zoxide_bin {
    $encoding = [Console]::OutputEncoding
    try {
        [Console]::OutputEncoding = [System.Text.Utf8Encoding]::new()
        $result = zoxide @args
        return $result
    } finally {
        [Console]::OutputEncoding = $encoding
    }
}

# pwd based on zoxide's format.
function global:__zoxide_pwd {
    $cwd = Get-Location
    if ($cwd.Provider.Name -eq "FileSystem") {
        $cwd.ProviderPath
    }
}

# cd + custom logic based on the value of _ZO_ECHO.
function global:__zoxide_cd($dir, $literal) {
    $dir = if ($literal) {
        Set-Location -LiteralPath $dir -Passthru -ErrorAction Stop
    } else {
        if ($dir -eq '-' -and ($PSVersionTable.PSVersion -lt 6.1)) {
            Write-Error "cd - is not supported below PowerShell 6.1. Please upgrade your version of PowerShell."
        }
        elseif ($dir -eq '+' -and ($PSVersionTable.PSVersion -lt 6.2)) {
            Write-Error "cd + is not supported below PowerShell 6.2. Please upgrade your version of PowerShell."
        }
        else {
            Set-Location -Path $dir -Passthru -ErrorAction Stop
        }
    }
}

# =============================================================================
#
# Hook configuration for zoxide.
#

# Hook to add new entries to the database.
$global:__zoxide_oldpwd = __zoxide_pwd
function global:__zoxide_hook {
    $result = __zoxide_pwd
    if ($result -ne $global:__zoxide_oldpwd) {
        if ($null -ne $result) {
            zoxide add "--" $result
        }
        $global:__zoxide_oldpwd = $result
    }
}

# Initialize hook.
$global:__zoxide_hooked = (Get-Variable __zoxide_hooked -ErrorAction SilentlyContinue -ValueOnly)
if ($global:__zoxide_hooked -ne 1) {
    $global:__zoxide_hooked = 1
    $global:__zoxide_prompt_old = $function:prompt

    function global:prompt {
        if ($null -ne $__zoxide_prompt_old) {
            & $__zoxide_prompt_old
        }
        $null = __zoxide_hook
    }
}

# =============================================================================
#
# When using zoxide with --no-cmd, alias these internal functions as desired.
#

# Jump to a directory using only keywords.
function global:__zoxide_z {
    if ($args.Length -eq 0) {
        __zoxide_cd ~ $true
    }
    elseif ($args.Length -eq 1 -and ($args[0] -eq '-' -or $args[0] -eq '+')) {
        __zoxide_cd $args[0] $false
    }
    elseif ($args.Length -eq 1 -and (Test-Path $args[0] -PathType Container)) {
        __zoxide_cd $args[0] $true
    }
    else {
        $result = __zoxide_pwd
        if ($null -ne $result) {
            $result = __zoxide_bin query --exclude $result "--" @args
        }
        else {
            $result = __zoxide_bin query "--" @args
        }
        if ($LASTEXITCODE -eq 0) {
            __zoxide_cd $result $true
        }
    }
}

# Jump to a directory using interactive search.
function global:__zoxide_zi {
    $result = __zoxide_bin query -i "--" @args
    if ($LASTEXITCODE -eq 0) {
        __zoxide_cd $result $true
    }
}

# =============================================================================
#
# Commands for zoxide. Disable these using --no-cmd.
#

Set-Alias -Name z -Value __zoxide_z -Option AllScope -Scope Global -Force
Set-Alias -Name zi -Value __zoxide_zi -Option AllScope -Scope Global -Force

# =============================================================================
#
# To initialize zoxide, add this to your configuration (find it by running
# `echo $profile` in PowerShell):
#
# Invoke-Expression (& { (zoxide init powershell | Out-String) })
