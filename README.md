# Copilot2Claude

**按 Copilot 键 → 管理员 Windows Terminal 启动 Claude Code（无 UAC 弹窗）**

## 原理

Copilot 硬件键发送 `左Win + 左Shift + F23`，用 AutoHotkey v2 捕获后，通过 Windows 计划任务提权，启动管理员 Windows Terminal 运行 Claude Code。

## 安装

### 1. 安装 AutoHotkey v2

```powershell
winget install -e --id AutoHotkey.AutoHotkey --location D:\AutoHotkey --accept-package-agreements
```

### 2. 克隆项目

```powershell
git clone https://github.com/AAAzhengdianmoney/copilot2claude.git D:\Scripts\copilot2claude
```

### 3. 设置计划任务（只需一次，从此不弹 UAC）

右键 `setup.bat` → **以管理员身份运行**

### 4. 启动

双击 `ClaudeHotkey.ahk`，按 Copilot 键测试。

### 5. 开机自启

`Win + R` → `shell:startup` → 把 `ClaudeHotkey.ahk` 快捷方式丢进去。

## 文件

```
copilot2claude/
├── ClaudeHotkey.ahk     # AHK 主脚本
├── setup.bat            # 创建管理员计划任务（以管理员运行一次）
├── install.ps1          # 自动安装脚本
└── README.md
```

## 卸载

1. 启动文件夹删除快捷方式
2. `schtasks /delete /tn "Copilot2Claude" /f`
3. 删除 `D:\Scripts\copilot2claude`

## 许可证

MIT
