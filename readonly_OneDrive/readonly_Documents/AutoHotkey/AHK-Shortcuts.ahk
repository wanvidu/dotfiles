#Requires AutoHotkey v2.0
#SingleInstance force ;only allows once instance and with force replaces old instance

toggleAppSwitchMode := True

; Right Alt to switch to the previous window (like Alt+Tab).
; This script differentiates between a short press for app switching
; and a long press for standard AltGr functionality.
RAlt::SwitchApps("RAlt")
XButton1::SwitchApps("XButton1")
XButton2::SwitchApps("XButton2")

SwitchApps(keyName)
{
    ; Wait for the specified key to be released for a maximum of 0.2 seconds.
    if KeyWait(keyName, "T0.2")
    {
        ; If the key is tapped quickly, send the command to switch applications.
        Send("{LWin down}{Tab}{LWin up}")
    }
    else
    {
        ; If the key is held longer, send the key's native press and release.
        ; We build the string for the Send command dynamically using the keyName parameter.
        Send("{Blind}{" . keyName . " Down}")
        KeyWait(keyName)
        Send("{Blind}{" . keyName . " Up}")
    }
}

; Select text and press Insert to search google using Firefox 
Insert::
{
    SearchWith('firefox.exe', "https://google.com/search?q=")
}

; Select text and press Shift + Insert to search youtube using Chrome 
+Insert::
{
    SearchWith('firefox.exe', "https://www.youtube.com/results?search_query=")
}

; Select URL and press Ctrl + Shift + Insert to open URL using Firefox 
^+Insert::
{
    SearchWith('firefox.exe', "")
}

; Select URL and press Ctrl + Shift + Home to open URL using Chrome 
^+Home::
{
    SearchWith('chrome.exe', "")
}

SearchWith(AppName, BaseUrl)
{
    ; Store the current clipboard content
    local SavedClipboard := ClipboardAll()

    ; Clear the clipboard
    A_Clipboard := ""

    ; Copy the selected text to the clipboard
    Send("^c")

    ; Wait for the clipboard to contain data
    if ClipWait(1)
    {
        local SelectedText := A_Clipboard 

        local TargetToRun := "" ; This will hold the final string to be executed.

        ; Check if a BaseURL was provided.
        if (BaseURL = "")
        {
            ; If BaseURL is empty, the target is simply the selected text itself.
            ; No URL encoding is performed.
            TargetToRun := SelectedText
        }
        else
        {
            ; If BaseURL is provided, encode the text for a web search.
            local SearchQuery := UrlEncode(SelectedText)
            TargetToRun := BaseURL . SearchQuery
        }

        ; Run firefox with given URL 
	      Run(AppName . ' "' . TargetToRun . '"')
    }

    Sleep(200)

    ; Restore the original clipboard content
    A_Clipboard := SavedClipboard
}

; Toggle app switch
Volume_Mute::
{
  Global toggleAppSwitchMode 
  toggleAppSwitchMode := !toggleAppSwitchMode
	
	if(toggleAppSwitchMode)
  {
	  TrayTip "App Switch Shortcut", "Switch between all apps enabled"
	}
	else
	{
	  TrayTip "App Switch Shortcut", "Switch between windows of the same app enabled"
	}
}

; Right Click Key
AppsKey::{
  Global toggleAppSwitchMode
  
  if(toggleAppSwitchMode)
  {
    Send('{LAlt down}{Tab}{LAlt up}')
  }
  else
  {
    OldClass := WinGetClass("A")
    ActiveProcessName := WinGetProcessName("A")
    WinClassCount := WinGetCount("ahk_exe" ActiveProcessName)
    IF WinClassCount = 1
        Return
    loop 2 {
      WinMoveBottom("A")
      WinActivate("ahk_exe" ActiveProcessName)
      NewClass := WinGetClass("A")
      if (OldClass != "CabinetWClass" or NewClass = "CabinetWClass")
        break
    }
  }
}

; --- Function to manually encode a string for a URL using StrReplace ---
UrlEncode(TextToEncode) {
    ; Start by replacing the percent sign itself to avoid issues with later replacements.
    NewText := StrReplace(TextToEncode, "%", "%25")
    
    ; Replace common reserved characters.
    NewText := StrReplace(NewText, " ", "%20")
    NewText := StrReplace(NewText, "!", "%21")
    NewText := StrReplace(NewText, "#", "%23")
    NewText := StrReplace(NewText, "$", "%24")
    NewText := StrReplace(NewText, "&", "%26")
    NewText := StrReplace(NewText, "'", "%27")
    NewText := StrReplace(NewText, "(", "%28")
    NewText := StrReplace(NewText, ")", "%29")
    NewText := StrReplace(NewText, "*", "%2A")
    NewText := StrReplace(NewText, "+", "%2B")
    NewText := StrReplace(NewText, ",", "%2C")
    NewText := StrReplace(NewText, "/", "%2F")
    NewText := StrReplace(NewText, ":", "%3A")
    NewText := StrReplace(NewText, ";", "%3B")
    NewText := StrReplace(NewText, "=", "%3D")
    NewText := StrReplace(NewText, "?", "%3F")
    NewText := StrReplace(NewText, "@", "%40")
    NewText := StrReplace(NewText, "[", "%5B")
    NewText := StrReplace(NewText, "]", "%5D")
    
    return NewText
}

;Volume_Mute::
;{
;	MsgBox('firefox.exe ')
;}

;F3::
;{
;  TrayTip "Title", "Text"
;}

; F3::  ; Press F3 to check key history
; {
;     KeyHistory()
; }

; Browser_Search
; Media_Play_Pause
; Media_Prev
; Media_Next
; ScrollLock
; Pause          

; SC000::MsgBox "Fn key pressed!"
