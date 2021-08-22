#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#NoTrayIcon
#SingleInstance,Force
; #Warn  ; Enable warnings to assist with detecting common errors.
; =========================

EnvGet, UserProfile, userprofile

#t::
	Send {WIN up}
	Send {T up} 

	Path := GetActiveExplorerPath()
	If InStr(Path, "::") {
		Path:= false
	}

	if %Path% {
		Run wt -d "%Path%"
	} Else {
		if WinActive("ahk_exe sublime_text.exe") {
			Send !t
			return
		}
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
