#Requires AutoHotkey v2.0
#SingleInstance Force

; Copilot2Claude — 按 Copilot 键启动管理员 Claude Code
; Copilot 键 = SC06E (F23 扫描码)

*SC06E::
{
    Send("{Blind}{LWin Up}{LShift Up}")
    Run('*RunAs ' . A_ScriptDir . '\launch.bat')
}
