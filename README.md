# RouterOS 入门实战

给想从零把 MikroTik RouterOS 7.x 配通的人用的实战手册。打开 WinBox，按场景一步步做完：家里上网、组网、防火墙、回家 VPN。

<p align="center">
  <img src="images/00-routeros-panorama.jpg" alt="FIG_000.A · RouterOS" width="480" />
</p>

**Read in your language:** [中文](README.md) · [English](en/README.md)

---

第一次上手 MikroTik，从这里开始。

RouterOS 把整套网络功能放在一台设备里，值得上手。

- **VPN 不用另找插件。** 系统自带 WireGuard、IKEv2、OpenVPN、PPTP、L2TP、IPsec、SSTP，回家或者两地互联都能直接配。
- **防火墙就在这台机器上。** NAT，以及从二层到七层的过滤，都在同一套规则里。

它的搭法和 OpenWrt（大家说的 OP）不一样。OP 给你一个装好的玩具，到手就能玩。RouterOS 给你的是底层网络积木：接口、地址、路由、防火墙，要自己一块块接上。刚开始会有点不习惯，把原理弄懂之后，这些零件可以按你的网络自由组合。

## 🌐 在线阅读

- [GitHub Pages](https://gygy.github.io/routeros-starter-guide/)
- [GitHub 仓库](https://github.com/gygy/routeros-starter-guide)

## 🚀 入门

顺着往下做就行。先把课文看懂，再去做实验。

| 步 | 要做什么 | 读课文 | 做实验 |
| --- | --- | --- | --- |
| 1 | 装好 WinBox，连上实验网 | [第 1 章：让电脑装好 WinBox 并连上实验网](<docs/00-入门(introduction)/第 1 章：让电脑装好 WinBox 并连上实验网.md>) | [Lab 00 环境准备](<labs/00-环境准备(getting-started)/00-环境准备.md>) |
| 2 | 第一次连上，改名改密 | [第 2 章：让 WinBox 第一次连上 RouterOS 并改名改密](<docs/00-入门(introduction)/01-连接路由器/第 2 章：让 WinBox 第一次连上 RouterOS 并改名改密.md>) | [Lab 01 第一台路由器](<labs/01-第一台路由器(first-router)/01-第一台路由器.md>) |
| 3 | 改配置前留备份，并升到稳定版 | [第 3 章：让改配置之前先留一份备份](<docs/00-入门(introduction)/05-备份/第 3 章：让改配置之前先留一份备份.md>)<br>[第 4 章：让 RouterOS 升到当前稳定版](<docs/00-入门(introduction)/06-升级RouterOS/第 4 章：让 RouterOS 升到当前稳定版.md>) | — |
| 4 | 弄清地址，让家里电脑自动拿到地址 | [第 5 章：弄清地址、网关和 DNS 各管什么](<docs/01-网络基础(networking-basics)/第 5 章：弄清地址、网关和 DNS 各管什么.md>)<br>[第 9 章：让家里电脑自动拿到地址](<docs/03-DHCP与DNS(dhcp-dns)/01-DHCP服务器/第 9 章：让家里电脑自动拿到地址.md>) | [Lab 02 LAN + DHCP](<labs/02-LAN与DHCP(lan-dhcp)/02-LAN与DHCP.md>) |
| 5 | 用宽带账号拨号上网 | [第 11 章：让 RouterOS 用宽带账号拨号上网](<docs/04-NAT(nat)/01-WAN拨号PPPoE/第 11 章：让 RouterOS 用宽带账号拨号上网.md>)<br>[拨号课文](<cookbook/00-home/pppoe-dial.md>) | [Lab 03 PPPoE](<labs/03-PPPoE拨号(pppoe)/03-PPPoE拨号.md>) |
| 6 | 家里共享上网，需要时再做端口映射 | [第 13 章：让 RouterOS 用自动获取地址上网](<docs/04-NAT(nat)/03-DHCP获取公网IP/第 13 章：让 RouterOS 用自动获取地址上网.md>)<br>[第 14 章：让外网和家里都能访问家里的服务](<docs/04-NAT(nat)/08-端口映射与回流/第 14 章：让外网和家里都能访问家里的服务.md>) | [Lab 04 NAT](<labs/04-NAT(nat)/04-NAT.md>) |
| 7 | 把防火墙加上 | [第 22 章：让外网乱扫进不来，家里还能管路由器](<docs/05-防火墙(firewall)/02-保护路由器Input/第 22 章：让外网乱扫进不来，家里还能管路由器.md>) | [Lab 05 防火墙](<labs/05-防火墙(firewall)/05-防火墙.md>) |

后面的章在「按需求找教程」。实验总表在文末。

## 🧭 按需求找教程

| 章 | 教程 |
| --- | --- |
| 1 | [第 1 章：让电脑装好 WinBox 并连上实验网](<docs/00-入门(introduction)/第 1 章：让电脑装好 WinBox 并连上实验网.md>) |
| 2 | [第 2 章：让 WinBox 第一次连上 RouterOS 并改名改密](<docs/00-入门(introduction)/01-连接路由器/第 2 章：让 WinBox 第一次连上 RouterOS 并改名改密.md>) |
| 3 | [第 3 章：让改配置之前先留一份备份](<docs/00-入门(introduction)/05-备份/第 3 章：让改配置之前先留一份备份.md>) |
| 4 | [第 4 章：让 RouterOS 升到当前稳定版](<docs/00-入门(introduction)/06-升级RouterOS/第 4 章：让 RouterOS 升到当前稳定版.md>) |
| 5 | [第 5 章：弄清地址、网关和 DNS 各管什么](<docs/01-网络基础(networking-basics)/第 5 章：弄清地址、网关和 DNS 各管什么.md>) |
| 6 | [第 6 章：看清电脑和路由器怎么认上对方（ARP）](<docs/01-网络基础(networking-basics)/01-ARP/第 6 章：看清电脑和路由器怎么认上对方（ARP）.md>) |
| 7 | [第 7 章：让家里有线电脑都进同一张网](<docs/02-RouterOS基础(routeros-basics)/02-Bridge/第 7 章：让家里有线电脑都进同一张网.md>) |
| 8 | [第 8 章：让家里也能用 IPv6](<docs/02-RouterOS基础(routeros-basics)/04-配置IPv6/第 8 章：让家里也能用 IPv6.md>) |
| 9 | [第 9 章：让家里电脑自动拿到地址](<docs/03-DHCP与DNS(dhcp-dns)/01-DHCP服务器/第 9 章：让家里电脑自动拿到地址.md>) |
| 10 | [第 10 章：让指定电脑走另一条上网路径](<docs/03-DHCP与DNS(dhcp-dns)/04-DHCP-Option分流/第 10 章：让指定电脑走另一条上网路径.md>) |
| 11 | [第 11 章：让 RouterOS 用宽带账号拨号上网](<docs/04-NAT(nat)/01-WAN拨号PPPoE/第 11 章：让 RouterOS 用宽带账号拨号上网.md>) |
| 12 | [第 12 章：让 RouterOS 用固定公网 IP 上网](<docs/04-NAT(nat)/02-固定IP上网/第 12 章：让 RouterOS 用固定公网 IP 上网.md>) |
| 13 | [第 13 章：让 RouterOS 用自动获取地址上网](<docs/04-NAT(nat)/03-DHCP获取公网IP/第 13 章：让 RouterOS 用自动获取地址上网.md>) |
| 14 | [第 14 章：让外网和家里都能访问家里的服务](<docs/04-NAT(nat)/08-端口映射与回流/第 14 章：让外网和家里都能访问家里的服务.md>) |
| 15 | [第 15 章：让家里某台机器独占一个公网 IP](<docs/04-NAT(nat)/06-1对1NAT/第 15 章：让家里某台机器独占一个公网 IP.md>) |
| 16 | [第 16 章：查清为什么 NAT 之后上不了网](<docs/04-NAT(nat)/07-NAT排错/第 16 章：查清为什么 NAT 之后上不了网.md>) |
| 17 | [第 17 章：让两条宽带一条挂了另一条顶上](<docs/09-高可用(high-availability)/01-双WAN/第 17 章：让两条宽带一条挂了另一条顶上.md>) |
| 18 | [第 18 章：让去某段网的流量走指定出口](<docs/11-三层路由(routing)/02-添加静态路由/第 18 章：让去某段网的流量走指定出口.md>) |
| 19 | [第 19 章：让指定流量走另一条线路](<docs/11-三层路由(routing)/04-策略路由/第 19 章：让指定流量走另一条线路.md>) |
| 20 | [第 20 章：让不同类型的上网各走各的路](<docs/11-三层路由(routing)/05-多路由表/第 20 章：让不同类型的上网各走各的路.md>) |
| 21 | [第 21 章：让家里不同 VLAN 能互相访问](<docs/10-二层交换(switching)/05-VLAN间路由/第 21 章：让家里不同 VLAN 能互相访问.md>) |
| 22 | [第 22 章：让外网乱扫进不来，家里还能管路由器](<docs/05-防火墙(firewall)/02-保护路由器Input/第 22 章：让外网乱扫进不来，家里还能管路由器.md>) |
| 23 | [第 23 章：让外网敲对端口才能打开管理口](<docs/05-防火墙(firewall)/08-端口敲门/第 23 章：让外网敲对端口才能打开管理口.md>) |
| 24 | [第 24 章：让家里手机连上自己的 Wi-Fi](<docs/06-无线(wireless)/01-家里WiFi/第 24 章：让家里手机连上自己的 Wi-Fi.md>) |
| 25 | [第 25 章：让客人上网却进不了家里电脑](<docs/06-无线(wireless)/02-访客WiFi/第 25 章：让客人上网却进不了家里电脑.md>) |
| 26 | [第 26 章：让一台路由器统一管多台 AP](<docs/06-无线(wireless)/03-CAPsMAN/第 26 章：让一台路由器统一管多台 AP.md>) |
| 27 | [第 27 章：让某一台电脑限速](<docs/08-QoS(qos)/01-SimpleQueue限速/第 27 章：让某一台电脑限速.md>) |
| 28 | [第 28 章：让整个网段限速](<docs/08-QoS(qos)/02-QueueTree限网段/第 28 章：让整个网段限速.md>) |
| 29 | [第 29 章：让两台 RouterOS 用 OSPF 自动学路由](<docs/18-动态路由(dynamic-routing)/01-OSPF互通/第 29 章：让两台 RouterOS 用 OSPF 自动学路由.md>) |
| 30 | [第 30 章：让两台 RouterOS 用 BGP 互相学路由](<docs/18-动态路由(dynamic-routing)/02-BGP互通/第 30 章：让两台 RouterOS 用 BGP 互相学路由.md>) |
| 31 | [第 31 章：让两台 RouterOS 建起 MPLS 隧道（用 LDP）](<docs/19-MPLS(mpls)/01-LDP互通/第 31 章：让两台 RouterOS 建起 MPLS 隧道（用 LDP）.md>) |
| 32 | [第 32 章：让手机和电脑用 WireGuard 连回家](<docs/07-VPN(vpn)/01-WireGuard/第 32 章：让手机和电脑用 WireGuard 连回家.md>) |
| 33 | [第 33 章：让两个地方的网络用 WireGuard 打通](<docs/07-VPN(vpn)/04-WireGuard站点到站点/第 33 章：让两个地方的网络用 WireGuard 打通.md>) |
| 34 | [第 34 章：让手机用 IKEv2 连回家里 RouterOS](<docs/07-VPN(vpn)/11-IKEv2回家/第 34 章：让手机用 IKEv2 连回家里 RouterOS.md>) |
| 35 | [第 35 章：让两个地方的网络用 IPsec 打通](<docs/07-VPN(vpn)/09-IPsec站点到站点/第 35 章：让两个地方的网络用 IPsec 打通.md>) |
| 36 | [第 36 章：让 Windows 用 SSTP 连回家](<docs/07-VPN(vpn)/12-SSTP/第 36 章：让 Windows 用 SSTP 连回家.md>) |
| 37 | [第 37 章：让电脑用 OpenVPN 连回家](<docs/07-VPN(vpn)/13-OpenVPN/第 37 章：让电脑用 OpenVPN 连回家.md>) |
| 38 | [第 38 章：让电脑用 L2TP／IPsec 连回家](<docs/07-VPN(vpn)/14-L2TP/第 38 章：让电脑用 L2TP／IPsec 连回家.md>) |
| 39 | [第 39 章：让 ARM 设备加入 ZeroTier 虚拟网](<docs/07-VPN(vpn)/15-ZeroTier/第 39 章：让 ARM 设备加入 ZeroTier 虚拟网.md>)（只要 ARM/ARM64 机） |
| 40 | [第 40 章：查清回家 VPN 为什么连不上](<docs/07-VPN(vpn)/10-VPN排错/第 40 章：查清回家 VPN 为什么连不上.md>) |
| 41 | [第 41 章：让路由器少开门并收紧管理服务](<docs/13-安全(security)/05-安全加固/第 41 章：让路由器少开门并收紧管理服务.md>) |
| 42 | [第 42 章：让网页管理改走 HTTPS](<docs/13-安全(security)/06-开启HTTPS/第 42 章：让网页管理改走 HTTPS.md>) |
| 43 | [第 43 章：让 SSH 用密钥登录并关掉密码](<docs/13-安全(security)/07-SSH密钥登录/第 43 章：让 SSH 用密钥登录并关掉密码.md>) |
| 44 | [第 44 章：查清网络为什么不通（按流程）](<docs/14-故障排查(troubleshooting)/01-网络故障排查流程/第 44 章：查清网络为什么不通（按流程）.md>) |
| 45 | [第 45 章：让转发少占 CPU（打开 FastTrack）](<docs/15-性能优化(performance)/01-FastTrack/第 45 章：让转发少占 CPU（打开 FastTrack）.md>) |
| 46 | [第 46 章：让路由器每天自动留一份备份](<docs/16-自动化(automation)/01-定时备份/第 46 章：让路由器每天自动留一份备份.md>) |
| 47 | [第 47 章：让路由器盯着外网通断再自动动作](<docs/16-自动化(automation)/02-Netwatch探测/第 47 章：让路由器盯着外网通断再自动动作.md>) |
| 48 | [第 48 章：做出一份能还原的备份文件](<docs/17-生产环境(production)/01-配置备份/第 48 章：做出一份能还原的备份文件.md>) |
| 49 | [第 49 章：导出能看懂的配置，需要时再恢复](<docs/17-生产环境(production)/02-Export导出/第 49 章：导出能看懂的配置，需要时再恢复.md>) |
| 50 | [第 50 章：把 RouterOS 恢复成出厂设置](<docs/17-生产环境(production)/04-恢复出厂/第 50 章：把 RouterOS 恢复成出厂设置.md>) |
| 51 | [第 51 章：用 Netinstall 重装救砖的 RouterOS](<docs/17-生产环境(production)/05-Netinstall/第 51 章：用 Netinstall 重装救砖的 RouterOS.md>) |
| 52 | [第 52 章：让 WinBox 在同网段找到旁边那台机](<docs/20-高级(advanced)/01-RoMON/第 52 章：让 WinBox 在同网段找到旁边那台机.md>) |
| 53 | [第 53 章：让两套网在同一台路由器上互不串](<docs/20-高级(advanced)/02-VRF隔离/第 53 章：让两套网在同一台路由器上互不串.md>) |
| 54 | [第 54 章：让名单里的地址改走旁路由或 VPN](<docs/11-三层路由(routing)/06-地址列表分流/第 54 章：让名单里的地址改走旁路由或 VPN.md>) |
| 55 | [第 55 章：让家里主动连出 WireGuard，人在外面进局域网](<docs/07-VPN(vpn)/16-WireGuard主动连出/第 55 章：让家里主动连出 WireGuard，人在外面进局域网.md>) |
| 56 | [第 56 章：让 RouterOS 跑一段自己写的脚本](<docs/16-自动化(automation)/03-脚本入门/第 56 章：让 RouterOS 跑一段自己写的脚本.md>) |
| 57 | [第 57 章：让乱猜密码的地址被临时拦住](<docs/05-防火墙(firewall)/09-拦猜密码/第 57 章：让乱猜密码的地址被临时拦住.md>) |
| 58 | [第 58 章：让指定设备上线下线被记下并通知你](<docs/16-自动化(automation)/04-指定设备上线/第 58 章：让指定设备上线下线被记下并通知你.md>) |
| 59 | [第 59 章：让 RouterOS 给 Telegram 发一条消息](<docs/16-自动化(automation)/05-Telegram通知/第 59 章：让 RouterOS 给 Telegram 发一条消息.md>) |
| 60 | [第 60 章：让路由器挡住短时大量 SYN 冲击](<docs/05-防火墙(firewall)/10-挡住连接洪水/第 60 章：让路由器挡住短时大量 SYN 冲击.md>) |
| 61 | [第 61 章：让 RouterOS 跑起一个小 Docker 应用](<docs/20-高级(advanced)/03-容器/第 61 章：让 RouterOS 跑起一个小 Docker 应用.md>) |

## 📂 目录

- [课文](docs/实战课表.md)
- [实验](labs/00-目录.md)
- [课程索引](docs/00-目录.md)
- [文件清单](COURSE-TREE.md)

## 📘 章

- [00 入门](<docs/00-入门(introduction)/00-目录.md>)
- [01 网络基础](<docs/01-网络基础(networking-basics)/00-目录.md>)
- [02 RouterOS 基础](<docs/02-RouterOS基础(routeros-basics)/00-目录.md>)
- [03 DHCP / DNS](<docs/03-DHCP与DNS(dhcp-dns)/00-目录.md>)
- [04 NAT](<docs/04-NAT(nat)/00-目录.md>)
- [05 防火墙](<docs/05-防火墙(firewall)/00-目录.md>)
- [06 无线](<docs/06-无线(wireless)/00-目录.md>)
- [07 VPN](<docs/07-VPN(vpn)/00-目录.md>)
- [08 QoS](<docs/08-QoS(qos)/00-目录.md>)
- [09 高可用](<docs/09-高可用(high-availability)/00-目录.md>)
- [10 二层交换](<docs/10-二层交换(switching)/00-目录.md>)
- [11 三层路由](<docs/11-三层路由(routing)/00-目录.md>)
- [12 监控](<docs/12-监控(monitoring)/00-目录.md>)
- [13 安全](<docs/13-安全(security)/00-目录.md>)
- [14 故障排查](<docs/14-故障排查(troubleshooting)/00-目录.md>)
- [15 性能](<docs/15-性能优化(performance)/00-目录.md>)
- [16 自动化](<docs/16-自动化(automation)/00-目录.md>)
- [17 生产](<docs/17-生产环境(production)/00-目录.md>)
- [18 动态路由](<docs/18-动态路由(dynamic-routing)/00-目录.md>)
- [19 MPLS](<docs/19-MPLS(mpls)/00-目录.md>)
- [20 高级](<docs/20-高级(advanced)/00-目录.md>)

## 🧪 Lab

| Lab | 内容 |
| --- | --- |
| [00](<labs/00-环境准备(getting-started)/00-环境准备.md>) | 环境准备 |
| [01](<labs/01-第一台路由器(first-router)/01-第一台路由器.md>) | 第一台 RouterOS |
| [02](<labs/02-LAN与DHCP(lan-dhcp)/02-LAN与DHCP.md>) | LAN + DHCP |
| [03](<labs/03-PPPoE拨号(pppoe)/03-PPPoE拨号.md>) | 家庭拨号 |
| [04](<labs/04-NAT(nat)/04-NAT.md>) | NAT |
| [05](<labs/05-防火墙(firewall)/05-防火墙.md>) | 防火墙 |
| [06](<labs/06-WireGuard(wireguard)/06-WireGuard.md>) | WireGuard |
| [07](<labs/07-双WAN(dual-wan)/07-双WAN.md>) | 双 WAN |
| [08](<labs/08-QoS(qos)/08-QoS.md>) | QoS |
| [09](<labs/09-VLAN(vlan)/09-VLAN.md>) | VLAN |
| [10](<labs/10-跨VLAN路由(inter-vlan-routing)/10-跨VLAN路由.md>) | 跨 VLAN 路由 |
| [11](<labs/11-OSPF(ospf)/11-OSPF.md>) | OSPF v7 |
| [12](<labs/12-BGP(bgp)/12-BGP.md>) | BGP |
| [13](<labs/13-VRF(vrf)/13-VRF.md>) | VRF |
| [14](<labs/14-VRRP(vrrp)/14-VRRP.md>) | VRRP |
| [15](<labs/15-MPLS(mpls)/15-MPLS.md>) | MPLS |
| [16](<labs/16-自动化(automation)/16-自动化.md>) | 自动化 |

## 📦 其它

- [实践分享](cookbook/00-home/00-目录.md)
- [整机配置](configs/00-目录.md)
- [命令速查](cheatsheets/00-cli.md)
- [备份脚本](scripts/00-目录.md)
- [v6 升 v7](migration/v6-to-v7/00-目录.md)

## 🤝 欢迎贡献

本教程目前是一个正在进行中的项目，如有疏漏在所难免，欢迎任何的 PR 及 issue 讨论。

在您开始之前，请花时间阅读我们的 [贡献指南](CONTRIBUTING.md) 和 [行为准则](CODE_OF_CONDUCT.md)。

- 🐛 报告 Bug：发现内容或代码问题，请提交 Issue
- 💡 提出建议：对项目有好想法，欢迎发起讨论
- 📝 完善内容：帮助改进教程，提交你的 Pull Request
- ✍️ 分享实践：把学习笔记和项目放到 [实践分享](cookbook/00-home/00-目录.md)

MikroTik 文档：<https://help.mikrotik.com/docs/spaces/ROS/overview>。

## ⚖️ 授权许可

除特别声明外，本书中的内容使用 [CC BY-SA 3.0 License](https://creativecommons.org/licenses/by-sa/3.0/) (创作共用 署名-相同方式共享3.0 许可协议) 授权，代码遵循 [BSD 3-Clause License](https://opensource.org/licenses/BSD-3-Clause) (3 项条款的 BSD 许可协议) 。

<p align="center">如果这个项目对您有帮助，请考虑为其点亮一颗 Star 🌟！</p>

## ⭐ Star History

[![Star History Chart](https://api.star-history.com/svg?repos=gygy/routeros-starter-guide&type=Date)](https://star-history.com/#gygy/routeros-starter-guide&Date)
