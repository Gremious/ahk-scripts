#NoEnv
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#NoTrayIcon
#SingleInstance,Force
; #Warn  ; Enable warnings to assist with detecting common errors.
; =========================

SetTitleMatchMode, 2 
GroupAdd Editor, - Visual Studio Code
return

#IfWInActive, ahk_group Editor
lastShift := 0
$Shift::
if ((A_TickCount - lastShift) <= 250) {
    Send ^+p ; or use ^p for QuickOpen
} else {
    Send {Shift}
}
lastShift := A_TickCount
return
