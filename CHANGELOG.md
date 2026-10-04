# Changelog

## Unreleased

- 只有仓库根保留 `README.md`；其余索引改为 `00-目录.md`，Lab 正文改为与文件夹同号的 md。

- 首页去掉导读腔（「先从下面几篇」「全部课文」「不要一上来 import」），直接列链接。

- 已按新技能刷新课文示意图：56 课 `00-原理.png`（network-v1-diagram 深蓝插画）；NAT/VPN/防火墙改写等课另附 `00-包变形.png`。
- 示意图按 `network-v1-diagram` / `packet-flow-diagram`：本课 `00-原理.png`（及需要时的 `00-包变形.png`），不再手搓另一套扁平 SVG 当主图。
- 图注从 **图(1)** 起编，禁止图(0)；原理图文件名仍可为 `00-原理.png`。
- 图注改为课文里图片下一行居中文字，去掉画进 PNG/SVG 的同色底栏。
- 技能与全文：课文去掉「管理工具 / 官方依据」；图底居中「图(N) 说明」；红框标菜单与字段并带标签；禁止白块打码；常见问题只保留容易忽略的具体坑。
- 技能改为「一个完整功能及配置过程 = 一份教程」；补齐 IKEv2/SSTP/OpenVPN/L2TP/ZeroTier/WireGuard 回家、端口敲门、安全加固、IPv6、HTTPS、DHCP Option 分流、端口映射与回流、SSH 密钥登录。ZeroTier 官方仅 ARM/ARM64，x86 实验机不可实配。
- 删除全部「待写」14 节原理提纲（163 篇）及空壳 topologies/glossary/labs troubleshooting；只保留可跟做实战课文；同步各章 README 与 COURSE-TREE。
- 实战课文复检清零：72 课结构/CLI/配图齐全，高优先级问题 0；每课配图唯一戳记，Identity 用真机对话框，NAT/Routes/Filter 等用已验证真窗。
- cookbook 对照课（双 WAN/WG 远程/排错/两地 IPsec、pppoe-dial）补齐两步并脱敏。
- 在 x86/901 实配验证实战课表：Identity=R1、bridge/LAN/DHCP/DNS、NAT、Filter、WireGuard、VLAN、备份与服务收紧；课文按实配重写并换真机图。
- 901 真机 WinBox 菜单图替换各课共用主窗口图（脱敏 MAC/实验室 IP/软件 ID）；唯一截图哈希显著增加。
- 实战课表已铺开：基础/上网/防火墙/VPN/监控等短课文（见 docs/实战课表.md）。
- 实战课文改为七段模板（WinBox 一步一图 + 文末 CLI）；技能 `ros-beginner-tutorial` 同步。
- 目录按家庭/个人常用功能重排：DHCP/NAT/防火墙/无线/VPN 在前；课文与 Lab 文件加序号。
- 面向初学者：README 改为「本周路径」；补环境准备课文、Lab 00、PPPoE 实验；每章/Labs 增加索引与课文对照表。
- 建立 v7 课程仓骨架：docs / labs / configs / scripts / automation 闭环。
- 课文统一 14 节模板；Lab 01–15 占位。
