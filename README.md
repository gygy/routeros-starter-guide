# RouterOS 入门与精通

家里上网、回家连 VPN、公司出口，用 **RouterOS 7**。

## 入门

1. [环境准备](<docs/00-入门(introduction)/00-环境准备.md>)
2. [连接路由器](<docs/00-入门(introduction)/01-连接路由器/01-连接路由器.md>)
3. [Lab 00 环境准备](<labs/00-环境准备(getting-started)/README.md>)
4. [Lab 01 第一台路由器](<labs/01-第一台路由器(first-router)/README.md>)
5. [地址、网关、DNS](<docs/01-网络基础(networking-basics)/00-本周必读.md>)
6. [Lab 02 LAN + DHCP](<labs/02-LAN与DHCP(lan-dhcp)/README.md>)
7. [Lab 03 PPPoE](<labs/03-PPPoE拨号(pppoe)/README.md>) · [拨号课文](<cookbook/00-home/pppoe-dial.md>)
8. [Lab 04 NAT](<labs/04-NAT(nat)/README.md>)
9. [Lab 05 防火墙](<labs/05-防火墙(firewall)/README.md>)

## 按需求找课文

| 要做的事 | 课文 | 实验 |
| --- | --- | --- |
| 安装、登录 | [环境准备](<docs/00-入门(introduction)/00-环境准备.md>) | Lab 00、01 |
| 电脑自动拿地址 | [地址、网关、DNS](<docs/01-网络基础(networking-basics)/00-本周必读.md>)、[02 章](<docs/02-RouterOS基础(routeros-basics)/README.md>) | Lab 02 |
| 运营商账号上网 | [PPPoE](<cookbook/00-home/pppoe-dial.md>) | Lab 03 |
| 共享上网 / 端口映射 | [NAT](<docs/04-NAT(nat)/README.md>) | Lab 04 |
| 防火墙 | [防火墙](<docs/05-防火墙(firewall)/README.md>) | Lab 05 |
| 无线 | [无线](<docs/06-无线(wireless)/README.md>) | |
| 回家 VPN | [VPN](<docs/07-VPN(vpn)/README.md>) | Lab 06 |
| 限速 | [QoS](<docs/08-QoS(qos)/README.md>) | Lab 08 |
| 双宽带 | [高可用](<docs/09-高可用(high-availability)/README.md>) | Lab 07 |
| VLAN / 跨网段 | [交换](<docs/10-二层交换(switching)/README.md>)、[路由](<docs/11-三层路由(routing)/README.md>) | Lab 09、10 |
| OSPF / BGP | [动态路由](<docs/18-动态路由(dynamic-routing)/README.md>) | Lab 11、12 |

## 目录

- [课文](docs/实战课表.md)
- [实验](labs/README.md)
- [课程索引](docs/README.md)
- [文件清单](COURSE-TREE.md)

## 章

- [00 入门](<docs/00-入门(introduction)/README.md>)
- [01 网络基础](<docs/01-网络基础(networking-basics)/README.md>)
- [02 RouterOS 基础](<docs/02-RouterOS基础(routeros-basics)/README.md>)
- [03 DHCP / DNS](<docs/03-DHCP与DNS(dhcp-dns)/README.md>)
- [04 NAT](<docs/04-NAT(nat)/README.md>)
- [05 防火墙](<docs/05-防火墙(firewall)/README.md>)
- [06 无线](<docs/06-无线(wireless)/README.md>)
- [07 VPN](<docs/07-VPN(vpn)/README.md>)
- [08 QoS](<docs/08-QoS(qos)/README.md>)
- [09 高可用](<docs/09-高可用(high-availability)/README.md>)
- [10 二层交换](<docs/10-二层交换(switching)/README.md>)
- [11 三层路由](<docs/11-三层路由(routing)/README.md>)
- [12 监控](<docs/12-监控(monitoring)/README.md>)
- [13 安全](<docs/13-安全(security)/README.md>)
- [14 故障排查](<docs/14-故障排查(troubleshooting)/README.md>)
- [15 性能](<docs/15-性能优化(performance)/README.md>)
- [16 自动化](<docs/16-自动化(automation)/README.md>)
- [17 生产](<docs/17-生产环境(production)/README.md>)
- [18 动态路由](<docs/18-动态路由(dynamic-routing)/README.md>)
- [19 MPLS](<docs/19-MPLS(mpls)/README.md>)
- [20 高级](<docs/20-高级(advanced)/README.md>)

## Lab

| Lab | 内容 |
| --- | --- |
| [00](<labs/00-环境准备(getting-started)/README.md>) | 环境准备 |
| [01](<labs/01-第一台路由器(first-router)/README.md>) | 第一台 RouterOS |
| [02](<labs/02-LAN与DHCP(lan-dhcp)/README.md>) | LAN + DHCP |
| [03](<labs/03-PPPoE拨号(pppoe)/README.md>) | 家庭拨号 |
| [04](<labs/04-NAT(nat)/README.md>) | NAT |
| [05](<labs/05-防火墙(firewall)/README.md>) | 防火墙 |
| [06](<labs/06-WireGuard(wireguard)/README.md>) | WireGuard |
| [07](<labs/07-双WAN(dual-wan)/README.md>) | 双 WAN |
| [08](<labs/08-QoS(qos)/README.md>) | QoS |
| [09](<labs/09-VLAN(vlan)/README.md>) | VLAN |
| [10](<labs/10-跨VLAN路由(inter-vlan-routing)/README.md>) | 跨 VLAN 路由 |
| [11](<labs/11-OSPF(ospf)/README.md>) | OSPF v7 |
| [12](<labs/12-BGP(bgp)/README.md>) | BGP |
| [13](<labs/13-VRF(vrf)/README.md>) | VRF |
| [14](<labs/14-VRRP(vrrp)/README.md>) | VRRP |
| [15](<labs/15-MPLS(mpls)/README.md>) | MPLS |
| [16](<labs/16-自动化(automation)/README.md>) | 自动化 |

## 其它

- [家庭场景](cookbook/00-home/)
- [整机配置](configs/00-baseline/)
- [命令速查](cheatsheets/)
- [备份脚本](scripts/00-backup/)
- [v6 升 v7](migration/)

MikroTik 文档：<https://help.mikrotik.com/docs/spaces/ROS/overview>。许可：[LICENSE](LICENSE)。
