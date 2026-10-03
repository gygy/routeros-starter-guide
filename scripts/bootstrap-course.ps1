# One-shot scaffold: workspace docs tree + GitHub course tree
$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent $PSScriptRoot
$Course = $Root
$Utf8 = New-Object System.Text.UTF8Encoding $false

function Write-File([string]$Path, [string]$Content) {
    $dir = Split-Path -Parent $Path
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Force -Path $dir | Out-Null
    }
    [System.IO.File]::WriteAllText($Path, $Content.TrimEnd() + "`n", $Utf8)
}

function Ensure-Gitkeep([string]$Dir) {
    if (-not (Test-Path $Dir)) {
        New-Item -ItemType Directory -Force -Path $Dir | Out-Null
    }
    $keep = Join-Path $Dir ".gitkeep"
    if (-not (Test-Path $keep)) {
        [System.IO.File]::WriteAllText($keep, "", $Utf8)
    }
}

# --- workspace docs (nine-stage) ---
$wsDirs = @(
    "docs\01-规划 Planning\01-市场分析 Market",
    "docs\01-规划 Planning\02-产品规划 Product",
    "docs\01-规划 Planning\03-产品路线 Roadmap",
    "docs\01-规划 Planning\04-竞品分析 Competitor",
    "docs\01-规划 Planning\05-分析汇报 Report",
    "docs\02-输入 Input\01-原始需求 Raw",
    "docs\02-输入 Input\02-客户需求 Customer",
    "docs\02-输入 Input\03-业务资料 Business",
    "docs\02-输入 Input\04-现场资料 Site",
    "docs\02-输入 Input\05-历史资料 History",
    "docs\03-分析 Analysis\01-需求分析 Requirement",
    "docs\03-分析 Analysis\02-业务分析 Business",
    "docs\03-分析 Analysis\03-现状分析 As-Is",
    "docs\03-分析 Analysis\04-问题分析 Problem",
    "docs\03-分析 Analysis\05-竞品分析 Competitor",
    "docs\04-方案 Solution\01-业务方案 Business",
    "docs\04-方案 Solution\02-产品方案 Product",
    "docs\04-方案 Solution\03-流程设计 Flow",
    "docs\04-方案 Solution\04-原型设计 Prototype",
    "docs\04-方案 Solution\05-技术方案 Technical",
    "docs\05-需求 Requirement\01-业务需求 BRD",
    "docs\05-需求 Requirement\02-产品需求 PRD",
    "docs\05-需求 Requirement\03-需求规格 Spec",
    "docs\05-需求 Requirement\04-需求确认 Review",
    "docs\05-需求 Requirement\05-需求变更 Change",
    "docs\06-执行 Execution\01-研发任务 Tasks",
    "docs\06-执行 Execution\02-研发跟踪 Tracking",
    "docs\06-执行 Execution\03-版本管理 Release",
    "docs\06-执行 Execution\04-版本验收 Acceptance",
    "docs\07-验证 Verification\01-测试用例 Test Cases",
    "docs\07-验证 Verification\02-测试记录 Test Records",
    "docs\07-验证 Verification\03-问题缺陷 Issues",
    "docs\07-验证 Verification\04-验收报告 Acceptance",
    "docs\08-交付 Delivery\01-用户手册 Manual",
    "docs\08-交付 Delivery\02-产品FAQ FAQ",
    "docs\08-交付 Delivery\03-发布说明 Release Notes",
    "docs\08-交付 Delivery\04-交付资料 Deliverables",
    "docs\09-知识 Knowledge\01-业务知识 Business",
    "docs\09-知识 Knowledge\02-产品知识 Product",
    "docs\09-知识 Knowledge\03-工程知识 Engineering",
    "docs\09-知识 Knowledge\04-经验总结 Lessons",
    "docs\09-知识 Knowledge\05-知识库 Knowledge Base",
    "docs\10-技术 Technical\01-接口 API",
    "docs\10-技术 Technical\02-数据 Data",
    "docs\10-技术 Technical\03-依赖 Dependencies",
    "docs\10-技术 Technical\04-运维 Ops",
    "docs\10-技术 Technical\05-SQL SQL",
    "docs\99-收件 Inbox\01-待分类 Unsorted",
    "docs\99-收件 Inbox\02-临时 Temp",
    "docs\99-收件 Inbox\03-留存 Leave"
)
foreach ($d in $wsDirs) { Ensure-Gitkeep (Join-Path $Root $d) }

