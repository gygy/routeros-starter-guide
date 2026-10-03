# 贡献说明

## 写什么

- 原理 + RouterOS v7 实现 + 实验，不要只交命令列表。
- 课文使用 [docs/_template.md](docs/_template.md) 的 14 节结构。
- Lab 放在 `labs/`：`README.md`、`*.rsc`、`troubleshooting.md`、拓扑图。
- **完整设备配置**进 `configs/`，**功能脚本**进 `scripts/`，不要混放。

## 不要做什么

- 不要按 `/ip`、`/routing` 菜单堆文档顶层目录。
- 不要把 v6 OSPF/BGP/filter 语法直接当作 v7 正文。
- 不要提交密钥、备份口令、真实公网地址、真实 MAC、个人昵称或客户配置。
- 账户/密码只用 `ISP_USER` / `ISP_PASS` / `********`；公网地址用 `192.0.2.0/24`、`203.0.113.0/24`；MAC 用 `00:11:22:33:44:55`。
- 截图、配图入库前：脱敏后打 **一处** 半透明水印 `RouterOS 入门与精通`，位置在 **内容区右上角**（避开关闭按钮）。可用 `automation/protect-media.ps1`。

## 提交

中文说明学习价值：为什么改，对应哪一章或哪个 Lab。
