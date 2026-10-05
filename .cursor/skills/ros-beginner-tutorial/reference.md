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

课文 md **文件名必须等于 H1**（去掉 `# `）再加 `.md`。文件夹可保留旧编号。索引仍叫 `00-目录.md`。例如：

```text
docs/04-NAT(nat)/03-DHCP获取公网IP/第 13 课：让 RouterOS 通过 DHCP 接入互联网.md
docs/04-NAT(nat)/03-DHCP获取公网IP/images/01-打开DHCP.png
docs/04-NAT(nat)/00-目录.md
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
课文 H1、**md 文件名**、链接文字必须用「题目」列（文件名 = `第 N 课：` + 题目 + `.md`）。斜杠用全角 `／`。

| 课 | 题目 | 落盘 |
| --- | --- | --- |
| 1 | 让电脑装好 WinBox 并连上实验网 | `00-入门(introduction)/第 1 课：让电脑装好 WinBox 并连上实验网.md` |
| 2 | 让 WinBox 第一次连上 RouterOS 并改名改密 | `00-入门(introduction)/01-连接路由器/第 2 课：让 WinBox 第一次连上 RouterOS 并改名改密.md` |
| 3 | 让改配置之前先留一份备份 | `00-入门(introduction)/05-备份/第 3 课：让改配置之前先留一份备份.md` |
| 4 | 让 RouterOS 升到当前稳定版 | `00-入门(introduction)/06-升级RouterOS/第 4 课：让 RouterOS 升到当前稳定版.md` |
| 5 | 弄清地址、网关和 DNS 各管什么 | `01-网络基础(networking-basics)/第 5 课：弄清地址、网关和 DNS 各管什么.md` |
| 6 | 看清电脑和路由器怎么用 ARP 对上 | `01-网络基础(networking-basics)/01-ARP/第 6 课：看清电脑和路由器怎么用 ARP 对上.md` |
| 7 | 让家里有线电脑都进同一张网 | `02-RouterOS基础(routeros-basics)/02-Bridge/第 7 课：让家里有线电脑都进同一张网.md` |
| 8 | 让家里也能用 IPv6 | `02-RouterOS基础(routeros-basics)/04-配置IPv6/第 8 课：让家里也能用 IPv6.md` |
| 9 | 让家里电脑自动拿到地址 | `03-DHCP与DNS(dhcp-dns)/01-DHCP服务器/第 9 课：让家里电脑自动拿到地址.md`（含 DNS） |
| 10 | 让指定电脑走另一条上网路径 | `03-DHCP与DNS(dhcp-dns)/04-DHCP-Option分流/第 10 课：让指定电脑走另一条上网路径.md` |
| 11 | 让 RouterOS 用宽带账号拨号上网 | `04-NAT(nat)/01-WAN拨号PPPoE/第 11 课：让 RouterOS 用宽带账号拨号上网.md`（含 masquerade） |
| 12 | 让 RouterOS 用固定公网 IP 上网 | `04-NAT(nat)/02-固定IP上网/第 12 课：让 RouterOS 用固定公网 IP 上网.md`（含 masquerade） |
| 13 | 让 RouterOS 通过 DHCP 接入互联网 | `04-NAT(nat)/03-DHCP获取公网IP/第 13 课：让 RouterOS 通过 DHCP 接入互联网.md`（含 masquerade） |
| 14 | 让外网和家里都能访问家里的服务 | `04-NAT(nat)/08-端口映射与回流/第 14 课：让外网和家里都能访问家里的服务.md` |
| 15 | 让一台内网机器拥有独立公网地址 | `04-NAT(nat)/06-1对1NAT/第 15 课：让一台内网机器拥有独立公网地址.md` |
| 16 | 查清为什么 NAT 之后上不了网 | `04-NAT(nat)/07-NAT排错/第 16 课：查清为什么 NAT 之后上不了网.md` |
| 17 | 让两条宽带互相备份上网 | `09-高可用(high-availability)/01-双WAN/第 17 课：让两条宽带互相备份上网.md` |
| 18 | 让去某个网段的包走指定下一跳 | `11-三层路由(routing)/02-添加静态路由/第 18 课：让去某个网段的包走指定下一跳.md`（含默认路由） |
| 19 | 让指定流量走另一条线路 | `11-三层路由(routing)/04-策略路由/第 19 课：让指定流量走另一条线路.md` |
| 20 | 让不同流量用各自的路由表 | `11-三层路由(routing)/05-多路由表/第 20 课：让不同流量用各自的路由表.md` |
| 21 | 让家里不同 VLAN 能互相访问 | `10-二层交换(switching)/05-VLAN间路由/第 21 课：让家里不同 VLAN 能互相访问.md` |
| 22 | 让路由器挡住外网乱扫家里仍能管 | `05-防火墙(firewall)/02-保护路由器Input/第 22 课：让路由器挡住外网乱扫家里仍能管.md` |
| 23 | 让外网敲对端口才能打开 SSH | `05-防火墙(firewall)/08-端口敲门/第 23 课：让外网敲对端口才能打开 SSH.md` |
| 24 | 让家里手机连上自己的 Wi-Fi | `06-无线(wireless)/01-家里WiFi/第 24 课：让家里手机连上自己的 Wi-Fi.md` |
| 25 | 让客人上网却进不了家里电脑 | `06-无线(wireless)/02-访客WiFi/第 25 课：让客人上网却进不了家里电脑.md` |
| 26 | 让一台路由器统一管多台 AP | `06-无线(wireless)/03-CAPsMAN/第 26 课：让一台路由器统一管多台 AP.md` |
| 27 | 让某一台电脑限速 | `08-QoS(qos)/01-SimpleQueue限速/第 27 课：让某一台电脑限速.md` |
| 28 | 让整个网段限速 | `08-QoS(qos)/02-QueueTree限网段/第 28 课：让整个网段限速.md` |
| 29 | 让两台 RouterOS 用 OSPF 自动学路由 | `18-动态路由(dynamic-routing)/01-OSPF互通/第 29 课：让两台 RouterOS 用 OSPF 自动学路由.md` |
| 30 | 让两台 RouterOS 用 BGP 互通 | `18-动态路由(dynamic-routing)/02-BGP互通/第 30 课：让两台 RouterOS 用 BGP 互通.md` |
| 31 | 让两台 RouterOS 用 LDP 建起 MPLS | `19-MPLS(mpls)/01-LDP互通/第 31 课：让两台 RouterOS 用 LDP 建起 MPLS.md` |
| 32 | 让手机和电脑用 WireGuard 连回家 | `07-VPN(vpn)/01-WireGuard/第 32 课：让手机和电脑用 WireGuard 连回家.md` |
| 33 | 让两个地方的网络用 WireGuard 打通 | `07-VPN(vpn)/04-WireGuard站点到站点/第 33 课：让两个地方的网络用 WireGuard 打通.md` |
| 34 | 让手机用 IKEv2 连回家里 RouterOS | `07-VPN(vpn)/11-IKEv2回家/第 34 课：让手机用 IKEv2 连回家里 RouterOS.md` |
| 35 | 让两个地方的网络用 IPsec 打通 | `07-VPN(vpn)/09-IPsec站点到站点/第 35 课：让两个地方的网络用 IPsec 打通.md` |
| 36 | 让 Windows 用 SSTP 连回家 | `07-VPN(vpn)/12-SSTP/第 36 课：让 Windows 用 SSTP 连回家.md` |
| 37 | 让电脑用 OpenVPN 连回家 | `07-VPN(vpn)/13-OpenVPN/第 37 课：让电脑用 OpenVPN 连回家.md` |
| 38 | 让电脑用 L2TP／IPsec 连回家 | `07-VPN(vpn)/14-L2TP/第 38 课：让电脑用 L2TP／IPsec 连回家.md` |
| 39 | 让 ARM 设备加入 ZeroTier 虚拟网 | `07-VPN(vpn)/15-ZeroTier/第 39 课：让 ARM 设备加入 ZeroTier 虚拟网.md` |
| 40 | 查清回家 VPN 为什么连不上 | `07-VPN(vpn)/10-VPN排错/第 40 课：查清回家 VPN 为什么连不上.md` |
| 41 | 让路由器少暴露并把服务收紧 | `13-安全(security)/05-安全加固/第 41 课：让路由器少暴露并把服务收紧.md` |
| 42 | 让网页管理改走 HTTPS | `13-安全(security)/06-开启HTTPS/第 42 课：让网页管理改走 HTTPS.md` |
| 43 | 让 SSH 用密钥登录并关掉密码 | `13-安全(security)/07-SSH密钥登录/第 43 课：让 SSH 用密钥登录并关掉密码.md` |
| 44 | 按流程查清网络为什么不通 | `14-故障排查(troubleshooting)/01-网络故障排查流程/第 44 课：按流程查清网络为什么不通.md` |
| 45 | 让转发走 FastTrack 少占 CPU | `15-性能优化(performance)/01-FastTrack/第 45 课：让转发走 FastTrack 少占 CPU.md` |
| 46 | 让路由器每天自动留一份备份 | `16-自动化(automation)/01-定时备份/第 46 课：让路由器每天自动留一份备份.md` |
| 47 | 让路由器盯住外网通断并做动作 | `16-自动化(automation)/02-Netwatch探测/第 47 课：让路由器盯住外网通断并做动作.md` |
| 48 | 做出一份能还原的备份文件 | `17-生产环境(production)/01-配置备份/第 48 课：做出一份能还原的备份文件.md` |
| 49 | 导出能看懂的配置并按需恢复 | `17-生产环境(production)/02-Export导出/第 49 课：导出能看懂的配置并按需恢复.md` |
| 50 | 把 RouterOS 恢复成出厂设置 | `17-生产环境(production)/04-恢复出厂/第 50 课：把 RouterOS 恢复成出厂设置.md` |
| 51 | 用 Netinstall 重装救砖的 RouterOS | `17-生产环境(production)/05-Netinstall/第 51 课：用 Netinstall 重装救砖的 RouterOS.md` |
| 52 | 让 WinBox 穿过二层找到旁边那台机 | `20-高级(advanced)/01-RoMON/第 52 课：让 WinBox 穿过二层找到旁边那台机.md` |
| 53 | 让两套网络在同一台机上互不干扰 | `20-高级(advanced)/02-VRF隔离/第 53 课：让两套网络在同一台机上互不干扰.md` |

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

## 网络拓扑及原理图

VPN、NAT、防火墙路径、VLAN、DHCP Option、双 WAN 等课：先读并执行 **`network-v1-diagram`**（A：整体原理，深蓝插画）和需要时的 **`packet-flow-diagram`**（B：①～⑤ 包变形 Mermaid PNG）。

落盘到本课目录，不要写到技能仓：

- `images/00-原理.png` — A 类
- `images/00-包变形.png` — B 类（地址/端口会改写时必配）

WinBox 假界面仍禁止 AI。读者课文不要写那两套技能的风格说明。图注规则同上。已有 `00-原理.svg` 重画时换成上述 PNG。

## 文风

读者只看步骤，不看你怎么规划课。

- 像人说话：点哪个菜单、填哪个框。
- 课文 H1 用 `第 N 课：让……`，md 文件名与 H1 相同；不要功能名当题目。
- 步骤标题用动词。
- 不写「众所周知」「轻松掌握」「本节将」「骨架」「可跟做」「短操作课」「先从下面几篇做起」「全部课文」「不要一上来 import」。
- 不把一课写成参数列表。
- 不把技能名、实验机编号、官方依据、以及「不要贴进仓库 / 写进文档」写进课文。