function New-Article([string]$Rel, [string]$Title, [string]$Level, [string]$Prereq, [string]$Lab, [string]$Goals) {
    $labLink = if ($Lab -and $Lab -ne "无") { "[$Lab](../../labs/$Lab/README.md)" } else { "本章以阅读为主，可先完成最近的 Lab" }
    @"
# $Title

> 主线：**RouterOS v7**  
> 难度：$Level  
> 前置：$Prereq  
> 对应 Lab：$labLink  
> 学习目标：$Goals

本文按统一模板组织：原理 → RouterOS 实现 → 案例 → 故障 → 性能/安全 → Lab。不要把本章写成命令堆积。

## 1. 是什么？

（待写）

## 2. 为什么需要它？

（待写）

## 3. 工作原理

（待写）

## 4. Packet Flow

结合 [MikroTik Packet Flow](https://help.mikrotik.com/docs/spaces/ROS/pages/328206/Packet+Flow) 说明本主题在哪一层被处理。

（待写）

## 5. RouterOS 配置

全部示例默认 **RouterOS 7.x**（`/routing` instance、filter、REST API 等按 v7 语义）。

（待写）

## 6. 基础案例

（待写）

## 7. 企业案例

（待写）

## 8. 常见错误

（待写）

## 9. 故障排查

（待写）

## 10. 性能影响

（待写）

## 11. 安全注意事项

（待写）

## 12. Lab

$labLink

## 13. 常用命令

（待写）

## 14. 延伸阅读

- [MikroTik Help](https://help.mikrotik.com/docs/spaces/ROS/overview)
"@
}

$articles = @(
    @{ Rel="00-入门(introduction)/what-is-routeros.md"; Title="RouterOS 是什么"; Level="Level 1 · 入门"; Prereq="无"; Lab="01-第一台路由器(first-router)"; Goals="能说明 RouterOS 定位、许可与典型部署场景" },
    @{ Rel="00-入门(introduction)/routeros-v7.md"; Title="RouterOS v7 主线"; Level="Level 1 · 入门"; Prereq="[RouterOS 是什么](what-is-routeros.md)"; Lab="01-第一台路由器(first-router)"; Goals="知道 v7 相对 v6 在路由、VPN、API 上的关键差异，后续课程全部按 v7" },
    @{ Rel="00-入门(introduction)/routeros-architecture.md"; Title="RouterOS 体系结构"; Level="Level 1 · 入门"; Prereq="[v7 主线](routeros-v7.md)"; Lab="01-第一台路由器(first-router)"; Goals="理解 Linux 内核、包转发路径、配置存储方式" },
    @{ Rel="00-入门(introduction)/routeros-menu.md"; Title="RouterOS 菜单体系"; Level="Level 1 · 入门"; Prereq="[体系结构](routeros-architecture.md)"; Lab="01-第一台路由器(first-router)"; Goals="能在 CLI/WinBox 中定位 Interface、IP、Routing、Firewall" },
    @{ Rel="00-入门(introduction)/cli-basics.md"; Title="CLI 基础"; Level="Level 1 · 入门"; Prereq="[菜单体系](routeros-menu.md)"; Lab="01-第一台路由器(first-router)"; Goals="掌握路径、打印、编辑、安全模式与脚本注释" },
    @{ Rel="00-入门(introduction)/winbox.md"; Title="WinBox"; Level="Level 1 · 入门"; Prereq="[CLI 基础](cli-basics.md)"; Lab="01-第一台路由器(first-router)"; Goals="用 WinBox 完成首次登录、邻居发现与基本配置对照" },
    @{ Rel="00-入门(introduction)/webfig.md"; Title="WebFig"; Level="Level 1 · 入门"; Prereq="[WinBox](winbox.md)"; Lab="01-第一台路由器(first-router)"; Goals="知道 WebFig 适用场景与相对 WinBox 的限制" },
    @{ Rel="01-网络基础(networking-basics)/osi-tcpip.md"; Title="OSI 与 TCP/IP"; Level="Level 0 · 网络基础"; Prereq="无"; Lab="01-第一台路由器(first-router)"; Goals="能把二层/三层/四层映射到后续 RouterOS 功能" },
    @{ Rel="01-网络基础(networking-basics)/ethernet.md"; Title="以太网"; Level="Level 0 · 网络基础"; Prereq="[OSI](osi-tcpip.md)"; Lab="01-第一台路由器(first-router)"; Goals="理解 MAC、帧、交换与碰撞域" },
    @{ Rel="01-网络基础(networking-basics)/arp.md"; Title="ARP"; Level="Level 0 · 网络基础"; Prereq="[以太网](ethernet.md)"; Lab="01-第一台路由器(first-router)"; Goals="能解释 ARP 请求/应答及 Proxy ARP 风险" },
    @{ Rel="01-网络基础(networking-basics)/vlan.md"; Title="VLAN 原理"; Level="Level 0 · 网络基础"; Prereq="[以太网](ethernet.md)"; Lab="03-VLAN(vlan)"; Goals="理解 802.1Q、Access/Trunk 与广播域分割" },
    @{ Rel="01-网络基础(networking-basics)/ipv4.md"; Title="IPv4"; Level="Level 0 · 网络基础"; Prereq="[OSI](osi-tcpip.md)"; Lab="02-LAN与DHCP(lan-dhcp)"; Goals="掌握地址、掩码、网关与单播/组播/广播" },
    @{ Rel="01-网络基础(networking-basics)/ipv6.md"; Title="IPv6"; Level="Level 0 · 网络基础"; Prereq="[IPv4](ipv4.md)"; Lab="02-LAN与DHCP(lan-dhcp)"; Goals="了解地址类型、SLAAC/DHCPv6 与 RouterOS 启用要点" },
    @{ Rel="01-网络基础(networking-basics)/subnetting.md"; Title="子网划分"; Level="Level 0 · 网络基础"; Prereq="[IPv4](ipv4.md)"; Lab="03-VLAN(vlan)"; Goals="能按业务划分网段并计算可用主机" },
    @{ Rel="01-网络基础(networking-basics)/icmp.md"; Title="ICMP"; Level="Level 0 · 网络基础"; Prereq="[IPv4](ipv4.md)"; Lab="01-第一台路由器(first-router)"; Goals="用 ping/traceroute 判断可达性，理解被防火墙丢弃时的现象" },
    @{ Rel="01-网络基础(networking-basics)/dns.md"; Title="DNS 原理"; Level="Level 0 · 网络基础"; Prereq="[IPv4](ipv4.md)"; Lab="02-LAN与DHCP(lan-dhcp)"; Goals="理解递归、缓存、转发，以及能 ping IP 但不能上网的原因" },
    @{ Rel="02-RouterOS基础(routeros-basics)/interfaces.md"; Title="接口"; Level="Level 1 · 入门"; Prereq="[CLI](../00-入门(introduction)/cli-basics.md)"; Lab="01-第一台路由器(first-router)"; Goals="能识别 ether/wlan/bridge/vlan/pppoe 等接口并看状态" },
    @{ Rel="02-RouterOS基础(routeros-basics)/interface-lists.md"; Title="Interface List"; Level="Level 1 · 入门"; Prereq="[接口](interfaces.md)"; Lab="05-防火墙(firewall)"; Goals="用 WAN/LAN list 驱动防火墙与发现，而不是写死端口名" },
    @{ Rel="02-RouterOS基础(routeros-basics)/bridge.md"; Title="Bridge 入门"; Level="Level 1 · 入门"; Prereq="[接口](interfaces.md)"; Lab="02-LAN与DHCP(lan-dhcp)"; Goals="把多个 ether 组成 LAN 网桥，理解与交换机的关系" },
    @{ Rel="02-RouterOS基础(routeros-basics)/vlan.md"; Title="RouterOS 上的 VLAN 接口"; Level="Level 1 · 入门"; Prereq="[VLAN 原理](../01-网络基础(networking-basics)/vlan.md)"; Lab="03-VLAN(vlan)"; Goals="区分 VLAN 接口与 bridge vlan-filtering" },
    @{ Rel="02-RouterOS基础(routeros-basics)/ip-address.md"; Title="IP 地址"; Level="Level 1 · 入门"; Prereq="[IPv4](../01-网络基础(networking-basics)/ipv4.md)"; Lab="02-LAN与DHCP(lan-dhcp)"; Goals="在正确接口上配置地址并验证" },
    @{ Rel="02-RouterOS基础(routeros-basics)/dhcp-client.md"; Title="DHCP Client"; Level="Level 1 · 入门"; Prereq="[IP 地址](ip-address.md)"; Lab="02-LAN与DHCP(lan-dhcp)"; Goals="WAN 自动获取地址、网关与 DNS" },
    @{ Rel="02-RouterOS基础(routeros-basics)/dhcp-server.md"; Title="DHCP Server"; Level="Level 1 · 入门"; Prereq="[IP 地址](ip-address.md)"; Lab="02-LAN与DHCP(lan-dhcp)"; Goals="为 LAN 提供地址池、网关、DNS" },
    @{ Rel="02-RouterOS基础(routeros-basics)/dns.md"; Title="RouterOS DNS"; Level="Level 1 · 入门"; Prereq="[DNS 原理](../01-网络基础(networking-basics)/dns.md)"; Lab="02-LAN与DHCP(lan-dhcp)"; Goals="配置 allow-remote-requests 与转发，避免成开放解析器" },
    @{ Rel="02-RouterOS基础(routeros-basics)/ntp.md"; Title="NTP 时间"; Level="Level 1 · 入门"; Prereq="[接口](interfaces.md)"; Lab="01-第一台路由器(first-router)"; Goals="证书、日志、调度都依赖正确时间" },
    @{ Rel="02-RouterOS基础(routeros-basics)/users.md"; Title="用户与权限"; Level="Level 1 · 入门"; Prereq="[WinBox](../00-入门(introduction)/winbox.md)"; Lab="01-第一台路由器(first-router)"; Goals="禁用默认弱口令，按职责拆分权限组" },
    @{ Rel="03-二层交换(switching)/bridge.md"; Title="二层 Bridge"; Level="Level 2 · 网络工程"; Prereq="[Bridge 入门](../02-RouterOS基础(routeros-basics)/bridge.md)"; Lab="03-VLAN(vlan)"; Goals="理解 bridge 端口、PVID 与硬件卸载前提" },
    @{ Rel="03-二层交换(switching)/vlan-filtering.md"; Title="VLAN Filtering"; Level="Level 2 · 网络工程"; Prereq="[二层 Bridge](bridge.md)"; Lab="03-VLAN(vlan)"; Goals="用 v7 推荐方式做交换机 VLAN，而不是只用 vlan 接口" },
    @{ Rel="03-二层交换(switching)/access-port.md"; Title="Access 端口"; Level="Level 2 · 网络工程"; Prereq="[VLAN Filtering](vlan-filtering.md)"; Lab="03-VLAN(vlan)"; Goals="配置未标记接入端口" },
    @{ Rel="03-二层交换(switching)/trunk-port.md"; Title="Trunk 端口"; Level="Level 2 · 网络工程"; Prereq="[VLAN Filtering](vlan-filtering.md)"; Lab="03-VLAN(vlan)"; Goals="配置 tagged 中继并限制允许 VLAN" },
    @{ Rel="03-二层交换(switching)/hybrid-port.md"; Title="Hybrid 端口"; Level="Level 2 · 网络工程"; Prereq="[Access](access-port.md)、[Trunk](trunk-port.md)"; Lab="03-VLAN(vlan)"; Goals="理解 tagged + untagged 共存场景" },
    @{ Rel="03-二层交换(switching)/bridge-vlan-table.md"; Title="Bridge VLAN 表"; Level="Level 2 · 网络工程"; Prereq="[VLAN Filtering](vlan-filtering.md)"; Lab="03-VLAN(vlan)"; Goals="会读 bridge vlan 表并排错" },
    @{ Rel="03-二层交换(switching)/rstp.md"; Title="RSTP"; Level="Level 2 · 网络工程"; Prereq="[二层 Bridge](bridge.md)"; Lab="03-VLAN(vlan)"; Goals="避免环路，理解角色与阻塞端口" },
    @{ Rel="03-二层交换(switching)/mstp.md"; Title="MSTP"; Level="Level 2 · 网络工程"; Prereq="[RSTP](rstp.md)"; Lab="03-VLAN(vlan)"; Goals="知道多生成树适用场景" },
    @{ Rel="03-二层交换(switching)/hardware-offload.md"; Title="交换芯片卸载"; Level="Level 2 · 网络工程"; Prereq="[二层 Bridge](bridge.md)"; Lab="03-VLAN(vlan)"; Goals="判断当前机型哪些功能会打断 hardware offload" },
    @{ Rel="04-三层路由(routing)/routing-basics.md"; Title="路由基础"; Level="Level 2 · 网络工程"; Prereq="[IPv4](../01-网络基础(networking-basics)/ipv4.md)"; Lab="04-跨VLAN路由(inter-vlan-routing)"; Goals="区分直连、静态、动态路由与查找顺序" },
    @{ Rel="04-三层路由(routing)/static-route.md"; Title="静态路由"; Level="Level 2 · 网络工程"; Prereq="[路由基础](routing-basics.md)"; Lab="04-跨VLAN路由(inter-vlan-routing)"; Goals="配置并验证静态路由" },
    @{ Rel="04-三层路由(routing)/default-route.md"; Title="默认路由"; Level="Level 2 · 网络工程"; Prereq="[静态路由](static-route.md)"; Lab="06-NAT(nat)"; Goals="理解 0.0.0.0/0 与距离、作用表" },
    @{ Rel="04-三层路由(routing)/recursive-route.md"; Title="递归路由"; Level="Level 3 · 高级"; Prereq="[默认路由](default-route.md)"; Lab="07-双WAN(dual-wan)"; Goals="用 check-gateway 与递归做可达性判断" },
    @{ Rel="04-三层路由(routing)/routing-table.md"; Title="路由表"; Level="Level 3 · 高级"; Prereq="[路由基础](routing-basics.md)"; Lab="11-VRF(vrf)"; Goals="使用 v7 routing table / fib" },
    @{ Rel="04-三层路由(routing)/routing-rule.md"; Title="Routing Rule"; Level="Level 3 · 高级"; Prereq="[路由表](routing-table.md)"; Lab="11-VRF(vrf)"; Goals="按源地址/入接口选表" },
    @{ Rel="04-三层路由(routing)/policy-routing.md"; Title="策略路由"; Level="Level 3 · 高级"; Prereq="[Routing Rule](routing-rule.md)"; Lab="07-双WAN(dual-wan)"; Goals="设计多出口策略而不只靠 mangle" },
    @{ Rel="04-三层路由(routing)/vrf.md"; Title="VRF"; Level="Level 3 · 高级"; Prereq="[路由表](routing-table.md)"; Lab="11-VRF(vrf)"; Goals="隔离路由实例，理解接口绑定" },
    @{ Rel="04-三层路由(routing)/ecmp.md"; Title="ECMP"; Level="Level 3 · 高级"; Prereq="[静态路由](static-route.md)"; Lab="07-双WAN(dual-wan)"; Goals="理解等价多路径与连接粘滞" },
    @{ Rel="04-三层路由(routing)/route-selection.md"; Title="路由选择"; Level="Level 3 · 高级"; Prereq="[路由基础](routing-basics.md)"; Lab="09-OSPF(ospf)"; Goals="掌握 distance、scope、target-scope、AS path 等选路要素" },
    @{ Rel="05-防火墙(firewall)/firewall-concepts.md"; Title="防火墙概念"; Level="Level 2 · 网络工程"; Prereq="[Interface List](../02-RouterOS基础(routeros-basics)/interface-lists.md)"; Lab="05-防火墙(firewall)"; Goals="建立 input/forward/output 心智模型" },
    @{ Rel="05-防火墙(firewall)/connection-tracking.md"; Title="连接跟踪"; Level="Level 2 · 网络工程"; Prereq="[防火墙概念](firewall-concepts.md)"; Lab="05-防火墙(firewall)"; Goals="理解 new/established/related/invalid 与 NAT 依赖" },
    @{ Rel="05-防火墙(firewall)/filter.md"; Title="Firewall Filter"; Level="Level 2 · 网络工程"; Prereq="[连接跟踪](connection-tracking.md)"; Lab="05-防火墙(firewall)"; Goals="写出最小可用的 input/forward 策略" },
    @{ Rel="05-防火墙(firewall)/raw.md"; Title="Firewall Raw"; Level="Level 3 · 高级"; Prereq="[Filter](filter.md)"; Lab="05-防火墙(firewall)"; Goals="知道 prerouting/output raw 与 notrack" },
    @{ Rel="05-防火墙(firewall)/nat.md"; Title="Firewall 中的 NAT 位置"; Level="Level 2 · 网络工程"; Prereq="[连接跟踪](connection-tracking.md)"; Lab="06-NAT(nat)"; Goals="把 NAT 放进包流程，细节见 06-nat 章" },
    @{ Rel="05-防火墙(firewall)/mangle.md"; Title="Mangle"; Level="Level 3 · 高级"; Prereq="[Filter](filter.md)"; Lab="07-双WAN(dual-wan)"; Goals="标记连接/路由/QoS 并知道副作用" },
    @{ Rel="05-防火墙(firewall)/address-list.md"; Title="Address List"; Level="Level 2 · 网络工程"; Prereq="[Filter](filter.md)"; Lab="05-防火墙(firewall)"; Goals="用动态列表做白名单与暴力破解防护" },
    @{ Rel="05-防火墙(firewall)/fasttrack.md"; Title="FastTrack"; Level="Level 2 · 网络工程"; Prereq="[连接跟踪](connection-tracking.md)"; Lab="05-防火墙(firewall)"; Goals="加速已放行流量，并知道何时必须关闭" },
    @{ Rel="05-防火墙(firewall)/layer7.md"; Title="Layer7"; Level="Level 3 · 高级"; Prereq="[Filter](filter.md)"; Lab="05-防火墙(firewall)"; Goals="了解 L7 匹配的性能代价与替代方案" },
    @{ Rel="05-防火墙(firewall)/advanced-firewall.md"; Title="进阶防火墙"; Level="Level 4 · 专家"; Prereq="[Filter](filter.md)、[Raw](raw.md)"; Lab="05-防火墙(firewall)"; Goals="组合 raw/filter/mangle 做企业边界" },
    @{ Rel="06-NAT(nat)/nat.md"; Title="NAT 总览"; Level="Level 2 · 网络工程"; Prereq="[连接跟踪](../05-防火墙(firewall)/connection-tracking.md)"; Lab="06-NAT(nat)"; Goals="分清 srcnat/dstnat 与包流程位置" },
    @{ Rel="06-NAT(nat)/srcnat.md"; Title="srcnat"; Level="Level 2 · 网络工程"; Prereq="[NAT 总览](nat.md)"; Lab="06-NAT(nat)"; Goals="按出口做源地址转换" },
    @{ Rel="06-NAT(nat)/masquerade.md"; Title="Masquerade"; Level="Level 2 · 网络工程"; Prereq="[srcnat](srcnat.md)"; Lab="06-NAT(nat)"; Goals="动态 WAN 地址场景下的出站 NAT" },
    @{ Rel="06-NAT(nat)/dstnat.md"; Title="dstnat"; Level="Level 2 · 网络工程"; Prereq="[NAT 总览](nat.md)"; Lab="06-NAT(nat)"; Goals="理解目的地址转换" },
    @{ Rel="06-NAT(nat)/port-forward.md"; Title="端口映射"; Level="Level 2 · 网络工程"; Prereq="[dstnat](dstnat.md)"; Lab="06-NAT(nat)"; Goals="安全地发布内网服务" },
    @{ Rel="06-NAT(nat)/hairpin-nat.md"; Title="Hairpin NAT"; Level="Level 2 · 网络工程"; Prereq="[端口映射](port-forward.md)"; Lab="06-NAT(nat)"; Goals="让内网用户也能用公网地址访问内网服务" },
    @{ Rel="06-NAT(nat)/nat-troubleshooting.md"; Title="NAT 排错"; Level="Level 2 · 网络工程"; Prereq="[Masquerade](masquerade.md)"; Lab="06-NAT(nat)"; Goals="用 connection tracking 与日志定位 NAT 失败" },
    @{ Rel="07-DHCP与DNS(dhcp-dns)/dhcp-server.md"; Title="DHCP 服务进阶"; Level="Level 2 · 网络工程"; Prereq="[DHCP Server](../02-RouterOS基础(routeros-basics)/dhcp-server.md)"; Lab="02-LAN与DHCP(lan-dhcp)"; Goals="多网段、Option、中继" },
    @{ Rel="07-DHCP与DNS(dhcp-dns)/dhcp-client.md"; Title="DHCP 客户端进阶"; Level="Level 2 · 网络工程"; Prereq="[DHCP Client](../02-RouterOS基础(routeros-basics)/dhcp-client.md)"; Lab="02-LAN与DHCP(lan-dhcp)"; Goals="默认路由、距离、脚本钩子" },
    @{ Rel="07-DHCP与DNS(dhcp-dns)/static-lease.md"; Title="静态租约"; Level="Level 2 · 网络工程"; Prereq="[DHCP 服务进阶](dhcp-server.md)"; Lab="02-LAN与DHCP(lan-dhcp)"; Goals="为服务器保留地址" },
    @{ Rel="07-DHCP与DNS(dhcp-dns)/dns-cache.md"; Title="DNS 缓存"; Level="Level 2 · 网络工程"; Prereq="[RouterOS DNS](../02-RouterOS基础(routeros-basics)/dns.md)"; Lab="02-LAN与DHCP(lan-dhcp)"; Goals="缓存、静态记录与排错" },
    @{ Rel="07-DHCP与DNS(dhcp-dns)/dns-forwarding.md"; Title="DNS 转发"; Level="Level 2 · 网络工程"; Prereq="[DNS 缓存](dns-cache.md)"; Lab="02-LAN与DHCP(lan-dhcp)"; Goals="按域名分流上游" },
    @{ Rel="07-DHCP与DNS(dhcp-dns)/split-dns.md"; Title="Split DNS"; Level="Level 3 · 高级"; Prereq="[DNS 转发](dns-forwarding.md)"; Lab="02-LAN与DHCP(lan-dhcp)"; Goals="内网域名与公网解析分离" },
    @{ Rel="08-无线(wireless)/wireless-basics.md"; Title="无线基础"; Level="Level 2 · 网络工程"; Prereq="[以太网](../01-网络基础(networking-basics)/ethernet.md)"; Lab="01-第一台路由器(first-router)"; Goals="信道、带宽、安全套件" },
    @{ Rel="08-无线(wireless)/wifi.md"; Title="wifi 包（v7）"; Level="Level 2 · 网络工程"; Prereq="[无线基础](wireless-basics.md)"; Lab="01-第一台路由器(first-router)"; Goals="使用 v7 wifi 菜单而非过时 wireless 心智" },
    @{ Rel="08-无线(wireless)/wifiwave2.md"; Title="wifiwave2 与过渡"; Level="Level 2 · 网络工程"; Prereq="[wifi](wifi.md)"; Lab="01-第一台路由器(first-router)"; Goals="理解包名变迁与机型差异" },
    @{ Rel="08-无线(wireless)/ssid.md"; Title="SSID 与安全"; Level="Level 2 · 网络工程"; Prereq="[wifi](wifi.md)"; Lab="01-第一台路由器(first-router)"; Goals="WPA2/WPA3、访客隔离" },
    @{ Rel="08-无线(wireless)/roaming.md"; Title="漫游"; Level="Level 3 · 高级"; Prereq="[SSID](ssid.md)"; Lab="01-第一台路由器(first-router)"; Goals="802.11k/v/r 与信号门槛" },
    @{ Rel="08-无线(wireless)/capsman.md"; Title="CAPsMAN"; Level="Level 3 · 高级"; Prereq="[wifi](wifi.md)"; Lab="01-第一台路由器(first-router)"; Goals="集中管理 AP（按 v7 方式）" },
    @{ Rel="09-VPN(vpn)/vpn-overview.md"; Title="VPN 总览"; Level="Level 2 · 网络工程"; Prereq="[路由基础](../04-三层路由(routing)/routing-basics.md)"; Lab="08-WireGuard(wireguard)"; Goals="按场景选择隧道类型" },
    @{ Rel="09-VPN(vpn)/wireguard.md"; Title="WireGuard"; Level="Level 3 · 高级"; Prereq="[VPN 总览](vpn-overview.md)"; Lab="08-WireGuard(wireguard)"; Goals="站点互联与远程接入的首选实现" },
    @{ Rel="09-VPN(vpn)/ipsec.md"; Title="IPsec"; Level="Level 3 · 高级"; Prereq="[VPN 总览](vpn-overview.md)"; Lab="08-WireGuard(wireguard)"; Goals="策略/隧道模式与互联兼容" },
    @{ Rel="09-VPN(vpn)/l2tp.md"; Title="L2TP"; Level="Level 2 · 网络工程"; Prereq="[IPsec](ipsec.md)"; Lab="08-WireGuard(wireguard)"; Goals="L2TP/IPsec 远程接入" },
    @{ Rel="09-VPN(vpn)/pptp.md"; Title="PPTP（不推荐）"; Level="Level 2 · 网络工程"; Prereq="[VPN 总览](vpn-overview.md)"; Lab="08-WireGuard(wireguard)"; Goals="知道过时原因，仅用于遗留互通" },
    @{ Rel="09-VPN(vpn)/sstp.md"; Title="SSTP"; Level="Level 2 · 网络工程"; Prereq="[VPN 总览](vpn-overview.md)"; Lab="08-WireGuard(wireguard)"; Goals="证书与 443 穿透场景" },
    @{ Rel="09-VPN(vpn)/ovpn.md"; Title="OpenVPN"; Level="Level 2 · 网络工程"; Prereq="[VPN 总览](vpn-overview.md)"; Lab="08-WireGuard(wireguard)"; Goals="ovpn 服务端/客户端要点" },
    @{ Rel="09-VPN(vpn)/gre.md"; Title="GRE"; Level="Level 3 · 高级"; Prereq="[VPN 总览](vpn-overview.md)"; Lab="08-WireGuard(wireguard)"; Goals="点对点封装与 MTU" },
    @{ Rel="09-VPN(vpn)/eoip.md"; Title="EoIP"; Level="Level 3 · 高级"; Prereq="[GRE](gre.md)"; Lab="08-WireGuard(wireguard)"; Goals="二层延伸与环路风险" },
    @{ Rel="09-VPN(vpn)/vxlan.md"; Title="VXLAN"; Level="Level 3 · 高级"; Prereq="[VLAN 原理](../01-网络基础(networking-basics)/vlan.md)"; Lab="08-WireGuard(wireguard)"; Goals="叠加网络与 VTEP" },
    @{ Rel="10-动态路由(dynamic-routing)/ospf.md"; Title="OSPF（v7）"; Level="Level 3 · 高级"; Prereq="[路由基础](../04-三层路由(routing)/routing-basics.md)"; Lab="09-OSPF(ospf)"; Goals="用 instance/area/interface-template 建立邻居与路由" },
    @{ Rel="10-动态路由(dynamic-routing)/ospfv3.md"; Title="OSPFv3"; Level="Level 3 · 高级"; Prereq="[OSPF](ospf.md)、[IPv6](../01-网络基础(networking-basics)/ipv6.md)"; Lab="09-OSPF(ospf)"; Goals="IPv6 动态路由" },
    @{ Rel="10-动态路由(dynamic-routing)/bgp.md"; Title="BGP"; Level="Level 3 · 高级"; Prereq="[路由基础](../04-三层路由(routing)/routing-basics.md)"; Lab="10-BGP(bgp)"; Goals="eBGP/iBGP、会话与基本宣告" },
    @{ Rel="10-动态路由(dynamic-routing)/rip.md"; Title="RIP"; Level="Level 2 · 网络工程"; Prereq="[路由基础](../04-三层路由(routing)/routing-basics.md)"; Lab="09-OSPF(ospf)"; Goals="仅作遗留了解" },
    @{ Rel="10-动态路由(dynamic-routing)/bfd.md"; Title="BFD"; Level="Level 3 · 高级"; Prereq="[OSPF](ospf.md) 或 [BGP](bgp.md)"; Lab="09-OSPF(ospf)"; Goals="加快故障检测" },
    @{ Rel="10-动态路由(dynamic-routing)/routing-filters.md"; Title="Routing Filter"; Level="Level 4 · 专家"; Prereq="[BGP](bgp.md)"; Lab="10-BGP(bgp)"; Goals="用 v7 filter 控制收发前缀" },
    @{ Rel="10-动态路由(dynamic-routing)/bgp-policy.md"; Title="BGP 策略"; Level="Level 4 · 专家"; Prereq="[Routing Filter](routing-filters.md)"; Lab="10-BGP(bgp)"; Goals="本端/对端策略、MED、Local Pref" },
    @{ Rel="10-动态路由(dynamic-routing)/communities.md"; Title="BGP Community"; Level="Level 4 · 专家"; Prereq="[BGP 策略](bgp-policy.md)"; Lab="10-BGP(bgp)"; Goals="用 community 做流量工程标签" },
    @{ Rel="10-动态路由(dynamic-routing)/rpki.md"; Title="RPKI"; Level="Level 4 · 专家"; Prereq="[BGP](bgp.md)"; Lab="10-BGP(bgp)"; Goals="起源验证，降低前缀劫持风险" },
    @{ Rel="11-QoS(qos)/qos-concepts.md"; Title="QoS 概念"; Level="Level 2 · 网络工程"; Prereq="[防火墙概念](../05-防火墙(firewall)/firewall-concepts.md)"; Lab="12-QoS(qos)"; Goals="区分限速、整形、优先级与缓冲" },
    @{ Rel="11-QoS(qos)/simple-queue.md"; Title="Simple Queue"; Level="Level 2 · 网络工程"; Prereq="[QoS 概念](qos-concepts.md)"; Lab="12-QoS(qos)"; Goals="按目标做基础限速" },
    @{ Rel="11-QoS(qos)/queue-tree.md"; Title="Queue Tree"; Level="Level 3 · 高级"; Prereq="[Simple Queue](simple-queue.md)"; Lab="12-QoS(qos)"; Goals="分层队列与 packet mark" },
    @{ Rel="11-QoS(qos)/pcq.md"; Title="PCQ"; Level="Level 3 · 高级"; Prereq="[Queue Tree](queue-tree.md)"; Lab="12-QoS(qos)"; Goals="按流公平共享带宽" },
    @{ Rel="11-QoS(qos)/fq-codel.md"; Title="FQ-CoDel"; Level="Level 3 · 高级"; Prereq="[QoS 概念](qos-concepts.md)"; Lab="12-QoS(qos)"; Goals="降低缓冲膨胀" },
    @{ Rel="11-QoS(qos)/cake.md"; Title="CAKE"; Level="Level 3 · 高级"; Prereq="[FQ-CoDel](fq-codel.md)"; Lab="12-QoS(qos)"; Goals="智能队列适用场景" },
    @{ Rel="11-QoS(qos)/qos-design.md"; Title="QoS 设计"; Level="Level 4 · 专家"; Prereq="[Queue Tree](queue-tree.md)"; Lab="12-QoS(qos)"; Goals="家庭/企业/ISP 的队列位置选择" },
    @{ Rel="12-高可用(high-availability)/vrrp.md"; Title="VRRP"; Level="Level 4 · 专家"; Prereq="[路由基础](../04-三层路由(routing)/routing-basics.md)"; Lab="13-VRRP(vrrp)"; Goals="网关冗余" },
    @{ Rel="12-高可用(high-availability)/failover.md"; Title="故障切换"; Level="Level 3 · 高级"; Prereq="[递归路由](../04-三层路由(routing)/recursive-route.md)"; Lab="07-双WAN(dual-wan)"; Goals="检测、切换、回切" },
    @{ Rel="12-高可用(high-availability)/dual-wan.md"; Title="双 WAN"; Level="Level 3 · 高级"; Prereq="[策略路由](../04-三层路由(routing)/policy-routing.md)"; Lab="07-双WAN(dual-wan)"; Goals="主备与负载分担设计" },
    @{ Rel="12-高可用(high-availability)/load-balancing.md"; Title="负载均衡"; Level="Level 3 · 高级"; Prereq="[ECMP](../04-三层路由(routing)/ecmp.md)"; Lab="07-双WAN(dual-wan)"; Goals="按连接/地址分担并处理非对称回程" },
    @{ Rel="12-高可用(high-availability)/connection-tracking-sync.md"; Title="连接跟踪同步"; Level="Level 4 · 专家"; Prereq="[VRRP](vrrp.md)"; Lab="13-VRRP(vrrp)"; Goals="主备切换后会话尽量不断" },
    @{ Rel="13-MPLS(mpls)/mpls-basics.md"; Title="MPLS 基础"; Level="Level 4 · 专家"; Prereq="[BGP](../10-动态路由(dynamic-routing)/bgp.md)"; Lab="14-MPLS(mpls)"; Goals="标签转发与 LSP 概念" },
    @{ Rel="13-MPLS(mpls)/ldp.md"; Title="LDP"; Level="Level 4 · 专家"; Prereq="[MPLS 基础](mpls-basics.md)"; Lab="14-MPLS(mpls)"; Goals="建立标签分发" },
    @{ Rel="13-MPLS(mpls)/l3vpn.md"; Title="L3VPN"; Level="Level 4 · 专家"; Prereq="[VRF](../04-三层路由(routing)/vrf.md)、[LDP](ldp.md)"; Lab="14-MPLS(mpls)"; Goals="运营商级租户隔离" },
    @{ Rel="13-MPLS(mpls)/traffic-engineering.md"; Title="流量工程"; Level="Level 4 · 专家"; Prereq="[MPLS 基础](mpls-basics.md)"; Lab="14-MPLS(mpls)"; Goals="了解 TE 适用与复杂度" },
    @{ Rel="14-自动化(automation)/scripting.md"; Title="RouterOS Script"; Level="Level 3 · 高级"; Prereq="[CLI](../00-入门(introduction)/cli-basics.md)"; Lab="15-自动化(automation)"; Goals="变量、循环、安全执行" },
    @{ Rel="14-自动化(automation)/scheduler.md"; Title="Scheduler"; Level="Level 3 · 高级"; Prereq="[Script](scripting.md)"; Lab="15-自动化(automation)"; Goals="定时备份与维护" },
    @{ Rel="14-自动化(automation)/netwatch.md"; Title="Netwatch"; Level="Level 3 · 高级"; Prereq="[Script](scripting.md)"; Lab="07-双WAN(dual-wan)"; Goals="探测与 up/down 脚本" },
    @{ Rel="14-自动化(automation)/api.md"; Title="API"; Level="Level 3 · 高级"; Prereq="[用户与权限](../02-RouterOS基础(routeros-basics)/users.md)"; Lab="15-自动化(automation)"; Goals="二进制 API 适用场景" },
    @{ Rel="14-自动化(automation)/rest-api.md"; Title="REST API"; Level="Level 3 · 高级"; Prereq="[API](api.md)"; Lab="15-自动化(automation)"; Goals="v7 REST 纳入外部自动化" },
    @{ Rel="14-自动化(automation)/ssh.md"; Title="SSH 自动化"; Level="Level 3 · 高级"; Prereq="[CLI](../00-入门(introduction)/cli-basics.md)"; Lab="15-自动化(automation)"; Goals="密钥登录与批量命令" },
    @{ Rel="14-自动化(automation)/automation-design.md"; Title="自动化设计"; Level="Level 4 · 专家"; Prereq="[REST API](rest-api.md)"; Lab="15-自动化(automation)"; Goals="脚本 / REST / Ansible / Terraform 怎么分工" },
    @{ Rel="15-监控(monitoring)/logging.md"; Title="日志"; Level="Level 2 · 网络工程"; Prereq="[CLI](../00-入门(introduction)/cli-basics.md)"; Lab="15-自动化(automation)"; Goals="分级、远程 syslog、排障用法" },
    @{ Rel="15-监控(monitoring)/traffic-flow.md"; Title="Traffic Flow"; Level="Level 3 · 高级"; Prereq="[接口](../02-RouterOS基础(routeros-basics)/interfaces.md)"; Lab="15-自动化(automation)"; Goals="导出流数据给分析平台" },
    @{ Rel="15-监控(monitoring)/snmp.md"; Title="SNMP"; Level="Level 3 · 高级"; Prereq="[用户与权限](../02-RouterOS基础(routeros-basics)/users.md)"; Lab="15-自动化(automation)"; Goals="安全启用 SNMP 供监控系统采集" },
    @{ Rel="15-监控(monitoring)/torch.md"; Title="Torch"; Level="Level 2 · 网络工程"; Prereq="[接口](../02-RouterOS基础(routeros-basics)/interfaces.md)"; Lab="05-防火墙(firewall)"; Goals="实时看谁在占用带宽" },
    @{ Rel="15-监控(monitoring)/profiler.md"; Title="CPU Profiler"; Level="Level 3 · 高级"; Prereq="[体系结构](../00-入门(introduction)/routeros-architecture.md)"; Lab="01-第一台路由器(first-router)"; Goals="定位 CPU 热点" },
    @{ Rel="15-监控(monitoring)/netwatch.md"; Title="Netwatch 监控视角"; Level="Level 3 · 高级"; Prereq="[Netwatch](../14-自动化(automation)/netwatch.md)"; Lab="07-双WAN(dual-wan)"; Goals="把探测当监控信号而不仅是切换触发器" },
    @{ Rel="15-监控(monitoring)/monitoring-platform.md"; Title="监控平台"; Level="Level 4 · 专家"; Prereq="[SNMP](snmp.md)、[REST API](../14-自动化(automation)/rest-api.md)"; Lab="15-自动化(automation)"; Goals="Prometheus/Zabbix 等接入思路" },
    @{ Rel="16-安全(security)/management-security.md"; Title="管理面安全"; Level="Level 2 · 网络工程"; Prereq="[用户与权限](../02-RouterOS基础(routeros-basics)/users.md)"; Lab="05-防火墙(firewall)"; Goals="限制 WinBox/API/WWW 来源" },
    @{ Rel="16-安全(security)/service-security.md"; Title="服务端口安全"; Level="Level 2 · 网络工程"; Prereq="[管理面安全](management-security.md)"; Lab="05-防火墙(firewall)"; Goals="关闭无用服务，改默认端口需谨慎" },
    @{ Rel="16-安全(security)/firewall-hardening.md"; Title="防火墙加固"; Level="Level 3 · 高级"; Prereq="[Filter](../05-防火墙(firewall)/filter.md)"; Lab="05-防火墙(firewall)"; Goals="默认丢弃、反欺骗、管理口隔离" },
    @{ Rel="16-安全(security)/brute-force-protection.md"; Title="暴力破解防护"; Level="Level 2 · 网络工程"; Prereq="[Address List](../05-防火墙(firewall)/address-list.md)"; Lab="05-防火墙(firewall)"; Goals="动态封禁失败登录源" },
    @{ Rel="16-安全(security)/ssh-hardening.md"; Title="SSH 加固"; Level="Level 2 · 网络工程"; Prereq="[SSH 自动化](../14-自动化(automation)/ssh.md)"; Lab="15-自动化(automation)"; Goals="密钥、强算法、来源限制" },
    @{ Rel="16-安全(security)/user-permissions.md"; Title="权限模型"; Level="Level 3 · 高级"; Prereq="[用户与权限](../02-RouterOS基础(routeros-basics)/users.md)"; Lab="15-自动化(automation)"; Goals="只读监控账号与分组" },
    @{ Rel="16-安全(security)/certificates.md"; Title="证书"; Level="Level 3 · 高级"; Prereq="[WebFig](../00-入门(introduction)/webfig.md)"; Lab="08-WireGuard(wireguard)"; Goals="WWW-SSL、SSTP、API 的证书" },
    @{ Rel="16-安全(security)/security-checklist.md"; Title="安全检查清单"; Level="Level 4 · 专家"; Prereq="本章其余文章"; Lab="05-防火墙(firewall)"; Goals="上线前过一遍管理面与转发面" },
    @{ Rel="17-故障排查(troubleshooting)/troubleshooting-methodology.md"; Title="排障方法论"; Level="Level 2 · 网络工程"; Prereq="[ICMP](../01-网络基础(networking-basics)/icmp.md)"; Lab="01-第一台路由器(first-router)"; Goals="分层：物理 → 二层 → 三层 → 策略 → 应用" },
    @{ Rel="17-故障排查(troubleshooting)/no-internet.md"; Title="不能上网"; Level="Level 2 · 网络工程"; Prereq="[排障方法论](troubleshooting-methodology.md)"; Lab="06-NAT(nat)"; Goals="区分 DHCP/DNS/NAT/路由/运营商" },
    @{ Rel="17-故障排查(troubleshooting)/dns-problem.md"; Title="DNS 故障"; Level="Level 2 · 网络工程"; Prereq="[DNS](../07-DHCP与DNS(dhcp-dns)/dns-cache.md)"; Lab="02-LAN与DHCP(lan-dhcp)"; Goals="解析失败的系统化检查" },
    @{ Rel="17-故障排查(troubleshooting)/vlan-problem.md"; Title="VLAN 故障"; Level="Level 2 · 网络工程"; Prereq="[VLAN Filtering](../03-二层交换(switching)/vlan-filtering.md)"; Lab="03-VLAN(vlan)"; Goals="PVID、漏 tagged、桥 VLAN 表" },
    @{ Rel="17-故障排查(troubleshooting)/routing-problem.md"; Title="路由故障"; Level="Level 3 · 高级"; Prereq="[路由选择](../04-三层路由(routing)/route-selection.md)"; Lab="09-OSPF(ospf)"; Goals="查表、查邻居、查 filter" },
    @{ Rel="17-故障排查(troubleshooting)/firewall-problem.md"; Title="防火墙故障"; Level="Level 2 · 网络工程"; Prereq="[Filter](../05-防火墙(firewall)/filter.md)"; Lab="05-防火墙(firewall)"; Goals="用 log/counter 找丢包规则" },
    @{ Rel="17-故障排查(troubleshooting)/mtu-problem.md"; Title="MTU 故障"; Level="Level 3 · 高级"; Prereq="[VPN 总览](../09-VPN(vpn)/vpn-overview.md)"; Lab="08-WireGuard(wireguard)"; Goals="MSS clamp、隧道开销、PMTUD" },
    @{ Rel="17-故障排查(troubleshooting)/performance-problem.md"; Title="性能故障"; Level="Level 3 · 高级"; Prereq="[FastTrack](../05-防火墙(firewall)/fasttrack.md)"; Lab="12-QoS(qos)"; Goals="CPU、队列、offload 失效" },
    @{ Rel="17-故障排查(troubleshooting)/packet-analysis.md"; Title="抓包分析"; Level="Level 3 · 高级"; Prereq="[排障方法论](troubleshooting-methodology.md)"; Lab="05-防火墙(firewall)"; Goals="Tool Sniffer / 镜像到 Wireshark" },
    @{ Rel="18-性能优化(performance)/cpu.md"; Title="CPU"; Level="Level 3 · 高级"; Prereq="[Profiler](../15-监控(monitoring)/profiler.md)"; Lab="01-第一台路由器(first-router)"; Goals="单核转发与连接跟踪成本" },
    @{ Rel="18-性能优化(performance)/memory.md"; Title="内存"; Level="Level 3 · 高级"; Prereq="[连接跟踪](../05-防火墙(firewall)/connection-tracking.md)"; Lab="01-第一台路由器(first-router)"; Goals="conntrack、队列、BGP 表对内存的影响" },
    @{ Rel="18-性能优化(performance)/fastpath.md"; Title="FastPath"; Level="Level 3 · 高级"; Prereq="[体系结构](../00-入门(introduction)/routeros-architecture.md)"; Lab="05-防火墙(firewall)"; Goals="哪些功能会打断 FastPath" },
    @{ Rel="18-性能优化(performance)/fasttrack.md"; Title="FastTrack 性能"; Level="Level 3 · 高级"; Prereq="[FastTrack](../05-防火墙(firewall)/fasttrack.md)"; Lab="05-防火墙(firewall)"; Goals="与 QoS/mangle 的冲突" },
    @{ Rel="18-性能优化(performance)/hardware-offload.md"; Title="硬件卸载（性能）"; Level="Level 3 · 高级"; Prereq="[交换芯片卸载](../03-二层交换(switching)/hardware-offload.md)"; Lab="03-VLAN(vlan)"; Goals="交换与路由卸载边界" },
    @{ Rel="18-性能优化(performance)/queues-performance.md"; Title="队列与性能"; Level="Level 3 · 高级"; Prereq="[QoS 概念](../11-QoS(qos)/qos-concepts.md)"; Lab="12-QoS(qos)"; Goals="队列放在哪里才不会拖垮 CPU" },
    @{ Rel="18-性能优化(performance)/performance-tuning.md"; Title="性能调优"; Level="Level 4 · 专家"; Prereq="本章其余文章"; Lab="12-QoS(qos)"; Goals="按机型给出可执行检查单" },
    @{ Rel="19-生产环境(production)/deployment.md"; Title="部署"; Level="Level 4 · 专家"; Prereq="[安全检查清单](../16-安全(security)/security-checklist.md)"; Lab="01-第一台路由器(first-router)"; Goals="从实验配置走到可交接的生产配置" },
    @{ Rel="19-生产环境(production)/backup.md"; Title="备份"; Level="Level 2 · 网络工程"; Prereq="[Scheduler](../14-自动化(automation)/scheduler.md)"; Lab="15-自动化(automation)"; Goals="binary/rsc 备份与异地存放" },
    @{ Rel="19-生产环境(production)/restore.md"; Title="恢复"; Level="Level 2 · 网络工程"; Prereq="[备份](backup.md)"; Lab="15-自动化(automation)"; Goals="演练恢复，而不是只备份" },
    @{ Rel="19-生产环境(production)/upgrade.md"; Title="升级"; Level="Level 3 · 高级"; Prereq="[v7 主线](../00-入门(introduction)/routeros-v7.md)"; Lab="01-第一台路由器(first-router)"; Goals="长期包通道、分阶段升级" },
    @{ Rel="19-生产环境(production)/rollback.md"; Title="回滚"; Level="Level 3 · 高级"; Prereq="[升级](upgrade.md)"; Lab="01-第一台路由器(first-router)"; Goals="升级失败的退路" },
    @{ Rel="19-生产环境(production)/configuration-management.md"; Title="配置管理"; Level="Level 4 · 专家"; Prereq="[自动化设计](../14-自动化(automation)/automation-design.md)"; Lab="15-自动化(automation)"; Goals="Git 中的 .rsc 与现场一致性" },
    @{ Rel="19-生产环境(production)/production-checklist.md"; Title="生产检查清单"; Level="Level 4 · 专家"; Prereq="本章其余文章"; Lab="15-自动化(automation)"; Goals="上线门禁：备份、监控、权限、变更窗口" },
    @{ Rel="20-高级(advanced)/architecture.md"; Title="网络架构方法"; Level="Level 4 · 专家"; Prereq="[策略路由](../04-三层路由(routing)/policy-routing.md)"; Lab="11-VRF(vrf)"; Goals="分层、分区、出入口收敛" },
    @{ Rel="20-高级(advanced)/service-provider.md"; Title="运营商视角"; Level="Level 4 · 专家"; Prereq="[BGP](../10-动态路由(dynamic-routing)/bgp.md)"; Lab="10-BGP(bgp)"; Goals="PE/CE、汇聚、用户接入" },
    @{ Rel="20-高级(advanced)/isp-design.md"; Title="ISP 设计"; Level="Level 4 · 专家"; Prereq="[RPKI](../10-动态路由(dynamic-routing)/rpki.md)"; Lab="10-BGP(bgp)"; Goals="多上行、过滤、社区约定" },
    @{ Rel="20-高级(advanced)/enterprise-network.md"; Title="企业网"; Level="Level 4 · 专家"; Prereq="[VRF](../04-三层路由(routing)/vrf.md)、[OSPF](../10-动态路由(dynamic-routing)/ospf.md)"; Lab="13-VRRP(vrrp)"; Goals="园区核心/汇聚/接入 + 出口" },
    @{ Rel="20-高级(advanced)/multi-wan-architecture.md"; Title="多 WAN 架构"; Level="Level 4 · 专家"; Prereq="[双 WAN](../12-高可用(high-availability)/dual-wan.md)"; Lab="07-双WAN(dual-wan)"; Goals="把家庭双 WAN 升到可运维架构" },
    @{ Rel="20-高级(advanced)/multi-vrf.md"; Title="多 VRF"; Level="Level 4 · 专家"; Prereq="[VRF](../04-三层路由(routing)/vrf.md)"; Lab="11-VRF(vrf)"; Goals="租户隔离与受控泄漏" },
    @{ Rel="20-高级(advanced)/bgp-design.md"; Title="BGP 设计"; Level="Level 4 · 专家"; Prereq="[BGP 策略](../10-动态路由(dynamic-routing)/bgp-policy.md)"; Lab="10-BGP(bgp)"; Goals="会话规划、RR、聚合" },
    @{ Rel="20-高级(advanced)/network-segmentation.md"; Title="网络隔离"; Level="Level 4 · 专家"; Prereq="[VLAN Filtering](../03-二层交换(switching)/vlan-filtering.md)"; Lab="05-防火墙(firewall)"; Goals="VLAN + VRF + 防火墙分层" },
    @{ Rel="20-高级(advanced)/large-scale-deployment.md"; Title="规模化部署"; Level="Level 4 · 专家"; Prereq="[配置管理](../19-生产环境(production)/configuration-management.md)"; Lab="15-自动化(automation)"; Goals="批量开局、模板、监控覆盖" }
)

foreach ($a in $articles) {
    $path = Join-Path $Course ("docs\" + ($a.Rel -replace "/", "\"))
    Write-File $path (New-Article $a.Rel $a.Title $a.Level $a.Prereq $a.Lab $a.Goals)
}

$labs = @(
    @{ Id="01-first-router"; Title="第一台 RouterOS"; Goals=@("登录 WinBox/CLI","识别接口","设身份与口令","看邻居发现") ; Topo="PC ---- ether2 [R1] ether1 ---- 管理网"; Routers=@("router1") },
    @{ Id="02-lan-dhcp"; Title="DHCP + DNS"; Goals=@("Bridge LAN","DHCP Server","DNS 转发","客户端获取地址") ; Topo="PC ---- LAN-bridge [R1] WAN"; Routers=@("router1") },
    @{ Id="03-vlan"; Title="VLAN"; Goals=@("vlan-filtering","Access/Trunk","bridge vlan 表") ; Topo="PC1-VLAN10 ---- [R1 switch] ---- PC2-VLAN20"; Routers=@("router1") },
    @{ Id="04-inter-vlan-routing"; Title="Inter-VLAN Routing"; Goals=@("SVI/VLAN 接口","三层互通","ACL 预留") ; Topo="VLAN10 -- [R1 L3] -- VLAN20"; Routers=@("router1") },
    @{ Id="05-firewall"; Title="Firewall"; Goals=@("input 加固","forward 策略","address-list","FastTrack") ; Topo="LAN ---- [R1] ---- WAN"; Routers=@("router1") },
    @{ Id="06-nat"; Title="NAT"; Goals=@("masquerade","dstnat","hairpin") ; Topo="LAN ---- [R1] ---- WAN/Internet"; Routers=@("router1") },
    @{ Id="07-dual-wan"; Title="Dual WAN"; Goals=@("双默认路由","探测切换","策略分流") ; Topo="LAN ---- [R1] ---- WAN1 / WAN2"; Routers=@("router1") },
    @{ Id="08-wireguard"; Title="WireGuard"; Goals=@("密钥","AllowedIPs","站点互通") ; Topo="SiteA [R1] ==== WG ==== [R2] SiteB"; Routers=@("router1","router2") },
    @{ Id="09-ospf"; Title="OSPF"; Goals=@("Router ID","Instance/Area","interface-template","Neighbor/LSDB","链路故障") ; Topo="R1 -------- R2`n |           |`n +---- R3 ---+"; Routers=@("router1","router2","router3") },
    @{ Id="10-bgp"; Title="BGP"; Goals=@("eBGP 会话","宣告前缀","filter","RPKI 预留") ; Topo="AS65001 [R1] ---- [R2] AS65002"; Routers=@("router1","router2") },
    @{ Id="11-vrf"; Title="VRF"; Goals=@("多表","接口绑定","受控互通") ; Topo="VRF-A ---- [R1] ---- VRF-B"; Routers=@("router1") },
    @{ Id="12-qos"; Title="QoS"; Goals=@("simple queue","queue tree","观察延迟") ; Topo="LAN ---- [R1] ---- WAN (限速)"; Routers=@("router1") },
    @{ Id="13-vrrp"; Title="VRRP"; Goals=@("VRID","主备","切换验证") ; Topo="LAN ---- [R1] [R2] ---- 上行"; Routers=@("router1","router2") },
    @{ Id="14-mpls"; Title="MPLS"; Goals=@("LDP","标签路径","L3VPN 预览") ; Topo="CE1 -- PE1 -- P -- PE2 -- CE2"; Routers=@("pe1","p","pe2") },
    @{ Id="15-automation"; Title="Automation"; Goals=@("脚本备份","scheduler","REST 读取接口") ; Topo="Admin PC -- API/SSH -- [R1]"; Routers=@("router1") }
)

foreach ($lab in $labs) {
    $dir = Join-Path $Course ("labs\" + $lab.Id)
    $goalMd = ($lab.Goals | ForEach-Object { "- $_" }) -join "`n"
    $i = 1
    $learn = @()
    foreach ($g in $lab.Goals) { $learn += "$i. $g"; $i++ }
    $learnMd = $learn -join "`n"
    $rscNote = @"
# RouterOS v7 lab config — $($lab.Id)
# Import: /import file-name=<this-file>
# 按实验 README 逐步配置，不要在未理解的情况下一次性导入生产设备。
"@
    foreach ($r in $lab.Routers) {
        Write-File (Join-Path $dir "$r.rsc") $rscNote
    }
    Write-File (Join-Path $dir "README.md") @"
# Lab $($lab.Id.Substring(0,2)) - $($lab.Title)

目标：

$goalMd

Topology:

``````
$($lab.Topo)
``````

实验环境：

RouterOS 7.x

学习内容：

$learnMd

拓扑图：将 ``topology.drawio`` 导出为 ``topology.png`` 后放在本目录。
"@
    Write-File (Join-Path $dir "troubleshooting.md") @"
# $($lab.Title) 排错

## 现象

（待写）

## 检查顺序

1. 接口状态 / 网线 / VLAN
2. 地址与路由
3. 防火墙与 NAT
4. 协议邻居（如有）
5. 日志与 Torch

## 常用命令

``````
/interface print
/ip address print
/ip route print
/log print
``````
"@
    Write-File (Join-Path $dir "topology.drawio") @"
<mxfile host="app.diagrams.net">
  <diagram name="$($lab.Title)">
    <mxGraphModel><root><mxCell id="0"/><mxCell id="1" parent="0"/></root></mxGraphModel>
  </diagram>
</mxfile>
"@
}

$configFiles = @{
    "baseline\home-router.rsc" = "家庭路由基线：WAN + LAN bridge + DHCP + DNS + masquerade + 最小 input"
    "baseline\office-router.rsc" = "小型办公室：VLAN + DHCP + 防火墙 + 管理加固"
    "baseline\enterprise-edge.rsc" = "企业出口：多 WAN 预留 + 管理面隔离"
    "firewall\basic.rsc" = "基础 filter"
    "firewall\secure-input.rsc" = "加固 input 链"
    "firewall\advanced.rsc" = "进阶 raw/filter"
    "vlan\access-trunk.rsc" = "vlan-filtering 示例"
    "routing\static-route.rsc" = "静态路由"
    "routing\ospf.rsc" = "OSPF v7 instance/area/template"
    "routing\bgp.rsc" = "BGP 会话骨架"
    "vpn\wireguard.rsc" = "WireGuard 接口骨架"
    "ospf\single-area.rsc" = "单区域 OSPF"
    "bgp\ebgp-basic.rsc" = "基础 eBGP"
    "qos\simple-queue.rsc" = "Simple Queue"
    "vrrp\pair.rsc" = "VRRP 对"
    "monitoring\snmp.rsc" = "SNMP 只读"
}
foreach ($kv in $configFiles.GetEnumerator()) {
    Write-File (Join-Path $Course ("configs\" + $kv.Key)) @"
# RouterOS v7 — $($kv.Value)
# 这是完整配置片段，导入前请按环境修改接口名与网段。
"@
}

$scriptFiles = @{
    "backup\backup-config.rsc" = "本地导出 backup/.rsc"
    "backup\backup-to-sftp.rsc" = "备份上传 SFTP"
    "monitoring\cpu-alert.rsc" = "CPU 告警"
    "monitoring\memory-alert.rsc" = "内存告警"
    "monitoring\interface-monitor.rsc" = "接口状态监控"
    "network\gateway-check.rsc" = "网关探测"
    "firewall\add-blocked-list.rsc" = "动态封禁辅助"
    "dhcp\lease-script.rsc" = "租约脚本钩子"
    "vpn\wg-watchdog.rsc" = "WireGuard 保活检查"
    "failover\wan-failover.rsc" = "WAN 切换"
    "failover\gateway-check.rsc" = "网关检查"
    "maintenance\reboot-warning.rsc" = "重启前提示"
    "maintenance\cleanup-logs.rsc" = "清理日志"
    "utilities\export-pretty.rsc" = "美观导出"
}
foreach ($kv in $scriptFiles.GetEnumerator()) {
    Write-File (Join-Path $Course ("scripts\" + $kv.Key)) @"
# RouterOS Script — $($kv.Value)
# 功能脚本，不是完整设备配置。请配合 Scheduler / Netwatch 使用。
"@
}

$autoDirs = @(
    "automation\python",
    "automation\ansible",
    "automation\terraform",
    "automation\rest-api",
    "automation\api-examples",
    "topologies\home-lab",
    "topologies\small-office",
    "topologies\enterprise",
    "topologies\isp",
    "topologies\bgp",
    "topologies\mpls",
    "topologies\ha",
    "diagrams\network",
    "diagrams\routing",
    "diagrams\firewall",
    "diagrams\vpn",
    "diagrams\architecture",
    "images\winbox",
    "images\cli",
    "images\lab",
    "cookbook\home",
    "cookbook\office",
    "cookbook\enterprise",
    "cookbook\isp",
    "cookbook\cloud",
    "migration\v6-to-v7",
    "migration\v7-upgrade",
    "migration\deprecated",
    ".github\workflows",
    ".github\ISSUE_TEMPLATE"
)
foreach ($d in $autoDirs) { Ensure-Gitkeep (Join-Path $Course $d) }

Write-File (Join-Path $Course "automation\python\README.md") "# Python`n`n通过 v7 REST API 管理 RouterOS。示例稍后补充。"
Write-File (Join-Path $Course "automation\ansible\README.md") "# Ansible`n`n用 community.routeros 或 REST 模块做幂等配置。"
Write-File (Join-Path $Course "automation\terraform\README.md") "# Terraform`n`n适合把云侧与 RouterOS 对端作为同一套基础设施。"
Write-File (Join-Path $Course "automation\rest-api\README.md") "# REST API`n`n见官方 REST API 文档。认证、只读探测、变更三步走。"
Write-File (Join-Path $Course "automation\api-examples\README.md") "# API 示例`n`n按 Lab 15 对齐。"

foreach ($t in @("home-lab","small-office","enterprise","isp","bgp","mpls","ha")) {
    Write-File (Join-Path $Course "topologies\$t\README.md") "# $t`n`n场景拓扑说明（待写）。图放在 ``diagrams/``，实验放在 ``labs/``。"
}

$sheets = @{
    "cli.md" = "CLI"
    "firewall.md" = "Firewall"
    "routing.md" = "Routing"
    "vlan.md" = "VLAN"
    "bgp.md" = "BGP"
    "ospf.md" = "OSPF"
    "scripting.md" = "Scripting"
    "troubleshooting.md" = "Troubleshooting"
}
foreach ($kv in $sheets.GetEnumerator()) {
    Write-File (Join-Path $Course ("cheatsheets\" + $kv.Key)) @"
# $($kv.Value) Cheat Sheet

> RouterOS v7 速查。详细原理见 ``docs/``。

| 任务 | 命令 |
| --- | --- |
| （待补） |  |
"@
}

Write-File (Join-Path $Course "glossary\networking.md") "# 网络术语`n`n（待写）"
Write-File (Join-Path $Course "glossary\routeros.md") "# RouterOS 术语`n`n（待写）"
Write-File (Join-Path $Course "glossary\abbreviations.md") "# 缩写`n`nOSPF、BGP、VRF、VRRP、RPKI、MPLS、VTEP……（待写）"

Write-File (Join-Path $Course "migration\v6-to-v7\README.md") "# v6 → v7`n`n重点：``/routing``、Routing Filter、wifi、REST API。不要把 v6 OSPF 命令直接贴进实验。"
Write-File (Join-Path $Course "migration\v7-upgrade\README.md") "# v7 升级路径`n`n长期包、备份、分批升级。"
Write-File (Join-Path $Course "migration\deprecated\README.md") "# 已过时做法`n`nPPTP、无 vlan-filtering 的旧交换机教程、v6 routing filter 语法。"

Write-File (Join-Path $Course "cookbook\home\README.md") "# 家庭网络场景"
Write-File (Join-Path $Course "cookbook\office\README.md") "# 办公室场景"
Write-File (Join-Path $Course "cookbook\enterprise\README.md") "# 企业场景"
Write-File (Join-Path $Course "cookbook\isp\README.md") "# ISP 场景"
Write-File (Join-Path $Course "cookbook\cloud\README.md") "# 云侧/远程接入场景"

Write-Host "scaffold dirs and stubs done"
Write-Host "articles=$($articles.Count) labs=$($labs.Count)"
