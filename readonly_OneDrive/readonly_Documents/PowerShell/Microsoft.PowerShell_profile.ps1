# Ctrl + z - zoxide

# Ctrl + x - clear screen

# Ctrl + t - Search file and folders
# Alt + c - Search folders

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

#---------------------------------------

Set-Alias -Name c -Value clear

#---------------------------------------

# rigrep file content
function prg {
    Invoke-PsFzfRipgrep
}

function y {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp -Encoding UTF8
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath ([System.IO.Path]::GetFullPath($cwd))
    }
    Remove-Item -Path $tmp
}

function which($name)
{
    Get-Command $name | Select-Object -ExpandProperty Definition
}

Set-PSReadLineKeyHandler -Chord Ctrl+z -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert('zi')
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

Set-PSReadLineKeyHandler -Chord Ctrl+x -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert('clear')
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

# =============================================================================

Invoke-Expression (& { (zoxide init powershell | Out-String) })

#Set-Alias -Name z -Value __zoxide_zi -Option AllScope -Scope Global -Force

Invoke-Expression (&starship init powershell)
