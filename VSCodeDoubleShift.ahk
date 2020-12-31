#NoTrayIcon
#SingleInstance,Force
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

$MButton::
    goto_definition() {
        toolbarHeight := 110
        MouseGetPos, xpos, ypos
        if (ypos >= toolbarHeight) {
            Send {LButton}
            Send {F12}
        }
}
return