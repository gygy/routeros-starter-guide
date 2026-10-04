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
| SSTP / OpenVPN / L2TP | SSTP, OpenVPN, L2TP |
| ZeroTier | ZeroTier（ARM/ARM64 extra package） |
| 证书 / HTTPS / www-ssl | Certificates, Services |
| IPv6 | IPv6 Address, IPv6 Settings |
| DHCP Option / 121 | DHCP Server option |
| SSH 公钥 | SSH, user ssh-keys |
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
docs/03-DHCP与DNS(dhcp-dns)/00-目录.md
```

**只有仓库根可以有 `README.md`。** 章索引、labs 总表用 `00-目录.md`。单个 Lab 用 `labs/00-环境准备(getting-started)/00-环境准备.md`。

默认生成顺序（未点名主题时，一次一个**完整场景**）：

1. 第一次连上（WinBox/MAC + 改名 + 改密）
2. 家里有线网（桥 + LAN 地址）
3. 电脑自动拿地址（DHCP + DNS）
4. 上网：PPPoE 或 DHCP WAN 或固定 IP（含 masquerade）
5. 家里防火墙
6. WireGuard 回家 / IKEv2 回家（各含客户端）
7. 端口映射与回流、安全加固、HTTPS、SSH 密钥、端口敲门
8. 其余按「场景课表」

## 场景课表（目录只列这些）

刷新 `00-目录.md` / `实战课表.md` / `COURSE-TREE.md` 时以本表为准。半成品文件夹删掉。

| 场景 | 落盘 |
| --- | --- |
| 环境准备 | `00-入门(introduction)/00-环境准备.md` |
| 第一次连上并改名改密 | `00-入门(introduction)/01-连接路由器/` |
| 备份 | `00-入门(introduction)/05-备份/` |
| 升级 | `00-入门(introduction)/06-升级RouterOS/` |
| 地址网关 DNS 是什么 | `01-网络基础(networking-basics)/00-本周必读.md` |
| ARP | `01-网络基础(networking-basics)/01-ARP/` |
| 家里有线网 | `02-RouterOS基础(routeros-basics)/02-Bridge/` 与 `03-IP地址/` 应合成一课；目录只留合成后的那份 |
| IPv6 | `02-RouterOS基础(routeros-basics)/04-配置IPv6/` |
| 电脑自动拿地址 | `03-DHCP与DNS(dhcp-dns)/01-DHCP服务器/`（含 DNS） |
| Option 分流 | `03-DHCP与DNS(dhcp-dns)/04-DHCP-Option分流/` |
| PPPoE 上网 | `04-NAT(nat)/01-WAN拨号PPPoE/`（含 masquerade） |
| 固定 IP 上网 | `04-NAT(nat)/02-固定IP上网/`（含 masquerade） |
| DHCP 上网 | `04-NAT(nat)/03-DHCP获取公网IP/`（含 masquerade） |
| 端口映射与回流 | `04-NAT(nat)/08-端口映射与回流/` |
| 1 对 1 NAT | `04-NAT(nat)/06-1对1NAT/` |
| NAT 不通 | `04-NAT(nat)/07-NAT排错/` |
| 家里防火墙 | `05-防火墙(firewall)/` 合成一课 |
| 端口敲门 | `05-防火墙(firewall)/08-端口敲门/` |
| 家里 Wi-Fi / 访客 / CAPsMAN | `06-无线(wireless)/` 三课 |
| WireGuard 回家 | `07-VPN(vpn)/01-WireGuard/` |
| WireGuard 两地 | `07-VPN(vpn)/04-WireGuard站点到站点/` |
| IKEv2 回家 | `07-VPN(vpn)/11-IKEv2回家/` |
| IPsec 两地 | `07-VPN(vpn)/09-IPsec站点到站点/` |
| SSTP / OpenVPN / L2TP / ZeroTier | `07-VPN(vpn)/12`～`15` |
| VPN 连不上 | `07-VPN(vpn)/10-VPN排错/` |
| 限一台 / 限网段 | `08-QoS(qos)/` |
| 双 WAN | `09-高可用(high-availability)/01-双WAN/` |
| 家里 VLAN | `10-二层交换(switching)/` 合成一课（建 VLAN + Access + Trunk + 互通） |
| 去某网段怎么走 | `11-三层路由(routing)/02-添加静态路由/`（含默认路由） |
| 指定流量走另一条线 | `11-三层路由(routing)/04-策略路由/` |
| 多路由表 | `11-三层路由(routing)/05-多路由表/` |
| 网络不通 | `14-故障排查(troubleshooting)/01-网络故障排查流程/`（含 ping/Torch/日志） |
| 安全加固 | `13-安全(security)/05-安全加固/` |
| 开启 HTTPS | `13-安全(security)/06-开启HTTPS/` |
| SSH 密钥登录 | `13-安全(security)/07-SSH密钥登录/` |
| FastTrack | `15-性能优化(performance)/01-FastTrack/` |
| 定时备份 / Netwatch | `16-自动化(automation)/` |
| 备份文件 / 导出恢复 / 出厂 / Netinstall | `17-生产环境(production)/` |
| OSPF / BGP / LDP / RoMON / VRF | 对应 18～20 章已有完整场景课 |

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

## 真机 WinBox 截图

禁止 AI 生成图。流程：

1. 读 `lab-env.local.md`，把实验机改成教程占位数据后再截（R1、示例网段；密码框圆点）。
2. 做到该步画面，截 **这一步的 WinBox 窗口**（菜单名必须对得上步骤）。
3. 红框紧贴本步要点的菜单名、输入框或表格行。标签在框外。不要白矩形，不要把 Firewall 画到登录锁图标上。
4. **图注写在 md 里图片正下方居中**（`<p align="center">图(N) …</p>`），**N 从 1 起编、禁止图(0)**。原理图文件名可以是 `00-原理.png`，图注仍是图(1)。不要画进 PNG。
5. 存到本课 `images/01-短中文.png`。

截不到真机就停，不要用 GenerateImage 顶替 WinBox。登录步截 Neighbors 列表和 Connect/Login/Password **原控件**，不要盖白底、不要标本窗没有的菜单。

**只截 x86 901。** 地址带 `:5009` 的窗口一律作废。

## 拓扑 / 原理图

VPN、NAT、防火墙路径、VLAN、DHCP Option、双 WAN 等课：先读并执行 **`network-v1-diagram`**（A：整体原理，深蓝插画）和需要时的 **`packet-flow-diagram`**（B：①～⑤ 包变形 Mermaid PNG）。

落盘到本课目录，不要写到技能仓：

- `images/00-原理.png` — A 类
- `images/00-包变形.png` — B 类（地址/端口会改写时必配）

WinBox 假界面仍禁止 AI。读者课文不要写那两套技能的风格说明。图注规则同上。已有 `00-原理.svg` 重画时换成上述 PNG。

## 文风

读者只看步骤，不看你怎么规划课。

- 像人说话：点哪个菜单、填哪个框。
- 步骤标题用动词。
- 不写「众所周知」「轻松掌握」「本节将」「骨架」「可跟做」「短操作课」「先从下面几篇做起」「全部课文」「不要一上来 import」。
- 不把一课写成参数列表。
- 不把技能名、实验机编号、官方依据、以及「不要贴进仓库 / 写进文档」写进课文。
