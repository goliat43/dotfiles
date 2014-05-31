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
;Media player stuff (DESK0042 SPECIAL)
;-----------------------------------
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
