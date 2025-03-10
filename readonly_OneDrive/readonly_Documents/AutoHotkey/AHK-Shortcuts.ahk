#Requires AutoHotkey v2.0
#SingleInstance force ;only allows once instance and with force replaces old instance

toggleAppSwitchMode := True

RAlt::Send('{LWin down}{Tab}{LWin up}')

XButton1::Send('{LWin down}{Tab}{LWin up}')

XButton2::Send('{LAlt down}{Tab}{LAlt up}')

Insert::
{
	A_Clipboard := ""
	Send('^c')
	Sleep(50)
	ClipWait()
	URL := "https://google.com/search?q=" . StrReplace(A_Clipboard, A_Space, "+")
	Run('firefox.exe ' . URL)
}

; Shift + Insert
+Insert::
{
	A_Clipboard := ""
	Send('^c')
	Sleep(50)
	ClipWait()
	URL := "https://www.youtube.com/results?search_query=" . StrReplace(A_Clipboard, A_Space, "+")
	Run('firefox.exe ' . URL)
}

; Ctrl + Shift + Home
^+Home::
{
	A_Clipboard := ""
	Send('^c')
	Sleep(50)
	ClipWait()
	Run('chrome.exe ' . A_Clipboard)
}

; Ctrl + Shift + PageUp
^+PgUp::
{
	A_Clipboard := ""
	Send('^c')
	Sleep(50)
	ClipWait()
	Run('firefox.exe ' . A_Clipboard)
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

;Volume_Mute::
;{
;	MsgBox('firefox.exe ')
;}

;F3::
;{
;  TrayTip "Title", "Text"
;}
