#NoEnv
#SingleInstance, Force
; Siema jak to widzisz to bonio z cb. YT: krytyYT
SendMode Input
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 1
SetBatchLines, -1
SetMouseDelay, -1
SetKeyDelay, 0
IniRead, secik5, config.ini, przyciski, key5
Gui Add, Hotkey, x40 y8 w180 h21 vsecik
Gui Add, Text, x10 y6 w25 h23 +0x200, Bind
Gui Add, Button, x3 y35 w226 h33 gGO, &Odpalaj machine
GuiControl, , msctls_hotkey325, %secik5%
Gui Show, w232 h81, Zmiana Seta || YT: krytyYT
Return
GO:
GUI, submit
global x, y, schowek, altowanie, pvp, przerwij
global biegnij, X, Y, Xr, Yr
IniWrite, %secik%, config.ini, Przyciski, key5
hotkey, ~*%secik%, zmianaseta
MAIN()
return
MAIN(){
sleep 5
}
zacznijbiec(){
sleep 10
send w
send {w down}
sleep 20
send {ctrl down}
sleep 50
send {CTRL up}
SetTimer, wchecker, 10
return
}
wchecker(){
if GetKeyState("w","P-")= 0
{
send {w up}
SetTimer, wchecker, off
}
return
}
zmianaseta(){
IfWinnotActive, Minecraft
return
if GetKeyState("w","P-")= 1
{
send {w up}
biegnij = 1
sleep 20
}
BlockInput, On
send e
sleep 40
MouseGetPos, X, Y
X2 := X - 147
Y2 := Y + 18
X3 := X2
Y3 := Y2 - 160
loop 4{
sendinput {click left %X2%, %Y2%}
sendinput {click left %X3%, %Y3%}
sendinput {click left %X2%, %Y2%}
X2 := X2 + 33
Y3 := Y3 + 33
}
sleep 40
send e
BlockInput, Off
if (biegnij = 1)
{
zacznijbiec()
biegnij = 0
}
return
}
PostClick(x,y,win="A") {
lParam := x & 0xFFFF | (y & 0xFFFF) << 16
PostMessage, 0x201, , %lParam%, , %win%
PostMessage, 0x202, , %lParam%, ,  %win%
return
}
type(value){
send {LCTRL UP}
SendInput {CTRL UP}
BlockInput, On
SendInput {/}
sleep 100
SendInput {Blind}%value%{ENTER}
BlockInput, Off
return
}
czekaj(){
MouseGetPos, x, y
Check_x := x + 52
Check_y := y - 149
startTime := A_TickCount
sleep 20
loop {
sleep 2
if A_Cursor != Unknown
return
now := A_TickCount - startTime
if (now > 1000){
przerwij = 1
BlockInput, off
return
}
}
return
}
exit:
exitapp
return
GuiEscape:
GuiClose:
ExitApp