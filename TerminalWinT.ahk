SendMode "Input"
SetWorkingDir EnvGet("UserProfile")
#SingleInstance Force
#NoTrayIcon
; #Warn  ; Enable warnings to assist with detecting common errors.
; =========================

#t::{
	Send "{LWin up}"
	Send "{T up}"

	Path := GetActiveExplorerPath()
	If InStr(Path, "::") {
		Path:= false
	}

	if Path {
		Run "wt -d " Path
	} Else {
		if WinActive("ahk_exe sublime_text.exe") {
			Send "!t"
			return
		}
		Run "wt"
	}
}

GetActiveExplorerPath() {
	explorerHwnd := WinActive("ahk_class CabinetWClass") | WinActive("ahk_class ExploreWClass")

	if (explorerHwnd) {
		for window in ComObject("Shell.Application").Windows {
			try {
				if (window && window.hwnd && window.hwnd==explorerHwnd)
				return window.Document.Folder.Self.Path
			}
		}
	}

	return false
}

; ctrl+win+f12
^#f12::ExitApp
