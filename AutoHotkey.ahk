;-------------------------------------
;Gerrit copy-paste
;-------------------------------------
;#Persistent
;return

;OnClipboardChange:
;if SubStr(clipboard, 1, 9) = "git fetch"
;{
;	if InStr(clipboard, "gitserver1.orcsoftware.com")
;	{
;		FixString = %clipboard%
;		StringReplace, FixString, FixString,&&,;, All
;		clipboard:=FixString
;	}
;}
;return

;-----------------------------------
;Generate GUID
;-----------------------------------
#g::	
	TypeLib := ComObjCreate("Scriptlet.TypeLib")
	NewGUID := TypeLib.Guid
	;MsgBox %NewGUID%
	TmpCB =%ClipBoard%
	ClipBoard = %NewGUID%
	Send ^v
	Sleep, 50
	ClipBoard = %TmpCB%

;-----------------------------------
;Pure key remappings
;-----------------------------------
Capslock::Esc
SC137::AppsKey ; PrintScreen to AppKey

;-----------------------------------
;For semi-vim scrolling
;-----------------------------------
!h:: Send, {Left}
!j:: Send, {Down}
!k:: Send, {Up}
!l:: Send, {Right}

#q:: Run "C:\Program Files (x86)\Vim\gvim.exe"

;-----------------------------------
;Backspace is hard to reach...
;-----------------------------------
#Space:: Send, {Backspace}

;-----------------------------------
;Media player stuff (DESK0042 SPECIAL)
;-----------------------------------
+Media_Play_Pause:: 
Process, Exist, spotify.exe
{
	if ErrorLevel > 0
	{
		;Spotify started already
		WinActivate, ahk_pi %ErrorLevel%
	}
	else
	{
		;Start Spotify
		IfExist, C:\Users\niclase\AppData\Roaming\Spotify\spotify.exe
			Run, C:\Users\niclase\AppData\Roaming\Spotify\spotify.exe
		Return
	}	
}
+Volume_Down::Media_Prev
+Volume_Up::Media_Next


;-----------------------------------
;Change winexplorer to start in c:\
;-----------------------------------
#e::Run c:\

#w::Run C:\ProgramData\Microsoft\Windows\Start Menu\Programs

;-----------------------------------
;Custom startup of OrcTrader
;-----------------------------------
;#o::
;	Input key, L1
;	IfEqual key, p
;		Run C:\Orc\Src\OrcTraderPlus\bin\Debug\OTPlusCurrentFlavorEttOt64\OrcTraderPlus.exe
;	IfEqual key, o
;		Run C:\Orc\Src\OrcTraderPlus\bin\Debug\Contents\Windows\Orc.exe
;	IfEqual key, l
;		Run C:\Users\niclase.ORC\Documents\orc.log
;Return

#o::
	Input key, L1
	IfEqual key, u
		Run C:\Users\Niclas.Eriksson\Desktop\SysMonClient-Local.lnk
	IfEqual key, i
		Run C:\Users\Niclas.Eriksson\Desktop\SysMonClient.lnk
	IfEqual key, o
		Run C:\Users\Niclas.Eriksson\Desktop\IpmOffice.lnk
	IfEqual key, p
		Run C:\Users\Niclas.Eriksson\Desktop\vpc4.rdp
	IfEqual key, n
		Run gvim C:\Users\Niclas.Eriksson\Desktop\notes.txt
Return



;-----------------------------------
;Custom startup of SnippingTool
;-----------------------------------
#s::
	sleep, 150
	Run, C:\Windows\System32\SnippingTool.exe,,, process_id       
    WinWait, ahk_pid %process_id%
    WinActivate, ahk_pid %process_id%
	Clipboard = ; Empty the clipboard
	Sleep, 150 ; Wait for clipboard to empty
	
	Send ^n ; Start new snippet capture
	
	ClipWait, 300, 1
	Sleep, 400
	
	WinWait, ahk_class Microsoft-Windows-Tablet-SnipperEditor
		WinClose
	;WinKill, ahk_exe SnippingTool.exe
	;if ErrorLevel
	;{
;		MsgBox, The attempt to copy text onto the clipboard failed.
;		return
;	}
	
return

;Notepad
;-----------------------------------
;^!n::
;IfWinExist Untitled - Notepad
;	WinActivate
;else
;	Run Notepad
;return
;-----------------------------------

;Everything - Find
;-----------------------------------
#f::
	;IfWinExist, ahk_class EVERYTHING_TASKBAR_NOTIFICATION
	;{
	;	WinActivate
		PostMessage, 1025, 0, 0x0203
	;}
	;else
	;	msgbox, Everything is not open
return

;-----------------------------------

;-----------------------------------
; Add additional clipboards
;-----------------------------------
#c::
	TmpCB =%ClipBoard%    
	Send ^c
	Sleep, 50
	WinCopySave= %ClipBoard%
	ClipBoard = %TmpCB%
Return

#v::
	TmpCB =%ClipBoard%
	ClipBoard = %WinCopySave%
	Send, ^v
	Sleep, 50
	ClipBoard = %TmpCB%
Return

!c::
	TmpCB =%ClipBoard%    
	Send ^c
	Sleep, 50
	WinCopySave= %ClipBoard%
	ClipBoard = %TmpCB%
Return

!v::
	TmpCB =%ClipBoard% ; Store previous ClipBoard Data
	ClipBoard = %WinCopySave%
	Send, ^v
	Sleep, 50
	ClipBoard = %TmpCB%
Return

;-----------------------------------
; Change path of last powershell window.
;-----------------------------------
#p::
	SetKeyDelay, 0
	WinGetActiveTitle, path
	IfWinExist, Administrator: Windows PowerShell
	{	
		WinActivate
		TmpCB = %ClipBoard%
		ClipBoard = %path%

		Sleep, 10
		Send cd{space}
		Send ^v
		Sleep, 10
		Send {enter}		
		ClipBoard = %TmpCb%
	}


