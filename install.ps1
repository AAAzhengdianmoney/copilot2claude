# Copilot2Claude 自动安装脚本
# 以管理员身份运行此脚本
# PowerShell: Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

Write-Host "=== Copilot2Claude 安装 ===" -ForegroundColor Cyan

$InstallDir = "D:\Scripts\copilot2claude"
$AHKPath = "D:\AutoHotkey\v2\AutoHotkey64.exe"
$Desktop = [Environment]::GetFolderPath("Desktop")

# 1. 创建安装目录
Write-Host "[1/4] 创建目录: $InstallDir"
New-Item -ItemType Directory -Force -Path $InstallDir | Out-Null

# 2. 复制文件
Write-Host "[2/4] 复制脚本文件..."
Copy-Item -Force "$PSScriptRoot\ClaudeHotkey.ahk" "$InstallDir\ClaudeHotkey.ahk"
Copy-Item -Force "$PSScriptRoot\launch.bat" "$InstallDir\launch.bat"

# 3. 设置开机自启
Write-Host "[3/4] 设置开机自启..."
$WshShell = New-Object -ComObject WScript.Shell
$Startup = [Environment]::GetFolderPath("Startup")
$Shortcut = $WshShell.CreateShortcut("$Startup\ClaudeHotkey.lnk")
$Shortcut.TargetPath = $AHKPath
$Shortcut.Arguments = "$InstallDir\ClaudeHotkey.ahk"
$Shortcut.WorkingDirectory = $InstallDir
$Shortcut.Description = "Copilot2Claude - 按 Copilot 键启动 Claude Code"
$Shortcut.Save()

# 4. 立即启动
Write-Host "[4/4] 启动 AutoHotkey..."
if (Test-Path $AHKPath) {
    Start-Process $AHKPath -ArgumentList "$InstallDir\ClaudeHotkey.ahk"
    Write-Host ""
    Write-Host "✓ 安装完成！" -ForegroundColor Green
    Write-Host "  现在按 Copilot 键试试看" -ForegroundColor Yellow
    Write-Host "  如果还没装 AutoHotkey v2，先运行: winget install -e --id AutoHotkey.AutoHotkey" -ForegroundColor Gray
} else {
    Write-Host ""
    Write-Host "⚠ AutoHotkey v2 未找到于: $AHKPath" -ForegroundColor Red
    Write-Host "  请先安装: winget install -e --id AutoHotkey.AutoHotkey --location D:\AutoHotkey --accept-package-agreements" -ForegroundColor Yellow
}
