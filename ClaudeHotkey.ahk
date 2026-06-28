#Requires AutoHotkey v2.0
#SingleInstance Force

; Copilot2Claude — 管理员版（无 UAC 弹窗）
; 按 Copilot 键 → 管理员 Windows Terminal + Claude Code
; 依赖: 运行 setup.bat 创建计划任务 "Copilot2Claude"

*<+<#F23::
{
    Send("{Blind}{LShift Up}{LWin Up}")
    Run(A_ComSpec ' /c schtasks /run /tn "Copilot2Claude"', , "Hide")
}
