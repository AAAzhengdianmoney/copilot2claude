# Copilot2Claude

**按 Copilot 键一键启动 Claude Code（管理员 Windows Terminal）**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## 是什么

笔记本电脑那个没用的 Copilot 键（右 Alt 右边），现在一键以管理员身份启动 Claude Code。

每次手动开 Claude Code 要 `Win+X → A → 输入 claude → 回车`，或者打开终端再输命令，都很麻烦。有了这个只需按一下 Copilot 键。

## 原理

Copilot 硬件键在固件层面发送三键连发：`左Win + 左Shift + F23`（扫描码 `0x06E`，即 AutoHotkey 中的 `SC06E`）。

AutoHotkey v2 捕获热键 `*SC06E::` 后：
1. 释放被误触的 `LWin` 和 `LShift` 修饰键
2. 通过 `*RunAs` 以管理员身份运行 `launch.bat`
3. `launch.bat` 启动 Windows Terminal (`wt.exe`)，在用户主目录下运行 `claude`

正常工作使用中的 Win 键、`Win+X`、`Win+R` 等组合键完全不受影响。

## 安装

### 1. 安装 AutoHotkey v2

```powershell
winget install -e --id AutoHotkey.AutoHotkey --location D:\AutoHotkey --accept-package-agreements
```

### 2. 克隆项目

```powershell
git clone https://github.com/AAAzhengdianmoney/copilot2claude.git D:\Scripts\copilot2claude
```

### 3. 运行

双击 `ClaudeHotkey.ahk`，或在终端中：

```powershell
D:\AutoHotkey\v2\AutoHotkey64.exe D:\Scripts\copilot2claude\ClaudeHotkey.ahk
```

按 Copilot 键，系统会弹出 **UAC 管理员确认窗口**（这是 Windows 安全机制，属正常行为），点击"是"后即可启动。

### 4. 开机自启

1. 按 `Win+R`，输入 `shell:startup`，回车
2. 右键 → 新建快捷方式
3. 目标：`D:\AutoHotkey\v2\AutoHotkey64.exe D:\Scripts\copilot2claude\ClaudeHotkey.ahk`
4. 确定完成

## 文件结构

```
copilot2claude/
├── ClaudeHotkey.ahk     # AHK 主脚本，捕获 Copilot 键
├── launch.bat           # 通过 Windows Terminal 启动 Claude Code
├── install.ps1          # 一键安装脚本
├── LICENSE              # MIT 许可证
└── README.md            # 本说明文件
```

## 兼容性

### 已验证
| 设备 | 热键 | 状态 |
|------|------|------|
| HP EliteBook (中国版) | `*SC06E::` | ✅ 正常工作 |

### 如果你的电脑无效

有些电脑的 Copilot 键固件行为不同，可能不会单独发 F23 扫描码。这种情况下需要改用组合键写法。

打开 `ClaudeHotkey.ahk`，把第 11 行：
```autohotkey
*SC06E::
```
改成：
```autohotkey
*<+<#F23::
```
保存后双击脚本重新加载即可。

### 如何诊断你的 Copilot 键

用 AutoHotkey 的 KeyHistory 功能查看按键，或临时写一个诊断脚本测试。见 [AutoHotkey 官方文档](https://www.autohotkey.com/docs/v2/lib/KeyHistory.htm)。

## 故障排除

| 问题 | 解决办法 |
|------|----------|
| 按 Copilot 键没反应 | 确认 AutoHotkey 正在运行（系统托盘有绿色 H 图标） |
| 弹出开始菜单而不是终端 | 试试把热键改成 `*<+<#F23::`（见上节） |
| 窗口闪退 | 确认 `launch.bat` 和 `ClaudeHotkey.ahk` 在同一目录下 |
| Win+X 或其他快捷键失灵 | 重启 AutoHotkey 脚本即可恢复 |

## 贡献

欢迎提交 Issue 和 Pull Request。特别欢迎分享你的设备型号和诊断结果，帮助更多用户。

## 许可证

MIT — 详见 [LICENSE](LICENSE) 文件。
