# 课程树（0 → 100）

主线 RouterOS v7。学习目标、前置知识写在各课文文首。

章和文件名按家庭常用程度编号（常用在前）。第一周先走仓库根 README 的「本周只看这些」。本表是全书清单，多数仍是提纲。

| 文件 | 标题 | 难度 | Lab |
| --- | --- | --- | --- |
| `00-入门(introduction)/00-环境准备.md` | 环境准备（可跟做） | Level 1 · 入门 | 00-环境准备(getting-started) |
| `00-入门(introduction)/01-winbox.md` | WinBox | Level 1 · 入门 | 01-第一台路由器(first-router) |
| `00-入门(introduction)/02-what-is-routeros.md` | RouterOS 是什么 | Level 1 · 入门 | 01-第一台路由器(first-router) |
| `00-入门(introduction)/03-cli-basics.md` | CLI 基础 | Level 1 · 入门 | 01-第一台路由器(first-router) |
| `00-入门(introduction)/04-webfig.md` | WebFig | Level 1 · 入门 | 01-第一台路由器(first-router) |
| `00-入门(introduction)/05-routeros-menu.md` | RouterOS 菜单体系 | Level 1 · 入门 | 01-第一台路由器(first-router) |
| `00-入门(introduction)/06-routeros-v7.md` | RouterOS v7 主线 | Level 1 · 入门 | 01-第一台路由器(first-router) |
| `00-入门(introduction)/07-routeros-architecture.md` | RouterOS 体系结构 | Level 1 · 入门 | 01-第一台路由器(first-router) |
| `01-网络基础(networking-basics)/00-本周必读.md` | 地址、网关、DNS（可跟做） | Level 0 · 网络基础 | 02-LAN与DHCP(lan-dhcp) |
| `01-网络基础(networking-basics)/01-ipv4.md` | IPv4 | Level 0 · 网络基础 | 02-LAN与DHCP(lan-dhcp) |
| `01-网络基础(networking-basics)/02-dns.md` | DNS 原理 | Level 0 · 网络基础 | 02-LAN与DHCP(lan-dhcp) |
| `01-网络基础(networking-basics)/03-icmp.md` | ICMP | Level 0 · 网络基础 | 01-第一台路由器(first-router) |
| `01-网络基础(networking-basics)/04-ethernet.md` | 以太网 | Level 0 · 网络基础 | 01-第一台路由器(first-router) |
| `01-网络基础(networking-basics)/05-arp.md` | ARP | Level 0 · 网络基础 | 01-第一台路由器(first-router) |
| `01-网络基础(networking-basics)/06-subnetting.md` | 子网划分 | Level 0 · 网络基础 | 09-VLAN(vlan) |
| `01-网络基础(networking-basics)/07-vlan.md` | VLAN 原理 | Level 0 · 网络基础 | 09-VLAN(vlan) |
| `01-网络基础(networking-basics)/08-osi-tcpip.md` | OSI 与 TCP/IP | Level 0 · 网络基础 | 01-第一台路由器(first-router) |
| `01-网络基础(networking-basics)/09-ipv6.md` | IPv6 | Level 0 · 网络基础 | 02-LAN与DHCP(lan-dhcp) |
| `02-RouterOS基础(routeros-basics)/00-interfaces.md` | 接口 | Level 1 · 入门 | 01-第一台路由器(first-router) |
| `02-RouterOS基础(routeros-basics)/01-ip-address.md` | IP 地址 | Level 1 · 入门 | 02-LAN与DHCP(lan-dhcp) |
| `02-RouterOS基础(routeros-basics)/02-bridge.md` | Bridge 入门 | Level 1 · 入门 | 02-LAN与DHCP(lan-dhcp) |
| `02-RouterOS基础(routeros-basics)/03-dhcp-client.md` | DHCP Client | Level 1 · 入门 | 02-LAN与DHCP(lan-dhcp) |
| `02-RouterOS基础(routeros-basics)/04-dhcp-server.md` | DHCP Server | Level 1 · 入门 | 02-LAN与DHCP(lan-dhcp) |
| `02-RouterOS基础(routeros-basics)/05-dns.md` | RouterOS DNS | Level 1 · 入门 | 02-LAN与DHCP(lan-dhcp) |
| `02-RouterOS基础(routeros-basics)/06-users.md` | 用户与权限 | Level 1 · 入门 | 01-第一台路由器(first-router) |
| `02-RouterOS基础(routeros-basics)/07-ntp.md` | NTP 时间 | Level 1 · 入门 | 01-第一台路由器(first-router) |
| `02-RouterOS基础(routeros-basics)/08-interface-lists.md` | Interface List | Level 1 · 入门 | 05-防火墙(firewall) |
| `02-RouterOS基础(routeros-basics)/09-vlan.md` | RouterOS 上的 VLAN 接口 | Level 1 · 入门 | 09-VLAN(vlan) |
| `03-DHCP与DNS(dhcp-dns)/00-dhcp-server.md` | DHCP 服务进阶 | Level 2 · 网络工程 | 02-LAN与DHCP(lan-dhcp) |
| `03-DHCP与DNS(dhcp-dns)/01-dhcp-client.md` | DHCP 客户端进阶 | Level 2 · 网络工程 | 02-LAN与DHCP(lan-dhcp) |
| `03-DHCP与DNS(dhcp-dns)/02-static-lease.md` | 静态租约 | Level 2 · 网络工程 | 02-LAN与DHCP(lan-dhcp) |
| `03-DHCP与DNS(dhcp-dns)/03-dns-forwarding.md` | DNS 转发 | Level 2 · 网络工程 | 02-LAN与DHCP(lan-dhcp) |
| `03-DHCP与DNS(dhcp-dns)/04-dns-cache.md` | DNS 缓存 | Level 2 · 网络工程 | 02-LAN与DHCP(lan-dhcp) |
| `03-DHCP与DNS(dhcp-dns)/05-split-dns.md` | Split DNS | Level 3 · 高级 | 02-LAN与DHCP(lan-dhcp) |
| `04-NAT(nat)/00-nat.md` | NAT 总览 | Level 2 · 网络工程 | 04-NAT(nat) |
| `04-NAT(nat)/01-masquerade.md` | Masquerade | Level 2 · 网络工程 | 04-NAT(nat) |
| `04-NAT(nat)/02-port-forward.md` | 端口映射 | Level 2 · 网络工程 | 04-NAT(nat) |
| `04-NAT(nat)/03-srcnat.md` | srcnat | Level 2 · 网络工程 | 04-NAT(nat) |
| `04-NAT(nat)/04-dstnat.md` | dstnat | Level 2 · 网络工程 | 04-NAT(nat) |
| `04-NAT(nat)/05-hairpin-nat.md` | Hairpin NAT | Level 2 · 网络工程 | 04-NAT(nat) |
| `04-NAT(nat)/06-nat-troubleshooting.md` | NAT 排错 | Level 2 · 网络工程 | 04-NAT(nat) |
| `05-防火墙(firewall)/00-firewall-concepts.md` | 防火墙概念 | Level 2 · 网络工程 | 05-防火墙(firewall) |
| `05-防火墙(firewall)/01-filter.md` | Firewall Filter | Level 2 · 网络工程 | 05-防火墙(firewall) |
| `05-防火墙(firewall)/02-connection-tracking.md` | 连接跟踪 | Level 2 · 网络工程 | 05-防火墙(firewall) |
| `05-防火墙(firewall)/03-fasttrack.md` | FastTrack | Level 2 · 网络工程 | 05-防火墙(firewall) |
| `05-防火墙(firewall)/04-address-list.md` | Address List | Level 2 · 网络工程 | 05-防火墙(firewall) |
| `05-防火墙(firewall)/05-nat.md` | Firewall 中的 NAT 位置 | Level 2 · 网络工程 | 04-NAT(nat) |
| `05-防火墙(firewall)/06-mangle.md` | Mangle | Level 3 · 高级 | 07-双WAN(dual-wan) |
| `05-防火墙(firewall)/07-raw.md` | Firewall Raw | Level 3 · 高级 | 05-防火墙(firewall) |
| `05-防火墙(firewall)/08-layer7.md` | Layer7 | Level 3 · 高级 | 05-防火墙(firewall) |
| `05-防火墙(firewall)/09-advanced-firewall.md` | 进阶防火墙 | Level 4 · 专家 | 05-防火墙(firewall) |
| `06-无线(wireless)/00-wireless-basics.md` | 无线基础 | Level 2 · 网络工程 | 01-第一台路由器(first-router) |
| `06-无线(wireless)/01-wifi.md` | wifi 包（v7） | Level 2 · 网络工程 | 01-第一台路由器(first-router) |
| `06-无线(wireless)/02-ssid.md` | SSID 与安全 | Level 2 · 网络工程 | 01-第一台路由器(first-router) |
| `06-无线(wireless)/03-roaming.md` | 漫游 | Level 3 · 高级 | 01-第一台路由器(first-router) |
| `06-无线(wireless)/04-wifiwave2.md` | wifiwave2 与过渡 | Level 2 · 网络工程 | 01-第一台路由器(first-router) |
| `06-无线(wireless)/05-capsman.md` | CAPsMAN | Level 3 · 高级 | 01-第一台路由器(first-router) |
| `07-VPN(vpn)/00-vpn-overview.md` | VPN 总览 | Level 2 · 网络工程 | 06-WireGuard(wireguard) |
| `07-VPN(vpn)/01-wireguard.md` | WireGuard | Level 3 · 高级 | 06-WireGuard(wireguard) |
| `07-VPN(vpn)/02-l2tp.md` | L2TP | Level 2 · 网络工程 | 06-WireGuard(wireguard) |
| `07-VPN(vpn)/03-sstp.md` | SSTP | Level 2 · 网络工程 | 06-WireGuard(wireguard) |
| `07-VPN(vpn)/04-ovpn.md` | OpenVPN | Level 2 · 网络工程 | 06-WireGuard(wireguard) |
| `07-VPN(vpn)/05-ipsec.md` | IPsec | Level 3 · 高级 | 06-WireGuard(wireguard) |
| `07-VPN(vpn)/06-gre.md` | GRE | Level 3 · 高级 | 06-WireGuard(wireguard) |
| `07-VPN(vpn)/07-eoip.md` | EoIP | Level 3 · 高级 | 06-WireGuard(wireguard) |
| `07-VPN(vpn)/08-vxlan.md` | VXLAN | Level 3 · 高级 | 06-WireGuard(wireguard) |
| `07-VPN(vpn)/09-pptp.md` | PPTP（不推荐） | Level 2 · 网络工程 | 06-WireGuard(wireguard) |
| `08-QoS(qos)/00-qos-concepts.md` | QoS 概念 | Level 2 · 网络工程 | 08-QoS(qos) |
| `08-QoS(qos)/01-simple-queue.md` | Simple Queue | Level 2 · 网络工程 | 08-QoS(qos) |
| `08-QoS(qos)/02-pcq.md` | PCQ | Level 3 · 高级 | 08-QoS(qos) |
| `08-QoS(qos)/03-queue-tree.md` | Queue Tree | Level 3 · 高级 | 08-QoS(qos) |
| `08-QoS(qos)/04-fq-codel.md` | FQ-CoDel | Level 3 · 高级 | 08-QoS(qos) |
| `08-QoS(qos)/05-cake.md` | CAKE | Level 3 · 高级 | 08-QoS(qos) |
| `08-QoS(qos)/06-qos-design.md` | QoS 设计 | Level 4 · 专家 | 08-QoS(qos) |
| `09-高可用(high-availability)/00-dual-wan.md` | 双 WAN | Level 3 · 高级 | 07-双WAN(dual-wan) |
| `09-高可用(high-availability)/01-failover.md` | 故障切换 | Level 3 · 高级 | 07-双WAN(dual-wan) |
| `09-高可用(high-availability)/02-load-balancing.md` | 负载均衡 | Level 3 · 高级 | 07-双WAN(dual-wan) |
| `09-高可用(high-availability)/03-vrrp.md` | VRRP | Level 4 · 专家 | 14-VRRP(vrrp) |
| `09-高可用(high-availability)/04-connection-tracking-sync.md` | 连接跟踪同步 | Level 4 · 专家 | 14-VRRP(vrrp) |
| `10-二层交换(switching)/00-bridge.md` | 二层 Bridge | Level 2 · 网络工程 | 09-VLAN(vlan) |
| `10-二层交换(switching)/01-access-port.md` | Access 端口 | Level 2 · 网络工程 | 09-VLAN(vlan) |
| `10-二层交换(switching)/02-trunk-port.md` | Trunk 端口 | Level 2 · 网络工程 | 09-VLAN(vlan) |
| `10-二层交换(switching)/03-vlan-filtering.md` | VLAN Filtering | Level 2 · 网络工程 | 09-VLAN(vlan) |
| `10-二层交换(switching)/04-bridge-vlan-table.md` | Bridge VLAN 表 | Level 2 · 网络工程 | 09-VLAN(vlan) |
| `10-二层交换(switching)/05-hybrid-port.md` | Hybrid 端口 | Level 2 · 网络工程 | 09-VLAN(vlan) |
| `10-二层交换(switching)/06-rstp.md` | RSTP | Level 2 · 网络工程 | 09-VLAN(vlan) |
| `10-二层交换(switching)/07-mstp.md` | MSTP | Level 2 · 网络工程 | 09-VLAN(vlan) |
| `10-二层交换(switching)/08-hardware-offload.md` | 交换芯片卸载 | Level 2 · 网络工程 | 09-VLAN(vlan) |
| `11-三层路由(routing)/00-routing-basics.md` | 路由基础 | Level 2 · 网络工程 | 10-跨VLAN路由(inter-vlan-routing) |
| `11-三层路由(routing)/01-default-route.md` | 默认路由 | Level 2 · 网络工程 | 04-NAT(nat) |
| `11-三层路由(routing)/02-static-route.md` | 静态路由 | Level 2 · 网络工程 | 10-跨VLAN路由(inter-vlan-routing) |
| `11-三层路由(routing)/03-routing-table.md` | 路由表 | Level 3 · 高级 | 13-VRF(vrf) |
| `11-三层路由(routing)/04-route-selection.md` | 路由选择 | Level 3 · 高级 | 11-OSPF(ospf) |
| `11-三层路由(routing)/05-ecmp.md` | ECMP | Level 3 · 高级 | 07-双WAN(dual-wan) |
| `11-三层路由(routing)/06-policy-routing.md` | 策略路由 | Level 3 · 高级 | 07-双WAN(dual-wan) |
| `11-三层路由(routing)/07-recursive-route.md` | 递归路由 | Level 3 · 高级 | 07-双WAN(dual-wan) |
| `11-三层路由(routing)/08-routing-rule.md` | Routing Rule | Level 3 · 高级 | 13-VRF(vrf) |
| `11-三层路由(routing)/09-vrf.md` | VRF | Level 3 · 高级 | 13-VRF(vrf) |
| `12-监控(monitoring)/00-logging.md` | 日志 | Level 2 · 网络工程 | 16-自动化(automation) |
| `12-监控(monitoring)/01-torch.md` | Torch | Level 2 · 网络工程 | 05-防火墙(firewall) |
| `12-监控(monitoring)/02-netwatch.md` | Netwatch 监控视角 | Level 3 · 高级 | 07-双WAN(dual-wan) |
| `12-监控(monitoring)/03-snmp.md` | SNMP | Level 3 · 高级 | 16-自动化(automation) |
| `12-监控(monitoring)/04-profiler.md` | CPU Profiler | Level 3 · 高级 | 01-第一台路由器(first-router) |
| `12-监控(monitoring)/05-traffic-flow.md` | Traffic Flow | Level 3 · 高级 | 16-自动化(automation) |
| `12-监控(monitoring)/06-monitoring-platform.md` | 监控平台 | Level 4 · 专家 | 16-自动化(automation) |
| `13-安全(security)/00-management-security.md` | 管理面安全 | Level 2 · 网络工程 | 05-防火墙(firewall) |
| `13-安全(security)/01-service-security.md` | 服务端口安全 | Level 2 · 网络工程 | 05-防火墙(firewall) |
| `13-安全(security)/02-brute-force-protection.md` | 暴力破解防护 | Level 2 · 网络工程 | 05-防火墙(firewall) |
| `13-安全(security)/03-ssh-hardening.md` | SSH 加固 | Level 2 · 网络工程 | 16-自动化(automation) |
| `13-安全(security)/04-user-permissions.md` | 权限模型 | Level 3 · 高级 | 16-自动化(automation) |
| `13-安全(security)/05-firewall-hardening.md` | 防火墙加固 | Level 3 · 高级 | 05-防火墙(firewall) |
| `13-安全(security)/06-certificates.md` | 证书 | Level 3 · 高级 | 06-WireGuard(wireguard) |
| `13-安全(security)/07-security-checklist.md` | 安全检查清单 | Level 4 · 专家 | 05-防火墙(firewall) |
| `14-故障排查(troubleshooting)/00-troubleshooting-methodology.md` | 排障方法论 | Level 2 · 网络工程 | 01-第一台路由器(first-router) |
| `14-故障排查(troubleshooting)/01-no-internet.md` | 不能上网 | Level 2 · 网络工程 | 04-NAT(nat) |
| `14-故障排查(troubleshooting)/02-dns-problem.md` | DNS 故障 | Level 2 · 网络工程 | 02-LAN与DHCP(lan-dhcp) |
| `14-故障排查(troubleshooting)/03-firewall-problem.md` | 防火墙故障 | Level 2 · 网络工程 | 05-防火墙(firewall) |
| `14-故障排查(troubleshooting)/04-routing-problem.md` | 路由故障 | Level 3 · 高级 | 11-OSPF(ospf) |
| `14-故障排查(troubleshooting)/05-mtu-problem.md` | MTU 故障 | Level 3 · 高级 | 06-WireGuard(wireguard) |
| `14-故障排查(troubleshooting)/06-vlan-problem.md` | VLAN 故障 | Level 2 · 网络工程 | 09-VLAN(vlan) |
| `14-故障排查(troubleshooting)/07-performance-problem.md` | 性能故障 | Level 3 · 高级 | 08-QoS(qos) |
| `14-故障排查(troubleshooting)/08-packet-analysis.md` | 抓包分析 | Level 3 · 高级 | 05-防火墙(firewall) |
| `15-性能优化(performance)/00-fasttrack.md` | FastTrack 性能 | Level 3 · 高级 | 05-防火墙(firewall) |
| `15-性能优化(performance)/01-fastpath.md` | FastPath | Level 3 · 高级 | 05-防火墙(firewall) |
| `15-性能优化(performance)/02-cpu.md` | CPU | Level 3 · 高级 | 01-第一台路由器(first-router) |
| `15-性能优化(performance)/03-memory.md` | 内存 | Level 3 · 高级 | 01-第一台路由器(first-router) |
| `15-性能优化(performance)/04-hardware-offload.md` | 硬件卸载（性能） | Level 3 · 高级 | 09-VLAN(vlan) |
| `15-性能优化(performance)/05-queues-performance.md` | 队列与性能 | Level 3 · 高级 | 08-QoS(qos) |
| `15-性能优化(performance)/06-performance-tuning.md` | 性能调优 | Level 4 · 专家 | 08-QoS(qos) |
| `16-自动化(automation)/00-scheduler.md` | Scheduler | Level 3 · 高级 | 16-自动化(automation) |
| `16-自动化(automation)/01-netwatch.md` | Netwatch | Level 3 · 高级 | 07-双WAN(dual-wan) |
| `16-自动化(automation)/02-scripting.md` | RouterOS Script | Level 3 · 高级 | 16-自动化(automation) |
| `16-自动化(automation)/03-ssh.md` | SSH 自动化 | Level 3 · 高级 | 16-自动化(automation) |
| `16-自动化(automation)/04-api.md` | API | Level 3 · 高级 | 16-自动化(automation) |
| `16-自动化(automation)/05-rest-api.md` | REST API | Level 3 · 高级 | 16-自动化(automation) |
| `16-自动化(automation)/06-automation-design.md` | 自动化设计 | Level 4 · 专家 | 16-自动化(automation) |
| `17-生产环境(production)/00-backup.md` | 备份 | Level 2 · 网络工程 | 16-自动化(automation) |
| `17-生产环境(production)/01-restore.md` | 恢复 | Level 2 · 网络工程 | 16-自动化(automation) |
| `17-生产环境(production)/02-upgrade.md` | 升级 | Level 3 · 高级 | 01-第一台路由器(first-router) |
| `17-生产环境(production)/03-rollback.md` | 回滚 | Level 3 · 高级 | 01-第一台路由器(first-router) |
| `17-生产环境(production)/04-deployment.md` | 部署 | Level 4 · 专家 | 01-第一台路由器(first-router) |
| `17-生产环境(production)/05-configuration-management.md` | 配置管理 | Level 4 · 专家 | 16-自动化(automation) |
| `17-生产环境(production)/06-production-checklist.md` | 生产检查清单 | Level 4 · 专家 | 16-自动化(automation) |
| `18-动态路由(dynamic-routing)/00-ospf.md` | OSPF（v7） | Level 3 · 高级 | 11-OSPF(ospf) |
| `18-动态路由(dynamic-routing)/01-ospfv3.md` | OSPFv3 | Level 3 · 高级 | 11-OSPF(ospf) |
| `18-动态路由(dynamic-routing)/02-rip.md` | RIP | Level 2 · 网络工程 | 11-OSPF(ospf) |
| `18-动态路由(dynamic-routing)/03-bgp.md` | BGP | Level 3 · 高级 | 12-BGP(bgp) |
| `18-动态路由(dynamic-routing)/04-bfd.md` | BFD | Level 3 · 高级 | 11-OSPF(ospf) |
| `18-动态路由(dynamic-routing)/05-routing-filters.md` | Routing Filter | Level 4 · 专家 | 12-BGP(bgp) |
| `18-动态路由(dynamic-routing)/06-bgp-policy.md` | BGP 策略 | Level 4 · 专家 | 12-BGP(bgp) |
| `18-动态路由(dynamic-routing)/07-communities.md` | BGP Community | Level 4 · 专家 | 12-BGP(bgp) |
| `18-动态路由(dynamic-routing)/08-rpki.md` | RPKI | Level 4 · 专家 | 12-BGP(bgp) |
| `19-MPLS(mpls)/00-mpls-basics.md` | MPLS 基础 | Level 4 · 专家 | 15-MPLS(mpls) |
| `19-MPLS(mpls)/01-ldp.md` | LDP | Level 4 · 专家 | 15-MPLS(mpls) |
| `19-MPLS(mpls)/02-l3vpn.md` | L3VPN | Level 4 · 专家 | 15-MPLS(mpls) |
| `19-MPLS(mpls)/03-traffic-engineering.md` | 流量工程 | Level 4 · 专家 | 15-MPLS(mpls) |
| `20-高级(advanced)/00-architecture.md` | 网络架构方法 | Level 4 · 专家 | 13-VRF(vrf) |
| `20-高级(advanced)/01-network-segmentation.md` | 网络隔离 | Level 4 · 专家 | 05-防火墙(firewall) |
| `20-高级(advanced)/02-enterprise-network.md` | 企业网 | Level 4 · 专家 | 14-VRRP(vrrp) |
| `20-高级(advanced)/03-multi-wan-architecture.md` | 多 WAN 架构 | Level 4 · 专家 | 07-双WAN(dual-wan) |
| `20-高级(advanced)/04-multi-vrf.md` | 多 VRF | Level 4 · 专家 | 13-VRF(vrf) |
| `20-高级(advanced)/05-bgp-design.md` | BGP 设计 | Level 4 · 专家 | 12-BGP(bgp) |
| `20-高级(advanced)/06-isp-design.md` | ISP 设计 | Level 4 · 专家 | 12-BGP(bgp) |
| `20-高级(advanced)/07-service-provider.md` | 运营商视角 | Level 4 · 专家 | 12-BGP(bgp) |
| `20-高级(advanced)/08-large-scale-deployment.md` | 规模化部署 | Level 4 · 专家 | 16-自动化(automation) |
