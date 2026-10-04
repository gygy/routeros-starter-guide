# RouterOS 入门与精通

家里上网、回家连 VPN、公司出口，用 **RouterOS 7**。

## 入门

1. [环境准备](<docs/00-入门(introduction)/00-环境准备.md>)
2. [连接路由器](<docs/00-入门(introduction)/01-连接路由器/01-连接路由器.md>)
3. [Lab 00 环境准备](<labs/00-环境准备(getting-started)/00-环境准备.md>)
4. [Lab 01 第一台路由器](<labs/01-第一台路由器(first-router)/01-第一台路由器.md>)
5. [地址、网关、DNS](<docs/01-网络基础(networking-basics)/00-本周必读.md>)
6. [Lab 02 LAN + DHCP](<labs/02-LAN与DHCP(lan-dhcp)/02-LAN与DHCP.md>)
7. [Lab 03 PPPoE](<labs/03-PPPoE拨号(pppoe)/03-PPPoE拨号.md>) · [拨号课文](<cookbook/00-home/pppoe-dial.md>)
8. [Lab 04 NAT](<labs/04-NAT(nat)/04-NAT.md>)
9. [Lab 05 防火墙](<labs/05-防火墙(firewall)/05-防火墙.md>)

## 按需求找课文

| 要做的事 | 课文 | 实验 |
| --- | --- | --- |
| 安装、登录 | [环境准备](<docs/00-入门(introduction)/00-环境准备.md>) | Lab 00、01 |
| 电脑自动拿地址 | [地址、网关、DNS](<docs/01-网络基础(networking-basics)/00-本周必读.md>)、[02 章](<docs/02-RouterOS基础(routeros-basics)/00-目录.md>) | Lab 02 |
| 运营商账号上网 | [PPPoE](<cookbook/00-home/pppoe-dial.md>) | Lab 03 |
| 共享上网 / 端口映射 | [NAT](<docs/04-NAT(nat)/00-目录.md>) | Lab 04 |
| 防火墙 | [防火墙](<docs/05-防火墙(firewall)/00-目录.md>) | Lab 05 |
| 无线 | [无线](<docs/06-无线(wireless)/00-目录.md>) | |
| 回家 VPN | [VPN](<docs/07-VPN(vpn)/00-目录.md>) | Lab 06 |
| 限速 | [QoS](<docs/08-QoS(qos)/00-目录.md>) | Lab 08 |
| 双宽带 | [高可用](<docs/09-高可用(high-availability)/00-目录.md>) | Lab 07 |
| VLAN / 跨网段 | [交换](<docs/10-二层交换(switching)/00-目录.md>)、[路由](<docs/11-三层路由(routing)/00-目录.md>) | Lab 09、10 |
| OSPF / BGP | [动态路由](<docs/18-动态路由(dynamic-routing)/00-目录.md>) | Lab 11、12 |

## 目录

- [课文](docs/实战课表.md)
- [实验](labs/00-目录.md)
- [课程索引](docs/00-目录.md)
- [文件清单](COURSE-TREE.md)

## 章

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

## Lab

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

## 其它

- [家庭场景](cookbook/00-home/00-目录.md)
- [整机配置](configs/00-目录.md)
- [命令速查](cheatsheets/00-cli.md)
- [备份脚本](scripts/00-目录.md)
- [v6 升 v7](migration/v6-to-v7/00-目录.md)

MikroTik 文档：<https://help.mikrotik.com/docs/spaces/ROS/overview>。许可：[LICENSE](LICENSE)。
