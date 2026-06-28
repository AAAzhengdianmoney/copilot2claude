#Requires AutoHotkey v2.0
#SingleInstance Force

; Copilot2Claude
; 按 Copilot 键 → 管理员 Windows Terminal 启动 Claude Code（无 UAC）
; GitHub: https://github.com/AAAzhengdianmoney/copilot2claude

*SC06E::
{
    Send("{Blind}{LWin Up}{LShift Up}")
    Run('powershell.exe -WindowStyle Hidden -Command "schtasks.exe /run /tn Copilot2Claude"')
}
