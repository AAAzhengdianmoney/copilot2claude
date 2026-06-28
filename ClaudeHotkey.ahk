#Requires AutoHotkey v2.0
#SingleInstance Force

; Copilot2Claude — 管理员版（无 UAC）
*<+<#F23::
{
    Send("{Blind}{LShift Up}{LWin Up}")
    Run('powershell -Command "schtasks.exe /run /tn Copilot2Claude"', , "Hide")
}
