; Runs all the scripts in %UserProfile%\AHK\Scripts\Startup
; and all the scripts in \Admin with elevation

SendMode "Input"
SetWorkingDir EnvGet("UserProfile") "\AHK\Scripts"
#SingleInstance Off
; #NoTrayIcon
#Warn  ; Enable warnings to assist with detecting common errors.
; =========================

; ctrl+win+f11
^#f11::RunAll()
; ctrl+win+alt+f12
^#!f12::ExitApp

RunAll()

; Can also do Run Format("*RunAs {} .\TerminalWinT.ahk", A_AhkPath)
RunAll() {
	if not A_IsAdmin {
		Loop Files ".\Startup\*.ahk" {
			Run A_AhkPath " " A_LoopFileName
		}
		StartAdminInstance()
	} else {
		Loop Files ".\Admin\*.ahk" {
			Run A_AhkPath " " A_LoopFileName
		}
		ExitApp
	}
}

StartAdminInstance() {
	if not A_IsAdmin {
		Run "*RunAs " A_AhkPath " " A_ScriptFullPath
	}	
}
