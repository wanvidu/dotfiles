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
; Insert::
Volume_Mute::
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
; Volume_Mute::
; {
;   Global toggleAppSwitchMode 
;   toggleAppSwitchMode := !toggleAppSwitchMode
;
; 	if(toggleAppSwitchMode)
;   {
; 	  TrayTip "App Switch Shortcut", "Switch between all apps enabled"
; 	}
; 	else
; 	{
; 	  TrayTip "App Switch Shortcut", "Switch between windows of the same app enabled"
; 	}
; }

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

; ==============================
; Premium Volume OSD (Smooth + Fade + Icons)
; ==============================

global CurrentVol := Round(SoundGetVolume())
global AnimTimer := 0
global FadeOutTimer := 0
global IsVisible := false

; Create OSD GUI
global VolumeOSD := Gui("+AlwaysOnTop -Caption +ToolWindow")
VolumeOSD.BackColor := "1E40AF"
VolumeOSD.SetFont("s26 cWhite Bold", "Segoe UI")

; Icon + Text
global VolText := VolumeOSD.Add("Text", "Center +0x200 w300 h50")

; Progress bar
global VolBar := VolumeOSD.Add("Progress", "w300 h20 BackgroundBlack cWhite Range0-100")

; Alt + Scroll Up → Volume Up
!WheelUp::AdjustVolume(2)
; Alt + Scroll Down → Volume Down
!WheelDown::AdjustVolume(-2)

AdjustVolume(Amount) {
    global CurrentVol
    newVol := Round(SoundGetVolume() + Amount)
    newVol := Max(0, Min(100, newVol))
    SoundSetVolume(newVol)
    AnimateOSD(CurrentVol, newVol)
    CurrentVol := newVol
}

AnimateOSD(oldVol, newVol) {
    global AnimTimer
    if (AnimTimer) {
        SetTimer(AnimTimer, 0) ; Stop old animation
    }
    steps := 10
    stepValue := (newVol - oldVol) / steps
    i := 0
    AnimTimer := (*) => (
        i++,
        UpdateOSD(Round(oldVol + stepValue * i)),
        (i >= steps) ? SetTimer(AnimTimer, 0) : ""
    )
    SetTimer(AnimTimer, 15)
}

UpdateOSD(vol) {
    global IsVisible, FadeOutTimer

    ; Color
    VolumeOSD.BackColor := (vol > 66) ? "22C55E" : (vol > 33) ? "FFA500" : "EF4444"

    ; Icon
    icon := (vol = 0) ? "🔇" : (vol <= 33) ? "🔈" : (vol <= 66) ? "🔉" : "🔊"

    VolText.Value := icon " " vol "%"
    VolBar.Value := vol

    ; Show instantly if already visible, else fade-in
    VolumeOSD.Show("AutoSize NoActivate")
    x := y := w := h := 0
    WinGetPos &x, &y, &w, &h, VolumeOSD.Hwnd
    gx := Round((A_ScreenWidth - w) / 2)
    gy := Round(A_ScreenHeight * 0.8 - h / 2)
    VolumeOSD.Move(gx, gy)
    ApplyRoundedCorners(VolumeOSD.Hwnd, w, h, 20)

    if (!IsVisible) {
        FadeWindow(VolumeOSD.Hwnd, 0, 255, 200)  ; First time fade-in
        IsVisible := true
    }

    ; Reset fade-out timer
    if (FadeOutTimer) {
        SetTimer(FadeOutTimer, 0)  ; Stop old fade-out
    }
    FadeOutTimer := (*) => FadeOut()
    SetTimer(FadeOutTimer, -1500) ; Restart fade-out delay
}

FadeOut() {
    global IsVisible
    FadeWindow(VolumeOSD.Hwnd, 255, 0, 200)
    IsVisible := false
}

; ===== Helper: Rounded Corners =====
ApplyRoundedCorners(hwnd, w, h, r) {
    hRgn := DllCall("CreateRoundRectRgn", "int", 0, "int", 0, "int", w, "int", h, "int", r, "int", r, "ptr")
    DllCall("SetWindowRgn", "ptr", hwnd, "ptr", hRgn, "int", true)
}

; ===== Helper: Fade Effect =====
FadeWindow(hwnd, start, end, duration) {
    steps := 20
    diff := (end - start) / steps
    i := 0
    SetTimer(() => (
        i++,
        DllCall("SetLayeredWindowAttributes", "ptr", hwnd, "uint", 0, "uchar", Round(start + diff * i), "uint", 2),
        (i >= steps) ? SetTimer(, 0) : ""
    ), duration / steps)
    WinSetTransparent start, hwnd
    WinSetExStyle "+0x80000", hwnd ; WS_EX_LAYERED
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
