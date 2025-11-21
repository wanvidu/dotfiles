# Ctrl + q - yazi 
#
# Ctrl + z - zoxide

# Ctrl + x - clear screen

# Ctrl + t - Search file and folders
# Alt + c - Search folders

# Alt + f - Complete suggestion word by word
# Ctrl + l - clear screen
# F2 - toggle autosuggestion view

# c - clear

# prg - rigrep

# <command> **<Tab> for following items. 
# 	git, Get-Service, Start-Service, Stop-Service, Get-Process, Start-Process

# History Path

# C:\Users\wanvi\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt

# Find Files

# gci . -filter *.png -file -ea silent -recurse

#----------------------------------------------

$PSReadLineOptions = @{
    EditMode = 'Windows'
    HistoryNoDuplicates = $true
    MaximumHistoryCount  = 10000 
    # Colors = @{
    #     Command = '#87CEEB'  # SkyBlue (pastel)
    #     Parameter = '#98FB98'  # PaleGreen (pastel)
    #     Operator = '#FFB6C1'  # LightPink (pastel)
    #     Variable = '#DDA0DD'  # Plum (pastel)
    #     String = '#FFDAB9'  # PeachPuff (pastel)
    #     Number = '#B0E0E6'  # PowderBlue (pastel)
    #     Type = '#F0E68C'  # Khaki (pastel)
    #     Comment = '#D3D3D3'  # LightGray (pastel)
    #     Keyword = '#8367c7'  # Violet (pastel)
    #     Error = '#FF6347'  # Tomato (keeping it close to red for visibility)
    # }
    PredictionSource = 'HistoryAndPlugin'
    PredictionViewStyle = 'ListView'
    BellStyle = 'None'
}

Set-PSReadLineOption @PSReadLineOptions

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

Set-PSReadLineKeyHandler -Chord Ctrl+q -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert('y')
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

Set-PSReadLineKeyHandler -Chord Ctrl+z -ScriptBlock {
    __zoxide_zi
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

Set-PSReadLineKeyHandler -Chord Ctrl+x -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert('clear')
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

# Path to PSReadLine history
$HistoryFile = (Get-PSReadLineOption).HistorySavePath

# Define cleanup function
function Cleanup-History {
    if (Test-Path $HistoryFile) {
        $lines  = Get-Content $HistoryFile
        $unique = $lines | Select-Object -Unique
        $unique | Set-Content $HistoryFile -Encoding UTF8
    }
}

# Register cleanup on exit
Register-EngineEvent PowerShell.Exiting -Action { Cleanup-History }

# =============================================================================

Invoke-Expression (&starship init powershell)

# https://pixi.sh/latest/installation/
(& pixi completion --shell powershell) | Out-String | Invoke-Expression

Invoke-Expression (& { (zoxide init powershell | Out-String) })

# Play sound on command end
# Save the Starship-defined prompt function
$global:StarshipPrompt = $function:prompt

function prompt {
    # Play a soft WAV sound
    $soundPath = "C:\Windows\Media\Windows Notify Calendar.wav"
    (New-Object System.Media.SoundPlayer $soundPath).Play()

    # Call the original Starship prompt
    & $global:StarshipPrompt
}
