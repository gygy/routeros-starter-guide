# RouterOS Starter Guide

A hands-on reference for people who want to bring up MikroTik RouterOS 7.x from first boot. Follow real scenarios in WinBox: home internet, LAN, firewall, and VPN back home.

<p align="center">
  <img src="../images/00-routeros-panorama.jpg" alt="FIG_000.A · RouterOS" width="480" />
</p>

**Read in your language:** [中文](../README.md) · [English](README.md)

---

Start here if this is your first MikroTik box.

RouterOS keeps a full networking stack on one device.

- **VPN is built in.** WireGuard, IKEv2, OpenVPN, PPTP, L2TP, IPsec, and SSTP ship with the system—no extra plugins for home or site-to-site.
- **Firewall lives on the same box.** NAT and filtering from Layer 2 through Layer 7 share one rule set.

It is not OpenWrt. OpenWrt feels like a ready-made toy. RouterOS gives you building blocks—interfaces, addresses, routes, firewall—that you wire yourself. The first hours feel unfamiliar; once the pieces click, you can reshape the network the way you need.

## 🌐 Read online

- [GitHub Pages](https://gygy.github.io/routeros-starter-guide/)
- [GitHub repository](https://github.com/gygy/routeros-starter-guide)

## 🚀 Getting started

Work top to bottom. Read the lesson, then do the lab.

| Step | Goal | Lesson (Chinese for now) | Lab |
| --- | --- | --- | --- |
| 1 | Install WinBox and join the lab network | [Chapter 1](<../docs/00-入门(introduction)/第 1 章：让电脑装好 WinBox 并连上实验网.md>) | [Lab 00](<../labs/00-环境准备(getting-started)/00-环境准备.md>) |
| 2 | First login, rename, change password | [Chapter 2](<../docs/00-入门(introduction)/01-连接路由器/第 2 章：让 WinBox 第一次连上 RouterOS 并改名改密.md>) | [Lab 01](<../labs/01-第一台路由器(first-router)/01-第一台路由器.md>) |
| 3 | Backup before changes, then upgrade | [Chapter 3](<../docs/00-入门(introduction)/05-备份/第 3 章：让改配置之前先留一份备份.md>)<br>[Chapter 4](<../docs/00-入门(introduction)/06-升级RouterOS/第 4 章：让 RouterOS 升到当前稳定版.md>) | — |
| 4 | Addresses and home DHCP | [Chapter 5](<../docs/01-网络基础(networking-basics)/第 5 章：弄清地址、网关和 DNS 各管什么.md>)<br>[Chapter 9](<../docs/03-DHCP与DNS(dhcp-dns)/01-DHCP服务器/第 9 章：让家里电脑自动拿到地址.md>) | [Lab 02](<../labs/02-LAN与DHCP(lan-dhcp)/02-LAN与DHCP.md>) |
| 5 | PPPoE dial-up | [Chapter 11](<../docs/04-NAT(nat)/01-WAN拨号PPPoE/第 11 章：让 RouterOS 用宽带账号拨号上网.md>) | [Lab 03](<../labs/03-PPPoE拨号(pppoe)/03-PPPoE拨号.md>) |
| 6 | Share internet; port forward when needed | [Chapter 13](<../docs/04-NAT(nat)/03-DHCP获取公网IP/第 13 章：让 RouterOS 用自动获取地址上网.md>)<br>[Chapter 14](<../docs/04-NAT(nat)/08-端口映射与回流/第 14 章：让外网和家里都能访问家里的服务.md>) | [Lab 04](<../labs/04-NAT(nat)/04-NAT.md>) |
| 7 | Lock down the firewall | [Chapter 22](<../docs/05-防火墙(firewall)/02-保护路由器Input/第 22 章：让外网乱扫进不来，家里还能管路由器.md>) | [Lab 05](<../labs/05-防火墙(firewall)/05-防火墙.md>) |

More lessons: see the Chinese [README · 按需求找教程](../README.md#按需求找教程). Lesson Markdown is being translated gradually; WinBox screenshots stay Chinese for now.

## 🔍 Troubleshooting

Match the symptom, then open the lesson. Full index (Chinese): [故障速查](../cookbook/00-home/故障速查.md). Home build-outs: [家庭案例](../cookbook/00-home/家庭案例.md).

| Symptom | Start here |
| --- | --- |
| No internet | [Chapter 44](<../docs/14-故障排查(troubleshooting)/01-网络故障排查流程/第 44 章：查清网络为什么不通（按流程）.md>) |
| Port forward fails | [Chapter 14](<../docs/04-NAT(nat)/08-端口映射与回流/第 14 章：让外网和家里都能访问家里的服务.md>) |
| VPN connects, NAS unreachable | [Chapter 40](<../docs/07-VPN(vpn)/10-VPN排错/第 40 章：查清回家 VPN 为什么连不上.md>) |
| No public IP | [Chapter 55](<../docs/07-VPN(vpn)/16-WireGuard主动连出/第 55 章：让家里主动连出 WireGuard，人在外面进局域网.md>) |

## 📝 Note on translation

- **Now:** English covers this home page and future `en/` Markdown mirrors.
- **Not yet:** WinBox screenshots stay as-is (Chinese UI is fine to follow by icon and field name).
- Full chapter list remains on the [Chinese README](../README.md) until each lesson has an `en/` copy.

## 🤝 Contributing

Before you start, please take a moment to read our [Contributing Guide](../CONTRIBUTING.md) and [Code of Conduct](../CODE_OF_CONDUCT.md).

Bug reports, ideas, pull requests, and practice notes are welcome. See the Chinese [欢迎贡献](../README.md#欢迎贡献) for the short checklist.

MikroTik docs: <https://help.mikrotik.com/docs/spaces/ROS/overview>.

## ⚖️ License

Unless otherwise stated, the content in this book is licensed under the [CC BY-SA 3.0 License](https://creativecommons.org/licenses/by-sa/3.0/) (Creative Commons Attribution-ShareAlike 3.0 Unported), and the code follows the [BSD 3-Clause License](https://opensource.org/licenses/BSD-3-Clause).

<p align="center">If this project helps you, please consider giving it a Star 🌟!</p>

## ⭐ Star History

[![Star History Chart](https://api.star-history.com/svg?repos=gygy/routeros-starter-guide&type=Date)](https://star-history.com/#gygy/routeros-starter-guide&Date)
