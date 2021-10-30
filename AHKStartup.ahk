SendMode "Input"
SetWorkingDir A_ScriptDir
#SingleInstance Force
; #NoTrayIcon
; #Warn  ; Enable warnings to assist with detecting common errors.
; =========================

; ctrl+win+f11
^#f11::RunAll()
; ctrl+win+alt+f12
^#!f12::ExitApp

RunAll() {	
	; Run VSCodeDoubleShift.ahk
	; Run VSCodeMiddleMouseToDefinition.ahk

	; Can also do 
	; Run Format("*RunAs {} .\TerminalWinT.ahk", A_AhkPath)
	Run "*RunAs " A_AhkPath " .\TerminalWinT.ahk"
}

RunAll()
