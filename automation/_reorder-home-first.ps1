#Requires -Version 5.1
$ErrorActionPreference = "Stop"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$Root = Split-Path -Parent $PSScriptRoot
$Utf8 = New-Object System.Text.UTF8Encoding $false

function Move-TwoPhase([string]$Base, [hashtable[]]$Pairs) {
    $temps = @()
    $i = 0
    foreach ($p in $Pairs) {
        $from = Join-Path $Base $p.From
        if (-not (Test-Path -LiteralPath $from)) { throw "missing $from" }
        $tmp = Join-Path $Base ("__reord_{0:D2}" -f $i)
        Move-Item -LiteralPath $from -Destination $tmp
        $temps += @{ Tmp = $tmp; To = (Join-Path $Base $p.To) }
        $i++
    }
    foreach ($t in $temps) {
        $parent = Split-Path $t.To
        if (-not (Test-Path -LiteralPath $parent)) {
            New-Item -ItemType Directory -Force -Path $parent | Out-Null
        }
        Move-Item -LiteralPath $t.Tmp -Destination $t.To
    }
}

function Rename-FilesInDir([string]$Dir, [string[]]$Order) {
    $i = 0
    foreach ($old in $Order) {
        $src = Join-Path $Dir $old
        if (-not (Test-Path -LiteralPath $src)) { throw "missing file $src" }
        $newName = "{0:D2}-$old" -f $i
        $dst = Join-Path $Dir $newName
        if ($src -ne $dst) {
            Move-Item -LiteralPath $src -Destination $dst
        }
        $i++
    }
}

