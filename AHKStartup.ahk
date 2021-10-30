#NoEnv
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; #NoTrayIcon
#SingleInstance,Force
; #Warn  ; Enable warnings to assist with detecting common errors.
; ^ - ctrl
; + - shift
; ! - alt
; # - win
; =========================

RunAll()

; ctrl+win+f11
^#f11::RunAll()
; ctrl+win+f12
^#f12::ExitAll()
; ctrl+win+alt+f12
^#!f12::ExitApp

RunAll() {	
	Run VSCodeDoubleShift.ahk
	Run VSCodeMiddleMouseToDefinition.ahk
	Run *RunAs TerminalWinT.ahk
}

; Exists all scripsts except this one
ExitAll() {
	DetectHiddenWindows, % ( ( DHW:=A_DetectHiddenWindows ) + 0 ) . "On"
	WinGet, L, List, ahk_class AutoHotkey

	Loop %L% {
		If ( L%A_Index% <> WinExist( A_ScriptFullPath " ahk_class AutoHotkey" ) ) {
			PostMessage, 0x111, 65405, 0,, % "ahk_id " L%A_Index%
		}
	}

	DetectHiddenWindows, %DHW% ; reset to default
}
