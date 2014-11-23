;-------------------------------------
;Gerrit copy-paste
;-------------------------------------
#Persistent
return

OnClipboardChange:
if SubStr(clipboard, 1, 9) = "git fetch"
{
	if InStr(clipboard, "gitserver1.orcsoftware.com")
	{
		FixString = %clipboard%
		StringReplace, FixString, FixString,&&,;, All
		clipboard:=FixString
	}
}
return

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
#o::
	Input key, L1
	IfEqual key, p
		Run C:\Orc\Src\OrcTraderPlus\bin\Debug\OTPlusCurrentFlavorEttOt64\OrcTraderPlus.exe
	IfEqual key, o
		Run C:\Orc\Src\OrcTraderPlus\bin\Debug\Contents\Windows\Orc.exe
	IfEqual key, l
		Run C:\Users\niclase.ORC\Documents\orc.log
Return

;-----------------------------------
;^!n::
;IfWinExist Untitled - Notepad
;	WinActivate
;else
;	Run Notepad
;return
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