# --- 1) prefix lesson files (old chapter numbers) ---
$docs = Join-Path $Root "docs"
Rename-FilesInDir (Join-Path $docs "00-入门(introduction)") @(
    "环境准备.md", "winbox.md", "what-is-routeros.md", "cli-basics.md",
    "webfig.md", "routeros-menu.md", "routeros-v7.md", "routeros-architecture.md"
)
Rename-FilesInDir (Join-Path $docs "01-网络基础(networking-basics)") @(
    "本周必读.md", "ipv4.md", "dns.md", "icmp.md", "ethernet.md",
    "arp.md", "subnetting.md", "vlan.md", "osi-tcpip.md", "ipv6.md"
)
Rename-FilesInDir (Join-Path $docs "02-RouterOS基础(routeros-basics)") @(
    "interfaces.md", "ip-address.md", "bridge.md", "dhcp-client.md",
    "dhcp-server.md", "dns.md", "users.md", "ntp.md", "interface-lists.md", "vlan.md"
)
Rename-FilesInDir (Join-Path $docs "07-DHCP与DNS(dhcp-dns)") @(
    "dhcp-server.md", "dhcp-client.md", "static-lease.md",
    "dns-forwarding.md", "dns-cache.md", "split-dns.md"
)
Rename-FilesInDir (Join-Path $docs "06-NAT(nat)") @(
    "nat.md", "masquerade.md", "port-forward.md", "srcnat.md",
    "dstnat.md", "hairpin-nat.md", "nat-troubleshooting.md"
)
Rename-FilesInDir (Join-Path $docs "05-防火墙(firewall)") @(
    "firewall-concepts.md", "filter.md", "connection-tracking.md", "fasttrack.md",
    "address-list.md", "nat.md", "mangle.md", "raw.md", "layer7.md", "advanced-firewall.md"
)
Rename-FilesInDir (Join-Path $docs "08-无线(wireless)") @(
    "wireless-basics.md", "wifi.md", "ssid.md", "roaming.md", "wifiwave2.md", "capsman.md"
)
Rename-FilesInDir (Join-Path $docs "09-VPN(vpn)") @(
    "vpn-overview.md", "wireguard.md", "l2tp.md", "sstp.md", "ovpn.md",
    "ipsec.md", "gre.md", "eoip.md", "vxlan.md", "pptp.md"
)
Rename-FilesInDir (Join-Path $docs "11-QoS(qos)") @(
    "qos-concepts.md", "simple-queue.md", "pcq.md", "queue-tree.md",
    "fq-codel.md", "cake.md", "qos-design.md"
)
Rename-FilesInDir (Join-Path $docs "12-高可用(high-availability)") @(
    "dual-wan.md", "failover.md", "load-balancing.md", "vrrp.md", "connection-tracking-sync.md"
)
Rename-FilesInDir (Join-Path $docs "03-二层交换(switching)") @(
    "bridge.md", "access-port.md", "trunk-port.md", "vlan-filtering.md",
    "bridge-vlan-table.md", "hybrid-port.md", "rstp.md", "mstp.md", "hardware-offload.md"
)
Rename-FilesInDir (Join-Path $docs "04-三层路由(routing)") @(
    "routing-basics.md", "default-route.md", "static-route.md", "routing-table.md",
    "route-selection.md", "ecmp.md", "policy-routing.md", "recursive-route.md",
    "routing-rule.md", "vrf.md"
)
Rename-FilesInDir (Join-Path $docs "15-监控(monitoring)") @(
    "logging.md", "torch.md", "netwatch.md", "snmp.md",
    "profiler.md", "traffic-flow.md", "monitoring-platform.md"
)
Rename-FilesInDir (Join-Path $docs "16-安全(security)") @(
    "management-security.md", "service-security.md", "brute-force-protection.md",
    "ssh-hardening.md", "user-permissions.md", "firewall-hardening.md",
    "certificates.md", "security-checklist.md"
)
Rename-FilesInDir (Join-Path $docs "17-故障排查(troubleshooting)") @(
    "troubleshooting-methodology.md", "no-internet.md", "dns-problem.md",
    "firewall-problem.md", "routing-problem.md", "mtu-problem.md",
    "vlan-problem.md", "performance-problem.md", "packet-analysis.md"
)
Rename-FilesInDir (Join-Path $docs "18-性能优化(performance)") @(
    "fasttrack.md", "fastpath.md", "cpu.md", "memory.md",
    "hardware-offload.md", "queues-performance.md", "performance-tuning.md"
)
Rename-FilesInDir (Join-Path $docs "14-自动化(automation)") @(
    "scheduler.md", "netwatch.md", "scripting.md", "ssh.md",
    "api.md", "rest-api.md", "automation-design.md"
)
Rename-FilesInDir (Join-Path $docs "19-生产环境(production)") @(
    "backup.md", "restore.md", "upgrade.md", "rollback.md",
    "deployment.md", "configuration-management.md", "production-checklist.md"
)
Rename-FilesInDir (Join-Path $docs "10-动态路由(dynamic-routing)") @(
    "ospf.md", "ospfv3.md", "rip.md", "bgp.md", "bfd.md",
    "routing-filters.md", "bgp-policy.md", "communities.md", "rpki.md"
)
Rename-FilesInDir (Join-Path $docs "13-MPLS(mpls)") @(
    "mpls-basics.md", "ldp.md", "l3vpn.md", "traffic-engineering.md"
)
Rename-FilesInDir (Join-Path $docs "20-高级(advanced)") @(
    "architecture.md", "network-segmentation.md", "enterprise-network.md",
    "multi-wan-architecture.md", "multi-vrf.md", "bgp-design.md",
    "isp-design.md", "service-provider.md", "large-scale-deployment.md"
)

# --- 2) rename chapter dirs ---
Move-TwoPhase $docs @(
    @{ From = "07-DHCP与DNS(dhcp-dns)"; To = "03-DHCP与DNS(dhcp-dns)" },
    @{ From = "06-NAT(nat)"; To = "04-NAT(nat)" },
    @{ From = "08-无线(wireless)"; To = "06-无线(wireless)" },
    @{ From = "09-VPN(vpn)"; To = "07-VPN(vpn)" },
    @{ From = "11-QoS(qos)"; To = "08-QoS(qos)" },
    @{ From = "12-高可用(high-availability)"; To = "09-高可用(high-availability)" },
    @{ From = "03-二层交换(switching)"; To = "10-二层交换(switching)" },
    @{ From = "04-三层路由(routing)"; To = "11-三层路由(routing)" },
    @{ From = "15-监控(monitoring)"; To = "12-监控(monitoring)" },
    @{ From = "16-安全(security)"; To = "13-安全(security)" },
    @{ From = "17-故障排查(troubleshooting)"; To = "14-故障排查(troubleshooting)" },
    @{ From = "18-性能优化(performance)"; To = "15-性能优化(performance)" },
    @{ From = "14-自动化(automation)"; To = "16-自动化(automation)" },
    @{ From = "19-生产环境(production)"; To = "17-生产环境(production)" },
    @{ From = "10-动态路由(dynamic-routing)"; To = "18-动态路由(dynamic-routing)" },
    @{ From = "13-MPLS(mpls)"; To = "19-MPLS(mpls)" }
)

