#Requires AutoHotkey v2.0
#SingleInstance Force

; Copilot2Claude
; 按 Copilot 键 → 管理员 Windows Terminal 启动 Claude Code
; GitHub: https://github.com/AAAzhengdianmoney/copilot2claude
;
; 你的电脑 Copilot 键发送 F23 扫描码 (SC06E)
; 不同电脑可能不同，如果无效可以试 *<+<#F23::

*SC06E::
{
    Send("{Blind}{LWin Up}{LShift Up}")
    Run('*RunAs ' . A_ScriptDir . '\launch.bat')
}
