# Copilot2Claude 自动安装脚本
# PowerShell: Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

Write-Host "=== Copilot2Claude 安装 ===" -ForegroundColor Cyan

$InstallDir = "D:\Scripts\copilot2claude"
$AHKPath = "D:\AutoHotkey\v2\AutoHotkey64.exe"

# 1. 目录
Write-Host "[1/5] 创建目录: $InstallDir"
New-Item -ItemType Directory -Force -Path $InstallDir | Out-Null

# 2. 复制文件
Write-Host "[2/5] 复制文件..."
Copy-Item -Force "$PSScriptRoot\ClaudeHotkey.ahk" "$InstallDir\"
Copy-Item -Force "$PSScriptRoot\setup.bat" "$InstallDir\"

# 3. 计划任务（提权）
Write-Host "[3/5] 创建管理员计划任务..."
schtasks /delete /tn "Copilot2Claude" /f 2>$null
schtasks /create /tn "Copilot2Claude" /tr "wt.exe -d $env:USERPROFILE powershell -NoExit -Command claude" /sc ondemand /rl highest /f | Out-Null

# 4. 开机自启
Write-Host "[4/5] 设置开机自启..."
$WshShell = New-Object -ComObject WScript.Shell
$Startup = [Environment]::GetFolderPath("Startup")
$Shortcut = $WshShell.CreateShortcut("$Startup\ClaudeHotkey.lnk")
$Shortcut.TargetPath = $AHKPath
$Shortcut.Arguments = "$InstallDir\ClaudeHotkey.ahk"
$Shortcut.WorkingDirectory = $InstallDir
$Shortcut.Save()

# 5. 启动
Write-Host "[5/5] 启动..."
if (Test-Path $AHKPath) {
    Start-Process $AHKPath -ArgumentList "$InstallDir\ClaudeHotkey.ahk"
    Write-Host "`n✓ 完成！按 Copilot 键试试" -ForegroundColor Green
} else {
    Write-Host "`n⚠ 请先安装 AutoHotkey v2" -ForegroundColor Red
}
