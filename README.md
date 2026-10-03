# RouterOS 入门与精通

> 从网络基础到 RouterOS v7，从家庭网络到企业/ISP 网络。主线 **v7**。

**第一周先动手，再读长文。** 首页只推荐已经能跟着做的材料；其余课文仍是提纲，见 [COURSE-TREE.md](COURSE-TREE.md)。

## 本周只看这些

1. [环境准备](<docs/00-入门(introduction)/环境准备.md>)（WinBox、默认 `192.168.88.1`、插哪根网线）  
2. [Lab 00 环境准备](<labs/00-环境准备(getting-started)/README.md>)  
3. [Lab 01 第一台路由器](<labs/01-第一台路由器(first-router)/README.md>)  
4. [本周必读：地址、网关、DNS](<docs/01-网络基础(networking-basics)/本周必读.md>)  
5. [Lab 02 LAN + DHCP](<labs/02-LAN与DHCP(lan-dhcp)/README.md>)  
6. 家里是 **账号拨号** → [Lab PPPoE](<labs/02-PPPoE拨号(pppoe)/README.md>)（步骤和截图在 [这篇课文](<cookbook/home/pppoe-dial.md>)）  
7. 然后 [Lab 05 防火墙](<labs/05-防火墙(firewall)/README.md>)、[Lab 06 NAT](<labs/06-NAT(nat)/README.md>)

不要一上来 `/import` 企业配置。家里最多先看 `configs/baseline/`，并改接口名。

```text
环境准备 → Lab 00/01 → 地址/网关/DNS → Lab 02
         →（可选）PPPoE → 防火墙 → NAT → 能上网
```

## 课文 ↔ Lab 对照

| 你要做的事 | 先读 | 再做 |
| --- | --- | --- |
| 安装、登录 | [环境准备](<docs/00-入门(introduction)/环境准备.md>) | Lab 00、Lab 01 |
| 电脑自动拿地址 | [本周必读](<docs/01-网络基础(networking-basics)/本周必读.md>)、[02 章索引](<docs/02-RouterOS基础(routeros-basics)/README.md>) | Lab 02 |
| 运营商账号上网 | [PPPoE 课文](<cookbook/home/pppoe-dial.md>) | Lab 02-PPPoE |
| VLAN / 跨网段 | [03 章](<docs/03-二层交换(switching)/README.md>)、[04 章](<docs/04-三层路由(routing)/README.md>) | Lab 03、04 |
| 防火墙 | [05 章](<docs/05-防火墙(firewall)/README.md>) | Lab 05 |
| NAT / 共享上网 | [06 章](<docs/06-NAT(nat)/README.md>) | Lab 06 |
| 双线路 | [12 章](<docs/12-高可用(high-availability)/README.md>) | Lab 07 |
| WireGuard | [09 章](<docs/09-VPN(vpn)/README.md>) | Lab 08 |
| OSPF / BGP | [10 章](<docs/10-动态路由(dynamic-routing)/README.md>) | Lab 09、10 |
| VRF / QoS / VRRP / MPLS / 脚本 | 对应章 README | Lab 11–15 |

QoS 课文在 **第 11 章**，实验是 **Lab 12**；自动化课文第 14 章，实验 **Lab 15**。按上表走，不要只按数字猜。

## 课程与实验目录

- 课程索引：[docs/README.md](docs/README.md)（每章有「先读哪篇」）  
- 实验索引：[labs/README.md](labs/README.md)  
- 术语：[glossary/networking.md](glossary/networking.md)

---

## 后面再用（先不必点）

| 目录 | 什么时候看 |
| --- | --- |
| `configs/` | 会手改接口之后，再导入完整配置 |
| `scripts/` | 备份、切换等功能脚本，不是开局包 |
| `cookbook/` | 家庭/办公室场景；PPPoE 步骤已链到本周路径 |
| `cheatsheets/` | 做过实验，需要查命令时 |
| `automation/` | REST / Python / Ansible / Terraform |
| `topologies/` `diagrams/` | 画大图、讲架构时 |
| `migration/` | 从 v6 升上来时 |
| `images/` | 新截图按课存放；跟做 PPPoE 用 cookbook 里的图 |

专家向课文（MPLS、RPKI、ISP 设计）在 [Level 4 提纲](<docs/20-高级(advanced)/README.md>)，做完 Lab 01–08 再说。

---

## 学习路线（全书地图，多数仍是提纲）

### 已建议第一周完成的

见文首「本周只看这些」。

### 全书 Level（点进去先看该章 README 的状态）

- Level 0：[网络基础](<docs/01-网络基础(networking-basics)/README.md>)  
- Level 1：[入门](<docs/00-入门(introduction)/README.md>) · [RouterOS 基础](<docs/02-RouterOS基础(routeros-basics)/README.md>)  
- Level 2：[交换](<docs/03-二层交换(switching)/README.md>) · [路由](<docs/04-三层路由(routing)/README.md>) · [防火墙](<docs/05-防火墙(firewall)/README.md>) · [NAT](<docs/06-NAT(nat)/README.md>) · [QoS](<docs/11-QoS(qos)/README.md>)  
- Level 3：[VPN](<docs/09-VPN(vpn)/README.md>) · [动态路由](<docs/10-动态路由(dynamic-routing)/README.md>) · [高可用](<docs/12-高可用(high-availability)/README.md>)  
- Level 4：[MPLS](<docs/13-MPLS(mpls)/README.md>) · [自动化](<docs/14-自动化(automation)/README.md>) · [高级](<docs/20-高级(advanced)/README.md>)

---

## Labs 一览

| Lab | 内容 |
|---|---|
| [00](<labs/00-环境准备(getting-started)/README.md>) | 环境准备 |
| [01](<labs/01-第一台路由器(first-router)/README.md>) | 第一台 RouterOS |
| [02](<labs/02-LAN与DHCP(lan-dhcp)/README.md>) | DHCP + DNS |
| [02-PPPoE](<labs/02-PPPoE拨号(pppoe)/README.md>) | 家庭拨号（可选） |
| [03](<labs/03-VLAN(vlan)/README.md>) | VLAN |
| [04](<labs/04-跨VLAN路由(inter-vlan-routing)/README.md>) | 跨 VLAN 路由 |
| [05](<labs/05-防火墙(firewall)/README.md>) | Firewall |
| [06](<labs/06-NAT(nat)/README.md>) | NAT |
| [07](<labs/07-双WAN(dual-wan)/README.md>) | Dual WAN |
| [08](<labs/08-WireGuard(wireguard)/README.md>) | WireGuard |
| [09](<labs/09-OSPF(ospf)/README.md>) | OSPF v7 |
| [10](<labs/10-BGP(bgp)/README.md>) | BGP |
| [11](<labs/11-VRF(vrf)/README.md>) | VRF |
| [12](<labs/12-QoS(qos)/README.md>) | QoS |
| [13](<labs/13-VRRP(vrrp)/README.md>) | VRRP |
| [14](<labs/14-MPLS(mpls)/README.md>) | MPLS |
| [15](<labs/15-自动化(automation)/README.md>) | Automation |

官方依据：[MikroTik RouterOS 文档](https://help.mikrotik.com/docs/spaces/ROS/overview)。许可见 [LICENSE](LICENSE)。截图脱敏见 [CONTRIBUTING.md](CONTRIBUTING.md)。
