# 课程树（0 → 100）

主线 RouterOS v7。学习目标、前置知识写在各课文文首。

| 文件 | 标题 | 难度 | Lab |
| --- | --- | --- | --- |
| `00-introduction/cli-basics.md` | CLI 基础 | Level 1 · 入门 | 01-first-router |
| `00-introduction/routeros-architecture.md` | RouterOS 体系结构 | Level 1 · 入门 | 01-first-router |
| `00-introduction/routeros-menu.md` | RouterOS 菜单体系 | Level 1 · 入门 | 01-first-router |
| `00-introduction/routeros-v7.md` | RouterOS v7 主线 | Level 1 · 入门 | 01-first-router |
| `00-introduction/webfig.md` | WebFig | Level 1 · 入门 | 01-first-router |
| `00-introduction/what-is-routeros.md` | RouterOS 是什么 | Level 1 · 入门 | 01-first-router |
| `00-introduction/winbox.md` | WinBox | Level 1 · 入门 | 01-first-router |
| `01-networking-basics/arp.md` | ARP | Level 0 · 网络基础 | 01-first-router |
| `01-networking-basics/dns.md` | DNS 原理 | Level 0 · 网络基础 | 02-lan-dhcp |
| `01-networking-basics/ethernet.md` | 以太网 | Level 0 · 网络基础 | 01-first-router |
| `01-networking-basics/icmp.md` | ICMP | Level 0 · 网络基础 | 01-first-router |
| `01-networking-basics/ipv4.md` | IPv4 | Level 0 · 网络基础 | 02-lan-dhcp |
| `01-networking-basics/ipv6.md` | IPv6 | Level 0 · 网络基础 | 02-lan-dhcp |
| `01-networking-basics/osi-tcpip.md` | OSI 与 TCP/IP | Level 0 · 网络基础 | 01-first-router |
| `01-networking-basics/subnetting.md` | 子网划分 | Level 0 · 网络基础 | 03-vlan |
| `01-networking-basics/vlan.md` | VLAN 原理 | Level 0 · 网络基础 | 03-vlan |
| `02-routeros-basics/bridge.md` | Bridge 入门 | Level 1 · 入门 | 02-lan-dhcp |
| `02-routeros-basics/dhcp-client.md` | DHCP Client | Level 1 · 入门 | 02-lan-dhcp |
| `02-routeros-basics/dhcp-server.md` | DHCP Server | Level 1 · 入门 | 02-lan-dhcp |
| `02-routeros-basics/dns.md` | RouterOS DNS | Level 1 · 入门 | 02-lan-dhcp |
| `02-routeros-basics/interface-lists.md` | Interface List | Level 1 · 入门 | 05-firewall |
| `02-routeros-basics/interfaces.md` | 接口 | Level 1 · 入门 | 01-first-router |
| `02-routeros-basics/ip-address.md` | IP 地址 | Level 1 · 入门 | 02-lan-dhcp |
| `02-routeros-basics/ntp.md` | NTP 时间 | Level 1 · 入门 | 01-first-router |
| `02-routeros-basics/users.md` | 用户与权限 | Level 1 · 入门 | 01-first-router |
| `02-routeros-basics/vlan.md` | RouterOS 上的 VLAN 接口 | Level 1 · 入门 | 03-vlan |
| `03-switching/access-port.md` | Access 端口 | Level 2 · 网络工程 | 03-vlan |
| `03-switching/bridge.md` | 二层 Bridge | Level 2 · 网络工程 | 03-vlan |
| `03-switching/bridge-vlan-table.md` | Bridge VLAN 表 | Level 2 · 网络工程 | 03-vlan |
| `03-switching/hardware-offload.md` | 交换芯片卸载 | Level 2 · 网络工程 | 03-vlan |
| `03-switching/hybrid-port.md` | Hybrid 端口 | Level 2 · 网络工程 | 03-vlan |
| `03-switching/mstp.md` | MSTP | Level 2 · 网络工程 | 03-vlan |
| `03-switching/rstp.md` | RSTP | Level 2 · 网络工程 | 03-vlan |
| `03-switching/trunk-port.md` | Trunk 端口 | Level 2 · 网络工程 | 03-vlan |
| `03-switching/vlan-filtering.md` | VLAN Filtering | Level 2 · 网络工程 | 03-vlan |
| `04-routing/default-route.md` | 默认路由 | Level 2 · 网络工程 | 06-nat |
| `04-routing/ecmp.md` | ECMP | Level 3 · 高级 | 07-dual-wan |
| `04-routing/policy-routing.md` | 策略路由 | Level 3 · 高级 | 07-dual-wan |
| `04-routing/recursive-route.md` | 递归路由 | Level 3 · 高级 | 07-dual-wan |
| `04-routing/route-selection.md` | 路由选择 | Level 3 · 高级 | 09-ospf |
| `04-routing/routing-basics.md` | 路由基础 | Level 2 · 网络工程 | 04-inter-vlan-routing |
| `04-routing/routing-rule.md` | Routing Rule | Level 3 · 高级 | 11-vrf |
| `04-routing/routing-table.md` | 路由表 | Level 3 · 高级 | 11-vrf |
| `04-routing/static-route.md` | 静态路由 | Level 2 · 网络工程 | 04-inter-vlan-routing |
| `04-routing/vrf.md` | VRF | Level 3 · 高级 | 11-vrf |
| `05-firewall/address-list.md` | Address List | Level 2 · 网络工程 | 05-firewall |
| `05-firewall/advanced-firewall.md` | 进阶防火墙 | Level 4 · 专家 | 05-firewall |
| `05-firewall/connection-tracking.md` | 连接跟踪 | Level 2 · 网络工程 | 05-firewall |
| `05-firewall/fasttrack.md` | FastTrack | Level 2 · 网络工程 | 05-firewall |
| `05-firewall/filter.md` | Firewall Filter | Level 2 · 网络工程 | 05-firewall |
| `05-firewall/firewall-concepts.md` | 防火墙概念 | Level 2 · 网络工程 | 05-firewall |
| `05-firewall/layer7.md` | Layer7 | Level 3 · 高级 | 05-firewall |
| `05-firewall/mangle.md` | Mangle | Level 3 · 高级 | 07-dual-wan |
| `05-firewall/nat.md` | Firewall 中的 NAT 位置 | Level 2 · 网络工程 | 06-nat |
| `05-firewall/raw.md` | Firewall Raw | Level 3 · 高级 | 05-firewall |
| `06-nat/dstnat.md` | dstnat | Level 2 · 网络工程 | 06-nat |
| `06-nat/hairpin-nat.md` | Hairpin NAT | Level 2 · 网络工程 | 06-nat |
| `06-nat/masquerade.md` | Masquerade | Level 2 · 网络工程 | 06-nat |
| `06-nat/nat.md` | NAT 总览 | Level 2 · 网络工程 | 06-nat |
| `06-nat/nat-troubleshooting.md` | NAT 排错 | Level 2 · 网络工程 | 06-nat |
| `06-nat/port-forward.md` | 端口映射 | Level 2 · 网络工程 | 06-nat |
| `06-nat/srcnat.md` | srcnat | Level 2 · 网络工程 | 06-nat |
| `07-dhcp-dns/dhcp-client.md` | DHCP 客户端进阶 | Level 2 · 网络工程 | 02-lan-dhcp |
| `07-dhcp-dns/dhcp-server.md` | DHCP 服务进阶 | Level 2 · 网络工程 | 02-lan-dhcp |
| `07-dhcp-dns/dns-cache.md` | DNS 缓存 | Level 2 · 网络工程 | 02-lan-dhcp |
| `07-dhcp-dns/dns-forwarding.md` | DNS 转发 | Level 2 · 网络工程 | 02-lan-dhcp |
| `07-dhcp-dns/split-dns.md` | Split DNS | Level 3 · 高级 | 02-lan-dhcp |
| `07-dhcp-dns/static-lease.md` | 静态租约 | Level 2 · 网络工程 | 02-lan-dhcp |
| `08-wireless/capsman.md` | CAPsMAN | Level 3 · 高级 | 01-first-router |
| `08-wireless/roaming.md` | 漫游 | Level 3 · 高级 | 01-first-router |
| `08-wireless/ssid.md` | SSID 与安全 | Level 2 · 网络工程 | 01-first-router |
| `08-wireless/wifi.md` | wifi 包（v7） | Level 2 · 网络工程 | 01-first-router |
| `08-wireless/wifiwave2.md` | wifiwave2 与过渡 | Level 2 · 网络工程 | 01-first-router |
| `08-wireless/wireless-basics.md` | 无线基础 | Level 2 · 网络工程 | 01-first-router |
| `09-vpn/eoip.md` | EoIP | Level 3 · 高级 | 08-wireguard |
| `09-vpn/gre.md` | GRE | Level 3 · 高级 | 08-wireguard |
| `09-vpn/ipsec.md` | IPsec | Level 3 · 高级 | 08-wireguard |
| `09-vpn/l2tp.md` | L2TP | Level 2 · 网络工程 | 08-wireguard |
| `09-vpn/ovpn.md` | OpenVPN | Level 2 · 网络工程 | 08-wireguard |
| `09-vpn/pptp.md` | PPTP（不推荐） | Level 2 · 网络工程 | 08-wireguard |
| `09-vpn/sstp.md` | SSTP | Level 2 · 网络工程 | 08-wireguard |
| `09-vpn/vpn-overview.md` | VPN 总览 | Level 2 · 网络工程 | 08-wireguard |
| `09-vpn/vxlan.md` | VXLAN | Level 3 · 高级 | 08-wireguard |
| `09-vpn/wireguard.md` | WireGuard | Level 3 · 高级 | 08-wireguard |
| `10-dynamic-routing/bfd.md` | BFD | Level 3 · 高级 | 09-ospf |
| `10-dynamic-routing/bgp.md` | BGP | Level 3 · 高级 | 10-bgp |
| `10-dynamic-routing/bgp-policy.md` | BGP 策略 | Level 4 · 专家 | 10-bgp |
| `10-dynamic-routing/communities.md` | BGP Community | Level 4 · 专家 | 10-bgp |
| `10-dynamic-routing/ospf.md` | OSPF（v7） | Level 3 · 高级 | 09-ospf |
| `10-dynamic-routing/ospfv3.md` | OSPFv3 | Level 3 · 高级 | 09-ospf |
| `10-dynamic-routing/rip.md` | RIP | Level 2 · 网络工程 | 09-ospf |
| `10-dynamic-routing/routing-filters.md` | Routing Filter | Level 4 · 专家 | 10-bgp |
| `10-dynamic-routing/rpki.md` | RPKI | Level 4 · 专家 | 10-bgp |
| `11-qos/cake.md` | CAKE | Level 3 · 高级 | 12-qos |
| `11-qos/fq-codel.md` | FQ-CoDel | Level 3 · 高级 | 12-qos |
| `11-qos/pcq.md` | PCQ | Level 3 · 高级 | 12-qos |
| `11-qos/qos-concepts.md` | QoS 概念 | Level 2 · 网络工程 | 12-qos |
| `11-qos/qos-design.md` | QoS 设计 | Level 4 · 专家 | 12-qos |
| `11-qos/queue-tree.md` | Queue Tree | Level 3 · 高级 | 12-qos |
| `11-qos/simple-queue.md` | Simple Queue | Level 2 · 网络工程 | 12-qos |
| `12-high-availability/connection-tracking-sync.md` | 连接跟踪同步 | Level 4 · 专家 | 13-vrrp |
| `12-high-availability/dual-wan.md` | 双 WAN | Level 3 · 高级 | 07-dual-wan |
| `12-high-availability/failover.md` | 故障切换 | Level 3 · 高级 | 07-dual-wan |
| `12-high-availability/load-balancing.md` | 负载均衡 | Level 3 · 高级 | 07-dual-wan |
| `12-high-availability/vrrp.md` | VRRP | Level 4 · 专家 | 13-vrrp |
| `13-mpls/l3vpn.md` | L3VPN | Level 4 · 专家 | 14-mpls |
| `13-mpls/ldp.md` | LDP | Level 4 · 专家 | 14-mpls |
| `13-mpls/mpls-basics.md` | MPLS 基础 | Level 4 · 专家 | 14-mpls |
| `13-mpls/traffic-engineering.md` | 流量工程 | Level 4 · 专家 | 14-mpls |
| `14-automation/api.md` | API | Level 3 · 高级 | 15-automation |
| `14-automation/automation-design.md` | 自动化设计 | Level 4 · 专家 | 15-automation |
| `14-automation/netwatch.md` | Netwatch | Level 3 · 高级 | 07-dual-wan |
| `14-automation/rest-api.md` | REST API | Level 3 · 高级 | 15-automation |
| `14-automation/scheduler.md` | Scheduler | Level 3 · 高级 | 15-automation |
| `14-automation/scripting.md` | RouterOS Script | Level 3 · 高级 | 15-automation |
| `14-automation/ssh.md` | SSH 自动化 | Level 3 · 高级 | 15-automation |
| `15-monitoring/logging.md` | 日志 | Level 2 · 网络工程 | 15-automation |
| `15-monitoring/monitoring-platform.md` | 监控平台 | Level 4 · 专家 | 15-automation |
| `15-monitoring/netwatch.md` | Netwatch 监控视角 | Level 3 · 高级 | 07-dual-wan |
| `15-monitoring/profiler.md` | CPU Profiler | Level 3 · 高级 | 01-first-router |
| `15-monitoring/snmp.md` | SNMP | Level 3 · 高级 | 15-automation |
| `15-monitoring/torch.md` | Torch | Level 2 · 网络工程 | 05-firewall |
| `15-monitoring/traffic-flow.md` | Traffic Flow | Level 3 · 高级 | 15-automation |
| `16-security/brute-force-protection.md` | 暴力破解防护 | Level 2 · 网络工程 | 05-firewall |
| `16-security/certificates.md` | 证书 | Level 3 · 高级 | 08-wireguard |
| `16-security/firewall-hardening.md` | 防火墙加固 | Level 3 · 高级 | 05-firewall |
| `16-security/management-security.md` | 管理面安全 | Level 2 · 网络工程 | 05-firewall |
| `16-security/security-checklist.md` | 安全检查清单 | Level 4 · 专家 | 05-firewall |
| `16-security/service-security.md` | 服务端口安全 | Level 2 · 网络工程 | 05-firewall |
| `16-security/ssh-hardening.md` | SSH 加固 | Level 2 · 网络工程 | 15-automation |
| `16-security/user-permissions.md` | 权限模型 | Level 3 · 高级 | 15-automation |
| `17-troubleshooting/dns-problem.md` | DNS 故障 | Level 2 · 网络工程 | 02-lan-dhcp |
| `17-troubleshooting/firewall-problem.md` | 防火墙故障 | Level 2 · 网络工程 | 05-firewall |
| `17-troubleshooting/mtu-problem.md` | MTU 故障 | Level 3 · 高级 | 08-wireguard |
| `17-troubleshooting/no-internet.md` | 不能上网 | Level 2 · 网络工程 | 06-nat |
| `17-troubleshooting/packet-analysis.md` | 抓包分析 | Level 3 · 高级 | 05-firewall |
| `17-troubleshooting/performance-problem.md` | 性能故障 | Level 3 · 高级 | 12-qos |
| `17-troubleshooting/routing-problem.md` | 路由故障 | Level 3 · 高级 | 09-ospf |
| `17-troubleshooting/troubleshooting-methodology.md` | 排障方法论 | Level 2 · 网络工程 | 01-first-router |
| `17-troubleshooting/vlan-problem.md` | VLAN 故障 | Level 2 · 网络工程 | 03-vlan |
| `18-performance/cpu.md` | CPU | Level 3 · 高级 | 01-first-router |
| `18-performance/fastpath.md` | FastPath | Level 3 · 高级 | 05-firewall |
| `18-performance/fasttrack.md` | FastTrack 性能 | Level 3 · 高级 | 05-firewall |
| `18-performance/hardware-offload.md` | 硬件卸载（性能） | Level 3 · 高级 | 03-vlan |
| `18-performance/memory.md` | 内存 | Level 3 · 高级 | 01-first-router |
| `18-performance/performance-tuning.md` | 性能调优 | Level 4 · 专家 | 12-qos |
| `18-performance/queues-performance.md` | 队列与性能 | Level 3 · 高级 | 12-qos |
| `19-production/backup.md` | 备份 | Level 2 · 网络工程 | 15-automation |
| `19-production/configuration-management.md` | 配置管理 | Level 4 · 专家 | 15-automation |
| `19-production/deployment.md` | 部署 | Level 4 · 专家 | 01-first-router |
| `19-production/production-checklist.md` | 生产检查清单 | Level 4 · 专家 | 15-automation |
| `19-production/restore.md` | 恢复 | Level 2 · 网络工程 | 15-automation |
| `19-production/rollback.md` | 回滚 | Level 3 · 高级 | 01-first-router |
| `19-production/upgrade.md` | 升级 | Level 3 · 高级 | 01-first-router |
| `20-advanced/architecture.md` | 网络架构方法 | Level 4 · 专家 | 11-vrf |
| `20-advanced/bgp-design.md` | BGP 设计 | Level 4 · 专家 | 10-bgp |
| `20-advanced/enterprise-network.md` | 企业网 | Level 4 · 专家 | 13-vrrp |
| `20-advanced/isp-design.md` | ISP 设计 | Level 4 · 专家 | 10-bgp |
| `20-advanced/large-scale-deployment.md` | 规模化部署 | Level 4 · 专家 | 15-automation |
| `20-advanced/multi-vrf.md` | 多 VRF | Level 4 · 专家 | 11-vrf |
| `20-advanced/multi-wan-architecture.md` | 多 WAN 架构 | Level 4 · 专家 | 07-dual-wan |
| `20-advanced/network-segmentation.md` | 网络隔离 | Level 4 · 专家 | 05-firewall |
| `20-advanced/service-provider.md` | 运营商视角 | Level 4 · 专家 | 10-bgp |