# --- 3) labs ---
$labs = Join-Path $Root "labs"
Move-TwoPhase $labs @(
    @{ From = "02-PPPoE拨号(pppoe)"; To = "03-PPPoE拨号(pppoe)" },
    @{ From = "06-NAT(nat)"; To = "04-NAT(nat)" },
    @{ From = "08-WireGuard(wireguard)"; To = "06-WireGuard(wireguard)" },
    @{ From = "12-QoS(qos)"; To = "08-QoS(qos)" },
    @{ From = "03-VLAN(vlan)"; To = "09-VLAN(vlan)" },
    @{ From = "04-跨VLAN路由(inter-vlan-routing)"; To = "10-跨VLAN路由(inter-vlan-routing)" },
    @{ From = "09-OSPF(ospf)"; To = "11-OSPF(ospf)" },
    @{ From = "10-BGP(bgp)"; To = "12-BGP(bgp)" },
    @{ From = "11-VRF(vrf)"; To = "13-VRF(vrf)" },
    @{ From = "13-VRRP(vrrp)"; To = "14-VRRP(vrrp)" },
    @{ From = "14-MPLS(mpls)"; To = "15-MPLS(mpls)" },
    @{ From = "15-自动化(automation)"; To = "16-自动化(automation)" }
)

# --- 4) cookbook / configs / cheatsheets / scripts ---
Move-TwoPhase (Join-Path $Root "cookbook") @(
    @{ From = "home"; To = "00-home" },
    @{ From = "office"; To = "01-office" },
    @{ From = "enterprise"; To = "02-enterprise" },
    @{ From = "isp"; To = "03-isp" },
    @{ From = "cloud"; To = "04-cloud" }
)
$cfg = Join-Path $Root "configs"
Move-TwoPhase $cfg @(
    @{ From = "baseline"; To = "00-baseline" },
    @{ From = "firewall"; To = "01-firewall" },
    @{ From = "vpn"; To = "02-vpn" },
    @{ From = "qos"; To = "03-qos" },
    @{ From = "vlan"; To = "04-vlan" },
    @{ From = "monitoring"; To = "05-monitoring" },
    @{ From = "routing"; To = "06-routing" },
    @{ From = "ospf"; To = "07-ospf" },
    @{ From = "bgp"; To = "08-bgp" },
    @{ From = "vrrp"; To = "09-vrrp" }
)
Rename-FilesInDir (Join-Path $cfg "00-baseline") @("home-router.rsc", "office-router.rsc", "enterprise-edge.rsc")
Rename-FilesInDir (Join-Path $cfg "01-firewall") @("basic.rsc", "secure-input.rsc", "advanced.rsc")

$cs = Join-Path $Root "cheatsheets"
Rename-FilesInDir $cs @("cli.md", "firewall.md", "troubleshooting.md", "vlan.md", "routing.md", "ospf.md", "bgp.md", "scripting.md")

$scr = Join-Path $Root "scripts"
Move-TwoPhase $scr @(
    @{ From = "backup"; To = "00-backup" },
    @{ From = "dhcp"; To = "01-dhcp" },
    @{ From = "firewall"; To = "02-firewall" },
    @{ From = "failover"; To = "03-failover" },
    @{ From = "vpn"; To = "04-vpn" },
    @{ From = "monitoring"; To = "05-monitoring" },
    @{ From = "maintenance"; To = "06-maintenance" },
    @{ From = "network"; To = "07-network" },
    @{ From = "utilities"; To = "08-utilities" }
)

