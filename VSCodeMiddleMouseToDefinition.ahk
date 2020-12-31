#NoTrayIcon
#SingleInstance,Force
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
return InStr(Title, "Visual Studio Code")
}