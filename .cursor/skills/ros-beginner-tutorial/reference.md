# 官方文档、课表落盘、菜单对照、截图 Prompt

## 官方文档入口（RouterOS 7）

总览：<https://help.mikrotik.com/docs/spaces/ROS/overview>  
WinBox 与 CLI 对应：<https://help.mikrotik.com/docs/spaces/ROS/pages/328129/WinBox>  
v7 差异：<https://help.mikrotik.com/docs/spaces/RKB/pages/328055/RouterOS+knowledge+base>  
WireGuard：<https://help.mikrotik.com/docs/spaces/ROS/pages/69664792/WireGuard>

写作前 `WebFetch` 核对 URL。引用：页面标题 + 完整链接。只写 v7。

| 主题 | 检索关键词 |
|------|------------|
| 首次连接 / WinBox | First Time Configuration, WinBox, MAC server |
| 身份 / 用户 / 口令 | Identity, Users |
| 备份 / 导出 / 重置 | Backup, Export, Reset Configuration, Netinstall |
| 升级 | Upgrading, RouterOS |
| 接口 / Bridge | Interface, Bridge |
| IP 地址 | IP Addressing |
| DHCP 服务 / 客户端 | DHCP Server, DHCP Client |
| DNS | DNS |
| ARP | ARP |
| PPPoE / WAN | PPPoE Client |
| 路由 | IP Routes, Routing, VRF |
| NAT / masquerade / dstnat | NAT |
| 防火墙 Filter | Firewall Filter, Input, Forward |
| Address List | Address Lists |
| VLAN | VLAN, Bridge VLAN Filtering |
| WireGuard / IPsec / IKEv2 | WireGuard, IPsec |
| NTP | NTP, Clock |
| 服务端口 / SSH | IP Services, SSH |
| Ping / Torch / 抓包 | Ping, Torch, Packet Sniffer, Torch |
| 日志 | Logging |

## 课表（写作大纲）→ 课程仓落盘

用户大纲里的「RouterOS教程/01-基础/…」**不要**在仓库根再建一套。写入已有 `docs/` 章（`编号-中文(英文)`）。一课一个子目录。

| 大纲 | 落盘章 |
|------|--------|
| 01-基础 | `docs/00-入门(introduction)/` |
| 02-网络基础（接口/网桥/地址/DHCP/DNS/ARP） | `docs/02-RouterOS基础(routeros-basics)/`（ARP 可放 `01-网络基础`；DHCP 进阶放 `03-DHCP与DNS`） |
| 03-互联网（拨号/固定 IP/DHCP WAN/NAT/双 WAN） | 拨号：`cookbook/00-home/` 或 `labs/03-PPPoE拨号(pppoe)/` 课文；NAT：`docs/04-NAT(nat)/`；双 WAN：`docs/09-高可用(high-availability)/` |
| 04-路由 | `docs/11-三层路由(routing)/` |
| 05-防火墙 | `docs/05-防火墙(firewall)/` |
| 06-NAT | `docs/04-NAT(nat)/` |
| 07-VLAN | `docs/10-二层交换(switching)/` |
| 08-VPN | `docs/07-VPN(vpn)/` |
| 09-服务 | DNS/DHCP 见上；NTP/WinBox/SSH/远程：`docs/13-安全(security)/` 或 `00-入门` |
| 10-监控与排错 | `docs/12-监控(monitoring)/`、`docs/14-故障排查(troubleshooting)/` |
| 11-备份恢复 | `docs/17-生产环境(production)/` |
| 12-实战案例 | `cookbook/00-home/`、`cookbook/01-office/` |
| 99-附录 | `cheatsheets/` |

课内文件名用 `课号-中文.md`，例如：

```text
docs/03-DHCP与DNS(dhcp-dns)/04-DHCP服务器/04-DHCP服务器.md
docs/03-DHCP与DNS(dhcp-dns)/04-DHCP服务器/images/01-打开DHCP.png
```