# --- 5) text replacements (unique folder names, longest first where needed) ---
$repl = @(
    @{ A = "cookbook/home"; B = "cookbook/00-home" },
    @{ A = "cookbook\home"; B = "cookbook\00-home" },
    @{ A = "../cookbook/home/"; B = "../cookbook/00-home/" },
    @{ A = "../../cookbook/home/"; B = "../../cookbook/00-home/" },
    @{ A = "configs/baseline"; B = "configs/00-baseline" },
    @{ A = "cheatsheets/cli.md"; B = "cheatsheets/00-cli.md" },
    @{ A = "02-PPPoE拨号(pppoe)"; B = "03-PPPoE拨号(pppoe)" },
    @{ A = "07-DHCP与DNS(dhcp-dns)"; B = "03-DHCP与DNS(dhcp-dns)" },
    @{ A = "06-NAT(nat)"; B = "04-NAT(nat)" },
    @{ A = "08-无线(wireless)"; B = "06-无线(wireless)" },
    @{ A = "08-WireGuard(wireguard)"; B = "06-WireGuard(wireguard)" },
    @{ A = "09-VPN(vpn)"; B = "07-VPN(vpn)" },
    @{ A = "07-双WAN(dual-wan)"; B = "07-双WAN(dual-wan)" },
    @{ A = "11-QoS(qos)"; B = "08-QoS(qos)" },
    @{ A = "12-QoS(qos)"; B = "08-QoS(qos)" },
    @{ A = "12-高可用(high-availability)"; B = "09-高可用(high-availability)" },
    @{ A = "03-VLAN(vlan)"; B = "09-VLAN(vlan)" },
    @{ A = "03-二层交换(switching)"; B = "10-二层交换(switching)" },
    @{ A = "04-跨VLAN路由(inter-vlan-routing)"; B = "10-跨VLAN路由(inter-vlan-routing)" },
    @{ A = "04-三层路由(routing)"; B = "11-三层路由(routing)" },
    @{ A = "09-OSPF(ospf)"; B = "11-OSPF(ospf)" },
    @{ A = "15-监控(monitoring)"; B = "12-监控(monitoring)" },
    @{ A = "10-BGP(bgp)"; B = "12-BGP(bgp)" },
    @{ A = "16-安全(security)"; B = "13-安全(security)" },
    @{ A = "11-VRF(vrf)"; B = "13-VRF(vrf)" },
    @{ A = "17-故障排查(troubleshooting)"; B = "14-故障排查(troubleshooting)" },
    @{ A = "13-VRRP(vrrp)"; B = "14-VRRP(vrrp)" },
    @{ A = "18-性能优化(performance)"; B = "15-性能优化(performance)" },
    @{ A = "14-MPLS(mpls)"; B = "15-MPLS(mpls)" },
    @{ A = "14-自动化(automation)"; B = "16-自动化(automation)" },
    @{ A = "15-自动化(automation)"; B = "16-自动化(automation)" },
    @{ A = "19-生产环境(production)"; B = "17-生产环境(production)" },
    @{ A = "10-动态路由(dynamic-routing)"; B = "18-动态路由(dynamic-routing)" },
    @{ A = "13-MPLS(mpls)"; B = "19-MPLS(mpls)" }
)

# file stem replacements inside COURSE-TREE style paths (old dir already rewritten)
$fileStems = @{
    "环境准备.md" = "00-环境准备.md"
    "winbox.md" = "01-winbox.md"
    "what-is-routeros.md" = "02-what-is-routeros.md"
    "cli-basics.md" = "03-cli-basics.md"
    "webfig.md" = "04-webfig.md"
    "routeros-menu.md" = "05-routeros-menu.md"
    "routeros-v7.md" = "06-routeros-v7.md"
    "routeros-architecture.md" = "07-routeros-architecture.md"
    "本周必读.md" = "00-本周必读.md"
}

function Get-TextFiles([string]$Path) {
    Get-ChildItem -LiteralPath $Path -Recurse -File | Where-Object {
        $_.Extension -match '\.(md|rsc|ps1|txt|yml|yaml)$' -and
        $_.Name -ne "_reorder-home-first.ps1"
    }
}

$allFiles = @(Get-TextFiles $Root)
# skip .git
$allFiles = $allFiles | Where-Object { $_.FullName -notmatch '\\\.git\\' }

# Folder replacements: skip 07-双WAN identity; skip 13-MPLS until after 14-MPLS labs
$replWork = $repl | Where-Object { $_.A -ne $_.B }

# Critical: 13-MPLS docs vs 14-MPLS labs. Do 14-MPLS first (already in list before 13-MPLS).
foreach ($f in $allFiles) {
    $c = [System.IO.File]::ReadAllText($f.FullName)
    $orig = $c
    foreach ($r in $replWork) {
        $c = $c.Replace($r.A, $r.B)
    }
    if ($c -ne $orig) {
        [System.IO.File]::WriteAllText($f.FullName, $c, $Utf8)
    }
}

