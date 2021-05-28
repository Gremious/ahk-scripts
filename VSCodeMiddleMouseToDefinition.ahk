#NoEnv
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#NoTrayIcon
#SingleInstance,Force
; #Warn  ; Enable warnings to assist with detecting common errors.
; =========================

$MButton::
    goto_definition() {
        toolbarHeight := 87
        MouseGetPos, xpos, ypos
        if (IsVSCode() && ypos >= toolbarHeight) {
            Send {LButton}
            Send {F12}
        } else {
            Send, {MButton}
        }
    }
return

IsVSCode()
{
    WinGetActiveTitle, Title
    return !InStr(Title, " Mozilla Firefox") and InStr(Title, "Visual Studio Code")
}
