# Copilot2Claude — 反作弊环境兼容方案

## 目标
为 Copilot2Claude 添加一键恢复方案。当 AutoHotkey 被反作弊系统禁用后，用户桌面一键重新启用。

## 当前状态
阶段 1: 研究替代方案 → complete
阶段 2: 实施桌面快捷方式 → complete
阶段 3: 更新文档和 GitHub → in_progress

## 决策记录
- 反作弊系统在游戏进程关闭后不再拦截
- 不需要内核层驱动（太危险且复杂）
- 桌面快捷方式是最简单可靠的恢复方法
