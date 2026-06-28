@echo off
echo === Copilot2Claude Setup ===
echo.

schtasks /delete /tn "Copilot2Claude" /f 2>nul

schtasks /create /tn "Copilot2Claude" /tr "wt.exe -d C:\Users\M powershell -NoExit -Command claude" /sc ondemand /rl highest /f

if %errorlevel% equ 0 (
    echo [OK] Setup done!
) else (
    echo [FAIL] Run this as Administrator
)

pause
