#NoEnv
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; #NoTrayIcon
#SingleInstance,Force
; #Warn  ; Enable warnings to assist with detecting common errors.
; =========================

EnvGet, UserProfile, userprofile

#t::
	Send {WIN up}
	Send {T up}
	If WinActive("ahk_class CabinetWClass") || WinActive("ahk_class ExploreWClass"){
		WinGetText, data
		Path := RegExMatch(data, "i`am)^Address: \K.*", dir) ? dir : A_Desktop
		Run wt -d %Path%
	} Else {
		Run wt
	}

return