#Requires AutoHotkey v2.0
#SingleInstance Force

; Copilot2Claude — 无 UAC 弹窗版
; 通过任务计划程序提权，不弹 UAC

*<+<#F23::
{
    Send("{Blind}{LShift Up}{LWin Up}")
    Run('schtasks /run /tn "Copilot2Claude"',, "Hide")
}
