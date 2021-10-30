#NoEnv
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; #NoTrayIcon
#SingleInstance,Force
; #Warn  ; Enable warnings to assist with detecting common errors.
; =========================

#IfWinActive MONSTER HUNTER: WORLD


NumpadDiv::
    Send {r down}{v down}{r up}{v up}
Return
#IfWinActive