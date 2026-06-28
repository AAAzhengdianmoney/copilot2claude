#Requires AutoHotkey v2.0
#SingleInstance Force

; Copilot2Claude
; 按 Copilot 键 → 管理员 Windows Terminal 启动 Claude Code
; GitHub: https://github.com/AAAzhengdianmoney/copilot2claude

*SC06E::
{
    Send("{Blind}{LWin Up}{LShift Up}")
    Run('*RunAs ' . A_ScriptDir . '\launch.bat')
}
