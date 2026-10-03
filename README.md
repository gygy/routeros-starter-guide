# RouterOS 入门与精通

> 从网络基础到 RouterOS v7，从家庭网络到企业/ISP 网络。

**Learn Networking → Learn RouterOS → Build Labs → Troubleshoot → Automate → Design Production Networks**

主线：**RouterOS v7**。不要把本仓库当成命令大全，路径是：网络原理 → RouterOS 实现 → 实验 → 故障 → 生产设计。

文稿与截图禁止真实账户、密码、MAC、公网 IP 和个人昵称；截图右上角有学习用水印。见 [CONTRIBUTING.md](CONTRIBUTING.md)。

```text
                RouterOS 入门与精通
                         │
       ┌─────────────────┼─────────────────┐
       ↓                 ↓                 ↓
    学理论             学 RouterOS        做实验
       │                 │                 │
 Networking          CLI / WinBox        Labs
 TCP/IP              Interface           Topology
 VLAN                 Bridge              Packet
 Routing              Firewall            Troubleshooting
       │                 │                 │
       └─────────────────┼─────────────────┘
                         ↓
                      实战（cookbook / configs）
                         ↓
                       精通（Automation / Production / ISP）
```

## 🎯 学习路线

### 🟢 Level 0 · 网络基础

- [TCP/IP](<docs/01-网络基础(networking-basics)/osi-tcpip.md>)
- [IPv4](<docs/01-网络基础(networking-basics)/ipv4.md>)
- [子网划分](<docs/01-网络基础(networking-basics)/subnetting.md>)
- [VLAN](<docs/01-网络基础(networking-basics)/vlan.md>)
- [ARP](<docs/01-网络基础(networking-basics)/arp.md>)

### 🟢 Level 1 · RouterOS 入门

- [RouterOS 是什么](<docs/00-入门(introduction)/what-is-routeros.md>)
- [CLI](<docs/00-入门(introduction)/cli-basics.md>)
- [Interface](<docs/02-RouterOS基础(routeros-basics)/interfaces.md>)
- [Bridge](<docs/02-RouterOS基础(routeros-basics)/bridge.md>)
- [DHCP](<docs/02-RouterOS基础(routeros-basics)/dhcp-server.md>)
- [DNS](<docs/02-RouterOS基础(routeros-basics)/dns.md>)

### 🟡 Level 2 · 网络工程

- [VLAN Filtering](<docs/03-二层交换(switching)/vlan-filtering.md>)
- [Static Routing](<docs/04-三层路由(routing)/static-route.md>)
- [Firewall](<docs/05-防火墙(firewall)/firewall-concepts.md>)
- [NAT](<docs/06-NAT(nat)/nat.md>)
- [QoS](<docs/11-QoS(qos)/qos-concepts.md>)

### 🟠 Level 3 · 高级网络

- [Policy Routing](<docs/04-三层路由(routing)/policy-routing.md>)
- [VRF](<docs/04-三层路由(routing)/vrf.md>)
- [WireGuard](<docs/09-VPN(vpn)/wireguard.md>)
- [OSPF](<docs/10-动态路由(dynamic-routing)/ospf.md>)
- [BGP](<docs/10-动态路由(dynamic-routing)/bgp.md>)
- [BFD](<docs/10-动态路由(dynamic-routing)/bfd.md>)

### 🔴 Level 4 · 专家

- [MPLS](<docs/13-MPLS(mpls)/mpls-basics.md>)
- [BGP Policy](<docs/10-动态路由(dynamic-routing)/bgp-policy.md>)
- [RPKI](<docs/10-动态路由(dynamic-routing)/rpki.md>)
- [VRRP](<docs/12-高可用(high-availability)/vrrp.md>)
- [Automation](<docs/14-自动化(automation)/automation-design.md>)
- [ISP Architecture](<docs/20-高级(advanced)/isp-design.md>)

完整文件名、前置知识和 Lab 编号见 [COURSE-TREE.md](COURSE-TREE.md)。文章模板见 [docs/_template.md](docs/_template.md)。

---

## 🧪 Labs

| Lab | 内容 |
|---|---|
| [Lab 01](<labs/01-第一台路由器(first-router)/README.md>) | 第一台 RouterOS |
| [Lab 02](<labs/02-LAN与DHCP(lan-dhcp)/README.md>) | DHCP + DNS |
| [Lab 03](<labs/03-VLAN(vlan)/README.md>) | VLAN |
| [Lab 04](<labs/04-跨VLAN路由(inter-vlan-routing)/README.md>) | Inter-VLAN Routing |
| [Lab 05](<labs/05-防火墙(firewall)/README.md>) | Firewall |
| [Lab 06](<labs/06-NAT(nat)/README.md>) | NAT |
| [Lab 07](<labs/07-双WAN(dual-wan)/README.md>) | Dual WAN |
| [Lab 08](<labs/08-WireGuard(wireguard)/README.md>) | WireGuard |
| [Lab 09](<labs/09-OSPF(ospf)/README.md>) | OSPF（v7 instance / area / interface-template） |
| [Lab 10](<labs/10-BGP(bgp)/README.md>) | BGP |
| [Lab 11](<labs/11-VRF(vrf)/README.md>) | VRF |
| [Lab 12](<labs/12-QoS(qos)/README.md>) | QoS |
| [Lab 13](<labs/13-VRRP(vrrp)/README.md>) | VRRP |
| [Lab 14](<labs/14-MPLS(mpls)/README.md>) | MPLS |
| [Lab 15](<labs/15-自动化(automation)/README.md>) | Automation |

---

## ⚙️ Configuration

[configs/](configs/) 提供可导入 RouterOS 的**完整配置**（基线、防火墙、VLAN、路由、VPN 等）。导入前改接口名和网段。

## 🤖 Automation

- [RouterOS Script](scripts/)：功能脚本（备份、切换、监控），与完整配置分开
- [REST API](automation/rest-api/)
- [Python](automation/python/)
- [Ansible](automation/ansible/)
- [Terraform](automation/terraform/)

## 📚 Reference

- [CLI](cheatsheets/cli.md)
- [Firewall](cheatsheets/firewall.md)
- [Routing](cheatsheets/routing.md)
- [Troubleshooting](cheatsheets/troubleshooting.md)

## 目录闭环

| 目录 | 作用 |
| --- | --- |
| `docs/` | 系统课程 |
| `labs/` | 动手实验 |
| `configs/` | 完整配置 |
| `scripts/` | 功能脚本 |
| `automation/` | 外部自动化 |
| `topologies/` | 场景拓扑说明 |
| `diagrams/` | 拓扑图源文件 |
| `images/` | 截图（WinBox / CLI / Lab） |
| `cheatsheets/` | 速查 |
| `cookbook/` | 场景方案 |
| `migration/` | v6→v7 与过时做法 |
| `glossary/` | 术语 |

## 官方依据

配置与行为以 [MikroTik RouterOS 文档](https://help.mikrotik.com/docs/spaces/ROS/overview) 最新稳定 v7 为准。

## 许可

见 [LICENSE](LICENSE)。RouterOS / MikroTik 为各自权利人的商标。
