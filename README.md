# Copilot2Claude

**按 Copilot 键一键启动 Claude Code（管理员 Windows Terminal）**

## 是什么

笔记本电脑那个没用的 Copilot 键（右 Alt 右边），现在一键以管理员身份启动 Claude Code。

每次手动开 Claude Code 要 Win+X → A → 输入 claude → 回车，有了这个只需按一下 Copilot 键。

## 原理

Copilot 硬件键发送 `左Win + 左Shift + F23`（扫描码 SC06E）。AutoHotkey v2 用 `*SC06E::` 捕获热键，释放 Win/Shift 修饰键，然后通过 `*RunAs` 以管理员身份调用 Windows Terminal 启动 Claude Code。

## 安装

### 1. 安装 AutoHotkey v2

```powershell
winget install -e --id AutoHotkey.AutoHotkey --location D:\AutoHotkey --accept-package-agreements
```

### 2. 克隆项目

```powershell
git clone https://github.com/AAAzhengdianmoney/copilot2claude.git D:\Scripts\copilot2claude
```

### 3. 启动

双击 `D:\Scripts\copilot2claude\ClaudeHotkey.ahk`，按 Copilot 键测试。

首次使用会弹出 Windows UAC 确认提权，这是正常的。

### 4. 开机自启

`Win+R` → `shell:startup` → 把 `ClaudeHotkey.ahk` 快捷方式拖进去。

## 文件

```
copilot2claude/
├── ClaudeHotkey.ahk     # AHK 主脚本
├── launch.bat            # 管理员 Windows Terminal 启动 Claude Code
├── install.ps1           # 自动安装脚本
└── README.md
```

## 热键说明

| 热键 | 作用 |
|------|------|
| Copilot 键 | 管理员 Windows Terminal 启动 Claude Code |

不影响正常的 Win 键、Win+X 等操作。

## 卸载

1. 启动文件夹删除 `ClaudeHotkey.ahk` 快捷方式
2. 右键系统托盘 AutoHotkey 图标 → Exit
3. 删除 `D:\Scripts\copilot2claude`

## 许可证

MIT