默认生成顺序（未点名主题时，一次一课）：

1. 连接路由器  
2. 查看信息 / 改名称 / 改管理员密码  
3. 接口、Bridge、IP 地址  
4. DHCP 服务器、DHCP 客户端、DNS  
5. WAN：PPPoE 或 DHCP 或固定 IP  
6. NAT masquerade  
7. 防火墙 Input / Forward  
8. 备份与导出  
9. WireGuard（家用远程）  
10. 其余按大纲

## WinBox 3 路径 ↔ CLI

| 做什么 | WinBox 左侧 | CLI |
|--------|-------------|-----|
| 邻居 / 登录 | `Neighbors` | （WinBox 连接） |
| 看接口 | `Interfaces` | `/interface/print` |
| 网桥 | `Bridge` | `/interface/bridge` |
| 地址 | `IP` → `Addresses` | `/ip/address` |
| DHCP 客户端 | `IP` → `DHCP Client` | `/ip/dhcp-client` |
| DHCP 服务 | `IP` → `DHCP Server` | `/ip/dhcp-server` |
| DNS | `IP` → `DNS` | `/ip/dns` |
| ARP | `IP` → `ARP` | `/ip/arp` |
| 路由 | `IP` → `Routes` | `/ip/route` |
| NAT | `IP` → `Firewall` → `NAT` | `/ip/firewall/nat` |
| Filter | `IP` → `Firewall` → `Filter Rules` | `/ip/firewall/filter` |
| Address List | `IP` → `Firewall` → `Address Lists` | `/ip/firewall/address-list` |
| 服务端口 | `IP` → `Services` | `/ip/service` |
| 用户 | `System` → `Users` | `/user` |
| 身份 | `System` → `Identity` | `/system/identity` |
| 时钟 / NTP | `System` → `Clock` / `NTP` | `/system/clock` `/system/ntp/client` |
| 备份 | 菜单 `Files` + Backup | `/system/backup/save` |
| 导出 | `New Terminal` | `/export` |
| 升级 | `System` → `Packages` / `Reboot` | `/system/package` |
| WireGuard | `WireGuard` | `/interface/wireguard` |
| 日志 | `Log` | `/log/print` |
| Torch | `Tools` → `Torch` | `/tool/torch` |
| 抓包 | `Tools` → `Packet Sniffer` | `/tool/sniffer` |
| Ping | `Tools` → `Ping` | `/ping` |

对话框：添加用工具栏 `+`，保存 `Apply`/`OK`。

## WinBox 截图 Prompt

`GenerateImage`，`aspect_ratio`: `16:9`，`filename`: `{两位}-{短中文}.png`（不要路径）。

```
Photorealistic screenshot of MikroTik WinBox 3 on Windows desktop.
Classic WinBox UI: dark gray title bar "Winbox ... 192.168.88.1 (admin)",
left navigation tree (Neighbors, Interfaces, Bridge, IP, Routing, System).
Highlighted left-tree item: {tree-path}.
Right pane English labels. Visible fields exactly: {fields-and-values}.
A red rectangle highlighting {click-target} only (one or two controls).
No real public IP, no personal nicknames, MAC if shown is 00:11:22:33:44:55.
Sharp UI text, 16:9, authentic WinBox 3 (not WinBox 4 fluent, not WebFig unless requested).
```

`{tree-path}` 示例：`IP > DHCP Server`。  
`{fields-and-values}` 必须是本步真实值。

生成后拷到该课 `images/`，Markdown 用 `images/01-打开DHCP.png`。

## 真机截图

用户明确要求且本机/SSH 已开：优先实机。仍按 `01-….png` 命名写入该课 `images/`。打学习用水印，脱敏。

## 文风

- 称呼「你」。术语中英并列一次。
- 步骤标题用动词。
- 不写「众所周知」「轻松掌握」。
- 不把一课写成全部参数列表。
