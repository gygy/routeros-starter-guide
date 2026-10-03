# RouterOS 入门与精通

> 从家庭上网到企业/ISP。主线 **RouterOS v7**。目录按**家里最常用的功能**往前排。

**第一周先动手。** 首页只推荐能跟着做的材料；其余仍是提纲，见 [COURSE-TREE.md](COURSE-TREE.md)。

## 本周只看这些

1. [环境准备](<docs/00-入门(introduction)/00-环境准备.md>)  
2. [连接路由器（WinBox / MAC）](<docs/00-入门(introduction)/01-连接路由器/01-连接路由器.md>)  
3. [Lab 00 环境准备](<labs/00-环境准备(getting-started)/README.md>)
3. [Lab 01 第一台路由器](<labs/01-第一台路由器(first-router)/README.md>)
4. [本周必读：地址、网关、DNS](<docs/01-网络基础(networking-basics)/00-本周必读.md>)
5. [Lab 02 LAN + DHCP](<labs/02-LAN与DHCP(lan-dhcp)/README.md>)
6. 家里是 **账号拨号** → [Lab 03 PPPoE](<labs/03-PPPoE拨号(pppoe)/README.md>)（步骤和截图在 [这篇课文](<cookbook/00-home/pppoe-dial.md>)）
7. [Lab 04 NAT](<labs/04-NAT(nat)/README.md>)（共享上网）
8. [Lab 05 防火墙](<labs/05-防火墙(firewall)/README.md>)

不要一上来 `/import` 企业配置。家里最多先看 `configs/00-baseline/`，并改接口名。

```text
环境准备 → Lab 00/01 → 地址/网关/DNS → Lab 02
         →（可选）PPPoE → NAT → 防火墙 → 能上网
```

## 课文 ↔ Lab 对照

| 你要做的事 | 先读 | 再做 |
| --- | --- | --- |
| 安装、登录 | [环境准备](<docs/00-入门(introduction)/00-环境准备.md>) | Lab 00、01 |
| 电脑自动拿地址 | [本周必读](<docs/01-网络基础(networking-basics)/00-本周必读.md>)、[02 章](<docs/02-RouterOS基础(routeros-basics)/README.md>) | Lab 02 |
| 运营商账号上网 | [PPPoE 课文](<cookbook/00-home/pppoe-dial.md>) | Lab 03 |
| 共享上网 / 端口映射 | [04 章 NAT](<docs/04-NAT(nat)/README.md>) | Lab 04 |
| 防火墙 | [05 章](<docs/05-防火墙(firewall)/README.md>) | Lab 05 |
| 无线 | [06 章](<docs/06-无线(wireless)/README.md>) | （有无线硬件再做） |
| 回家 VPN | [07 章](<docs/07-VPN(vpn)/README.md>) | Lab 06 WireGuard |
| 限速 | [08 章](<docs/08-QoS(qos)/README.md>) | Lab 08 |
| 双宽带 | [09 章](<docs/09-高可用(high-availability)/README.md>) | Lab 07 |
| VLAN / 跨网段 | [10 章](<docs/10-二层交换(switching)/README.md>)、[11 章](<docs/11-三层路由(routing)/README.md>) | Lab 09、10 |
| OSPF / BGP | [18 章](<docs/18-动态路由(dynamic-routing)/README.md>) | Lab 11、12 |

章号和 Lab 号现在按「家里常用程度」对齐，对照上表即可。

## 课程与实验目录

- 课程索引：[docs/README.md](docs/README.md)
- 实验索引：[labs/README.md](labs/README.md)
- 术语：[glossary/networking.md](glossary/networking.md)

---

## 后面再用（先不必点）

| 目录 | 什么时候看 |
| --- | --- |
| `cookbook/00-home/` | 家庭场景；PPPoE 跟做 |
| `configs/00-baseline/` | 会手改接口之后再导入 |
| `scripts/00-backup/` | 备份脚本，不是开局包 |
| `cheatsheets/` | 做过实验，需要查命令 |
| `automation/` | REST / Python / Ansible / Terraform |
| `topologies/` `diagrams/` | 画大图时 |
| `migration/` | 从 v6 升上来时 |
| `images/` | 新截图按课存放 |

专家向课文在 [第 20 章](<docs/20-高级(advanced)/README.md>)，做完 Lab 00–06 再说。

---

## 课程章（常用在前）

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

---

## Labs（常用在前）

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

官方依据：[MikroTik RouterOS 文档](https://help.mikrotik.com/docs/spaces/ROS/overview)。许可见 [LICENSE](LICENSE)。截图脱敏见 [CONTRIBUTING.md](CONTRIBUTING.md)。
