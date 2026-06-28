@echo off
:: Copilot2Claude - 用任务计划程序绕过 UAC
:: 创建计划任务：管理员权限、无 UAC 弹窗

set TASK_NAME=Copilot2Claude
set SCRIPT_DIR=%~dp0

:: 删除旧任务（如果存在）
schtasks /delete /tn "%TASK_NAME%" /f 2>nul

:: 创建新任务 - 最高权限、不弹 UAC
schtasks /create /tn "%TASK_NAME%" ^
    /tr "wt.exe -d C:\Users\M powershell -NoExit -Command claude" ^
    /sc ondemand ^
    /rl highest ^
    /f

echo ✓ 完成！任务 "%TASK_NAME%" 已创建。
echo 现在按 Copilot 键不会再弹 UAC。

:: 运行一次测试
schtasks /run /tn "%TASK_NAME%"
