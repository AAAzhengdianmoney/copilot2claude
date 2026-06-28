@echo off
echo === Copilot2Claude 管理员权限设置 ===
echo.

schtasks /delete /tn "Copilot2Claude" /f 2>nul

schtasks /create /tn "Copilot2Claude" /tr "wt.exe -d C:\Users\M powershell -NoExit -Command claude" /sc ondemand /rl highest /f

if %errorlevel% equ 0 (
    echo [√] 设置成功！
) else (
    echo [X] 失败，请以管理员身份运行此脚本
)

pause
