# Copilot2Claude

**按 Copilot 键一键启动 Claude Code（管理员 Windows Terminal）**

## 为什么与是什么
由于我们每次打开部署在终端的Claude Code一般都要按WIN+X，A键与回车，然后输入Claude，对于经常使用Claude Code的使用者来说有些麻烦，
于是我使用了笔记本电脑那个没什么用的 Copilot 键（右alt键的右方）作为一键启动 Claude Code的快捷键。

## 原理

Copilot 键本质是 `左Win + 左Shift + F23` 三键连发。用 AutoHotkey v2 捕获后，拉起管理员 Windows Terminal 运行 Claude Code。

## 安装

### 1. 安装 AutoHotkey v2

```
winget install -e --id AutoHotkey.AutoHotkey --location D:\AutoHotkey --accept-package-agreements
```

### 2. 克隆项目

```
git clone https://github.com/AAAzhengdianmoney/copilot2claude.git D:\Scripts\copilot2claude
```

### 3. 调试运行

双击 `D:\Scripts\copilot2claude\ClaudeHotkey.ahk`，按 Copilot 键测试。

### 4. 开机自启

把 `ClaudeHotkey.ahk` 的快捷方式放入启动文件夹：

按 `Win + R`，输入 `shell:startup`，回车，把 `ClaudeHotkey.ahk` 快捷方式丢进去。

## 文件

```
copilot2claude/
├── ClaudeHotkey.ahk        # AHK 主脚本，捕获 Copilot 键
├── launch.bat              # 提权启动 Windows Terminal + Claude Code
├── install.ps1             # 自动安装脚本
└── README.md               # 本文件
```

## 卸载

删除 `D:\Scripts\copilot2claude` 目录，从启动文件夹删除快捷方式，退出 AutoHotkey 托盘图标。

## 许可证

MIT