# COURSE-TREE + indexes: rewrite lesson filenames using known maps per NEW dir
function Apply-FileMap([string]$DirRel, [hashtable]$Map) {
    $needlePrefix = $DirRel.Replace("\", "/")
    foreach ($f in $allFiles) {
        $c = [System.IO.File]::ReadAllText($f.FullName)
        $orig = $c
        foreach ($k in $Map.Keys) {
            $c = $c.Replace("$needlePrefix/$k", "$needlePrefix/$($Map[$k])")
            $c = $c.Replace("$k", $Map[$k]) # only if unique? dangerous
        }
        if ($c -ne $orig) { [System.IO.File]::WriteAllText($f.FullName, $c, $Utf8) }
    }
}

# Do NOT global-replace unique-unsafe stems. Rewrite chapter READMEs from disk instead.
# Patch COURSE-TREE paths: old filename without prefix -> prefixed, scoped by directory.

$chapterFileMaps = @{
    "00-入门(introduction)" = @{
        "环境准备.md" = "00-环境准备.md"; "winbox.md" = "01-winbox.md"; "what-is-routeros.md" = "02-what-is-routeros.md"
        "cli-basics.md" = "03-cli-basics.md"; "webfig.md" = "04-webfig.md"; "routeros-menu.md" = "05-routeros-menu.md"
        "routeros-v7.md" = "06-routeros-v7.md"; "routeros-architecture.md" = "07-routeros-architecture.md"
    }
    "01-网络基础(networking-basics)" = @{
        "本周必读.md" = "00-本周必读.md"; "ipv4.md" = "01-ipv4.md"; "dns.md" = "02-dns.md"; "icmp.md" = "03-icmp.md"
        "ethernet.md" = "04-ethernet.md"; "arp.md" = "05-arp.md"; "subnetting.md" = "06-subnetting.md"
        "vlan.md" = "07-vlan.md"; "osi-tcpip.md" = "08-osi-tcpip.md"; "ipv6.md" = "09-ipv6.md"
    }
    "02-RouterOS基础(routeros-basics)" = @{
        "interfaces.md" = "00-interfaces.md"; "ip-address.md" = "01-ip-address.md"; "bridge.md" = "02-bridge.md"
        "dhcp-client.md" = "03-dhcp-client.md"; "dhcp-server.md" = "04-dhcp-server.md"; "dns.md" = "05-dns.md"
        "users.md" = "06-users.md"; "ntp.md" = "07-ntp.md"; "interface-lists.md" = "08-interface-lists.md"; "vlan.md" = "09-vlan.md"
    }
    "03-DHCP与DNS(dhcp-dns)" = @{
        "dhcp-server.md" = "00-dhcp-server.md"; "dhcp-client.md" = "01-dhcp-client.md"; "static-lease.md" = "02-static-lease.md"
        "dns-forwarding.md" = "03-dns-forwarding.md"; "dns-cache.md" = "04-dns-cache.md"; "split-dns.md" = "05-split-dns.md"
    }
    "04-NAT(nat)" = @{
        "nat.md" = "00-nat.md"; "masquerade.md" = "01-masquerade.md"; "port-forward.md" = "02-port-forward.md"
        "srcnat.md" = "03-srcnat.md"; "dstnat.md" = "04-dstnat.md"; "hairpin-nat.md" = "05-hairpin-nat.md"
        "nat-troubleshooting.md" = "06-nat-troubleshooting.md"
    }
    "05-防火墙(firewall)" = @{
        "firewall-concepts.md" = "00-firewall-concepts.md"; "filter.md" = "01-filter.md"
        "connection-tracking.md" = "02-connection-tracking.md"; "fasttrack.md" = "03-fasttrack.md"
        "address-list.md" = "04-address-list.md"; "nat.md" = "05-nat.md"; "mangle.md" = "06-mangle.md"
        "raw.md" = "07-raw.md"; "layer7.md" = "08-layer7.md"; "advanced-firewall.md" = "09-advanced-firewall.md"
    }
    "06-无线(wireless)" = @{
        "wireless-basics.md" = "00-wireless-basics.md"; "wifi.md" = "01-wifi.md"; "ssid.md" = "02-ssid.md"
        "roaming.md" = "03-roaming.md"; "wifiwave2.md" = "04-wifiwave2.md"; "capsman.md" = "05-capsman.md"
    }
    "07-VPN(vpn)" = @{
        "vpn-overview.md" = "00-vpn-overview.md"; "wireguard.md" = "01-wireguard.md"; "l2tp.md" = "02-l2tp.md"
        "sstp.md" = "03-sstp.md"; "ovpn.md" = "04-ovpn.md"; "ipsec.md" = "05-ipsec.md"; "gre.md" = "06-gre.md"
        "eoip.md" = "07-eoip.md"; "vxlan.md" = "08-vxlan.md"; "pptp.md" = "09-pptp.md"
    }
    "08-QoS(qos)" = @{
        "qos-concepts.md" = "00-qos-concepts.md"; "simple-queue.md" = "01-simple-queue.md"; "pcq.md" = "02-pcq.md"
        "queue-tree.md" = "03-queue-tree.md"; "fq-codel.md" = "04-fq-codel.md"; "cake.md" = "05-cake.md"
        "qos-design.md" = "06-qos-design.md"
    }
    "09-高可用(high-availability)" = @{
        "dual-wan.md" = "00-dual-wan.md"; "failover.md" = "01-failover.md"; "load-balancing.md" = "02-load-balancing.md"
        "vrrp.md" = "03-vrrp.md"; "connection-tracking-sync.md" = "04-connection-tracking-sync.md"
    }
    "10-二层交换(switching)" = @{
        "bridge.md" = "00-bridge.md"; "access-port.md" = "01-access-port.md"; "trunk-port.md" = "02-trunk-port.md"
        "vlan-filtering.md" = "03-vlan-filtering.md"; "bridge-vlan-table.md" = "04-bridge-vlan-table.md"
        "hybrid-port.md" = "05-hybrid-port.md"; "rstp.md" = "06-rstp.md"; "mstp.md" = "07-mstp.md"
        "hardware-offload.md" = "08-hardware-offload.md"
    }
    "11-三层路由(routing)" = @{
        "routing-basics.md" = "00-routing-basics.md"; "default-route.md" = "01-default-route.md"
        "static-route.md" = "02-static-route.md"; "routing-table.md" = "03-routing-table.md"
        "route-selection.md" = "04-route-selection.md"; "ecmp.md" = "05-ecmp.md"
        "policy-routing.md" = "06-policy-routing.md"; "recursive-route.md" = "07-recursive-route.md"
        "routing-rule.md" = "08-routing-rule.md"; "vrf.md" = "09-vrf.md"
    }
    "12-监控(monitoring)" = @{
        "logging.md" = "00-logging.md"; "torch.md" = "01-torch.md"; "netwatch.md" = "02-netwatch.md"
        "snmp.md" = "03-snmp.md"; "profiler.md" = "04-profiler.md"; "traffic-flow.md" = "05-traffic-flow.md"
        "monitoring-platform.md" = "06-monitoring-platform.md"
    }
    "13-安全(security)" = @{
        "management-security.md" = "00-management-security.md"; "service-security.md" = "01-service-security.md"
        "brute-force-protection.md" = "02-brute-force-protection.md"; "ssh-hardening.md" = "03-ssh-hardening.md"
        "user-permissions.md" = "04-user-permissions.md"; "firewall-hardening.md" = "05-firewall-hardening.md"
        "certificates.md" = "06-certificates.md"; "security-checklist.md" = "07-security-checklist.md"
    }
    "14-故障排查(troubleshooting)" = @{
        "troubleshooting-methodology.md" = "00-troubleshooting-methodology.md"; "no-internet.md" = "01-no-internet.md"
        "dns-problem.md" = "02-dns-problem.md"; "firewall-problem.md" = "03-firewall-problem.md"
        "routing-problem.md" = "04-routing-problem.md"; "mtu-problem.md" = "05-mtu-problem.md"
        "vlan-problem.md" = "06-vlan-problem.md"; "performance-problem.md" = "07-performance-problem.md"
        "packet-analysis.md" = "08-packet-analysis.md"
    }
    "15-性能优化(performance)" = @{
        "fasttrack.md" = "00-fasttrack.md"; "fastpath.md" = "01-fastpath.md"; "cpu.md" = "02-cpu.md"
        "memory.md" = "03-memory.md"; "hardware-offload.md" = "04-hardware-offload.md"
        "queues-performance.md" = "05-queues-performance.md"; "performance-tuning.md" = "06-performance-tuning.md"
    }
    "16-自动化(automation)" = @{
        "scheduler.md" = "00-scheduler.md"; "netwatch.md" = "01-netwatch.md"; "scripting.md" = "02-scripting.md"
        "ssh.md" = "03-ssh.md"; "api.md" = "04-api.md"; "rest-api.md" = "05-rest-api.md"
        "automation-design.md" = "06-automation-design.md"
    }
    "17-生产环境(production)" = @{
        "backup.md" = "00-backup.md"; "restore.md" = "01-restore.md"; "upgrade.md" = "02-upgrade.md"
        "rollback.md" = "03-rollback.md"; "deployment.md" = "04-deployment.md"
        "configuration-management.md" = "05-configuration-management.md"; "production-checklist.md" = "06-production-checklist.md"
    }
    "18-动态路由(dynamic-routing)" = @{
        "ospf.md" = "00-ospf.md"; "ospfv3.md" = "01-ospfv3.md"; "rip.md" = "02-rip.md"; "bgp.md" = "03-bgp.md"
        "bfd.md" = "04-bfd.md"; "routing-filters.md" = "05-routing-filters.md"; "bgp-policy.md" = "06-bgp-policy.md"
        "communities.md" = "07-communities.md"; "rpki.md" = "08-rpki.md"
    }
    "19-MPLS(mpls)" = @{
        "mpls-basics.md" = "00-mpls-basics.md"; "ldp.md" = "01-ldp.md"; "l3vpn.md" = "02-l3vpn.md"
        "traffic-engineering.md" = "03-traffic-engineering.md"
    }
    "20-高级(advanced)" = @{
        "architecture.md" = "00-architecture.md"; "network-segmentation.md" = "01-network-segmentation.md"
        "enterprise-network.md" = "02-enterprise-network.md"; "multi-wan-architecture.md" = "03-multi-wan-architecture.md"
        "multi-vrf.md" = "04-multi-vrf.md"; "bgp-design.md" = "05-bgp-design.md"; "isp-design.md" = "06-isp-design.md"
        "service-provider.md" = "07-service-provider.md"; "large-scale-deployment.md" = "08-large-scale-deployment.md"
    }
}

$treePath = Join-Path $Root "COURSE-TREE.md"
$tree = [System.IO.File]::ReadAllText($treePath)
foreach ($dir in $chapterFileMaps.Keys) {
    $map = $chapterFileMaps[$dir]
    foreach ($k in $map.Keys) {
        $tree = $tree.Replace("``$dir/$k``", "``$dir/$($map[$k])``")
        $tree = $tree.Replace("`$dir/$k", "$dir/$($map[$k])")
        $tree = $tree.Replace("$dir/$k", "$dir/$($map[$k])")
    }
}
[System.IO.File]::WriteAllText($treePath, $tree, $Utf8)

# Sort COURSE-TREE data rows by path
$lines = [System.IO.File]::ReadAllLines($treePath)
$head = New-Object System.Collections.Generic.List[string]
$rows = New-Object System.Collections.Generic.List[string]
$tail = New-Object System.Collections.Generic.List[string]
$mode = "head"
foreach ($line in $lines) {
    if ($line -match '^\| `' ) { $mode = "rows"; $rows.Add($line); continue }
    if ($mode -eq "rows") { $tail.Add($line); continue }
    $head.Add($line)
}
$sorted = $rows | Sort-Object
$out = New-Object System.Collections.Generic.List[string]
foreach ($x in $head) { $out.Add($x) }
foreach ($x in $sorted) { $out.Add($x) }
foreach ($x in $tail) { $out.Add($x) }
[System.IO.File]::WriteAllLines($treePath, $out.ToArray(), $Utf8)

# Chapter README from disk order
$meta = @{
    "00-入门(introduction)" = @{ T = "00 入门"; I = "先把 WinBox 连上。家庭用户每天都要用到登录和接口。"; L = "00, 01" }
    "01-网络基础(networking-basics)" = @{ T = "01 网络基础"; I = "第一周只读本周必读。地址、网关、DNS 是上网必会的。"; L = "01, 02, 03" }
    "02-RouterOS基础(routeros-basics)" = @{ T = "02 RouterOS 基础"; I = "接口、地址、网桥、DHCP:家里改路由器最常碰的菜单。"; L = "01, 02" }
    "03-DHCP与DNS(dhcp-dns)" = @{ T = "03 DHCP 与 DNS"; I = "电脑自动拿地址、路由器当 DNS，家庭网每天都在用。"; L = "02" }
    "04-NAT(nat)" = @{ T = "04 NAT"; I = "共享上网和端口映射。拨号后 masquerade 出接口用 pppoe-out1。"; L = "03, 04" }
    "05-防火墙(firewall)" = @{ T = "05 防火墙"; I = "能上网之后收紧 input/forward。"; L = "05" }
    "06-无线(wireless)" = @{ T = "06 无线"; I = "家用 AP / 一体机最常用; v7 用 wifi 菜单。"; L = "-" }
    "07-VPN(vpn)" = @{ T = "07 VPN"; I = "个人远程回家优先 WireGuard。"; L = "06" }
    "08-QoS(qos)" = @{ T = "08 QoS"; I = "限速、游戏/上课抢带宽。"; L = "08" }
    "09-高可用(high-availability)" = @{ T = "09 高可用"; I = "双宽带家庭看 Dual WAN; VRRP 较少。"; L = "07, 14" }
    "10-二层交换(switching)" = @{ T = "10 二层交换"; I = "单网段家庭可后看; 有访客网/摄像头 VLAN 再读。"; L = "09, 10" }
    "11-三层路由(routing)" = @{ T = "11 三层路由"; I = "默认路由日常会碰到; 策略路由、VRF 较少。"; L = "10, 07" }
    "12-监控(monitoring)" = @{ T = "12 监控"; I = "日志和 Torch 排障常用；平台后做。"; L = "16" }
    "13-安全(security)" = @{ T = "13 安全"; I = "改密、关多余服务、限制 WinBox 来源。"; L = "05" }
    "14-故障排查(troubleshooting)" = @{ T = "14 故障排查"; I = "不能上网时按这篇分层查。"; L = "各 Lab 的 troubleshooting.md" }
    "15-性能优化(performance)" = @{ T = "15 性能优化"; I = "感觉慢再看 FastTrack / CPU。"; L = "05, 08" }
    "16-自动化(automation)" = @{ T = "16 自动化"; I = "备份脚本、定时任务; 不是开局必做。"; L = "16" }
    "17-生产环境(production)" = @{ T = "17 生产环境"; I = "备份/升级。家里至少学会备份。"; L = "16" }
    "18-动态路由(dynamic-routing)" = @{ T = "18 动态路由"; I = "家庭几乎不用 OSPF/BGP。"; L = "11, 12" }
    "19-MPLS(mpls)" = @{ T = "19 MPLS"; I = "运营商/专家向, 家庭跳过。"; L = "15" }
    "20-高级(advanced)" = @{ T = "20 高级"; I = "企业/ISP 设计。"; L = "-" }
}

foreach ($key in $meta.Keys) {
    $dir = Join-Path $docs $key
    $m = $meta[$key]
    $files = Get-ChildItem -LiteralPath $dir -File -Filter *.md | Where-Object { $_.Name -ne "README.md" } | Sort-Object Name
    $sb = New-Object System.Text.StringBuilder
    [void]$sb.AppendLine("# $($m.T)")
    [void]$sb.AppendLine()
    [void]$sb.AppendLine($m.I)
    [void]$sb.AppendLine()
    [void]$sb.AppendLine("对应 Lab：$($m.L)")
    [void]$sb.AppendLine()
    [void]$sb.AppendLine("课文状态：**可跟做** = 第一周能照着做；**提纲** = 已建文件、正文待写。首页只推荐「可跟做」。")
    [void]$sb.AppendLine()
    [void]$sb.AppendLine("| 课文 | 状态 |")
    [void]$sb.AppendLine("| --- | --- |")
    foreach ($file in $files) {
        $stem = [IO.Path]::GetFileNameWithoutExtension($file.Name)
        $display = $stem -replace '^\d+-', ''
        $st = if ($display -match '环境准备|本周必读') { "可跟做" } else { "提纲" }
        [void]$sb.AppendLine("| [$display]($($file.Name)) | $st |")
    }
    [void]$sb.AppendLine()
    [void]$sb.AppendLine("完整地图见仓库根 [COURSE-TREE.md](../../COURSE-TREE.md)。")
    [System.IO.File]::WriteAllText((Join-Path $dir "README.md"), $sb.ToString().Replace("`r`n", "`n"), $Utf8)
}

Write-Host "reorder done"
