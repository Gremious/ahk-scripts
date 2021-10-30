#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; #NoTrayIcon
#SingleInstance,Force
#Warn  ; Enable warnings to assist with detecting common errors.
; https://www.autohotkey.com/boards/viewtopic.php?t=69925
; =========================

EnvGet, UserProfile, userprofile

#t::
	Send {WIN up}
	Send {T up} 

	Path := GetActiveExplorerPath()
	if %Path% {
		Run wt -d "%Path%"
	} Else {
		Run wt
	}

return

GetActiveExplorerPath(hwnd=0) {
	explorerHwnd := WinActive("ahk_class CabinetWClass") | WinActive("ahk_class ExploreWClass")

	if (explorerHwnd) {
		for window in ComObjCreate("Shell.Application").Windows {
			try {
				if (window && window.hwnd && window.hwnd==explorerHwnd)
				return window.Document.Folder.Self.Path
			}
		}
	}

	return false
}
