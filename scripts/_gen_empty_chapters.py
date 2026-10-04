# one-off writer for empty chapter lessons
from pathlib import Path

ROOT = Path(r"g:\gitea\RouterOS入门与精通\docs")

NET = """
- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`（改成你的口）
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的管理员密码）
- 身份示例：`R1`
"""


def lesson(title, purpose, extra_net, principle_cap, steps, check_win, check_cli, faq=None):
    parts = [
        f"# {title}",
        "",
        "> 适用版本：RouterOS 7.x",
        "",
        "## 目的",
        "",
        purpose,
        "",
        "## 网络",
        NET.strip(),
    ]
    if extra_net:
        parts += ["", extra_net]
    parts += [
        "",
        "## 先看懂",
        "",
        principle_cap.split("\n", 1)[0] if False else "",
    ]
    # principle_cap is caption text; body line before image
    body, cap = principle_cap
    parts = [
        f"# {title}",
        "",
        "> 适用版本：RouterOS 7.x",
        "",
        "## 目的",
        "",
        purpose,
        "",
        "## 网络",
        "",
        NET.strip(),
    ]
    if extra_net:
        parts += ["", extra_net]
    parts += [
        "",
        "## 先看懂",
        "",
        body,
        "",
        f"![图(1) {cap}](images/00-原理.png)",
        "",
        f'<p align="center">图(1) {cap}</p>',
        "",
    ]
    n = 2
    for title_s, win, action, img, cap_s, cli in steps:
        parts += [
            f"## 第{n-1}步：{title_s}",
            "",
            f"WinBox：`{win}`",
            "",
            f"动作：{action}",
            "",
            f"![图({n}) {cap_s}]({img})",
            "",
            f'<p align="center">图({n}) {cap_s}</p>',
            "",
            "",
            "```routeros",
            cli.strip(),
            "```",
            "",
        ]
        n += 1
    parts += [
        "## 检查",
        "",
        f"WinBox：{check_win}",
        "",
        "```routeros",
        check_cli.strip(),
        "```",
        "",
    ]
    if faq:
        parts += ["## 常见问题", "", faq, ""]
    return "\n".join(parts).replace("\n\n\n", "\n\n")


lessons = []

# ----- 06 wifi -----
lessons.append((
    "06-无线(wireless)/01-家里WiFi/01-家里WiFi.md",
    lesson(
        "家里 Wi-Fi",
        "在带无线网卡的板子上开家里 SSID，手机连上走 LAN。",
        "没有无线网卡的 x86 虚拟机没有 radio，换 hAP / Audience 这类板子做。菜单是 `WiFi`（wifi-qcom），不是旧的 `Wireless`。",
        ("手机连 R1 的 SSID，流量进 bridge，再走家里上网。", "家里 Wi-Fi"),
        [
            ("加安全配置", "WiFi → Security → +",
             "Name=`sec-home`，Authentication Types 勾 `WPA2 PSK` 和 `WPA3 PSK`，Passphrase 填你自己的 Wi-Fi 密码（教程里写成 `********`），WPS=`disabled`。",
             "images/01-安全.png", "安全配置",
             '/interface/wifi/security/add name=sec-home authentication-types=wpa2-psk,wpa3-psk passphrase="********" wps=disable'),
            ("加配置档案", "WiFi → Configuration → +",
             "Name=`cfg-home`，SSID=`Home-WiFi`，Country=`China`，Security=`sec-home`。",
             "images/02-配置.png", "配置档案",
             "/interface/wifi/configuration/add name=cfg-home ssid=Home-WiFi country=China security=sec-home"),
            ("套到 wifi1 并进桥", "WiFi → WiFi → 双击 wifi1；再 Bridge → Ports → +",
             "Configuration=`cfg-home`，Disabled 去掉。把 `wifi1` 加进 `bridge`。",
             "images/03-接口.png", "wifi1进桥",
             """/interface/wifi/set wifi1 configuration=cfg-home disabled=no
/interface/bridge/port/add bridge=bridge interface=wifi1 comment=lab-wifi"""),
        ],
        "wifi1 Running，手机能拿到 `192.168.88.0/24` 地址",
        """/interface/wifi/print
/interface/bridge/port/print where interface=wifi1""",
        "SSID 出来但没地址：确认 wifi1 已经在 bridge 上，DHCP 绑的是 bridge。",
    ),
))

lessons.append((
    "06-无线(wireless)/02-访客WiFi/02-访客WiFi.md",
    lesson(
        "访客 Wi-Fi",
        "再开一个访客 SSID，和家里网段分开。",
        "访客网段示例：`192.168.20.0/24`，接口 `vlan20` 或单独桥。本课用虚拟 AP + VLAN 20。",
        ("家里 SSID 走 VLAN10，访客 SSID 走 VLAN20，互不二层互通。", "访客 Wi-Fi"),
        [
            ("访客安全和配置", "WiFi → Security / Configuration → +",
             "Security Name=`sec-guest`，口令另设。Configuration Name=`cfg-guest`，SSID=`Guest-WiFi`，Country=`China`。",
             "images/01-访客配置.png", "访客配置",
             """/interface/wifi/security/add name=sec-guest authentication-types=wpa2-psk,wpa3-psk passphrase="********" wps=disable
/interface/wifi/datapath/add name=dp-guest client-isolation=yes
/interface/wifi/configuration/add name=cfg-guest ssid=Guest-WiFi country=China security=sec-guest datapath=dp-guest"""),
            ("加虚拟 AP", "WiFi → WiFi → +",
             "Name=`wifi-guest`，Master Interface=`wifi1`，Configuration=`cfg-guest`，Disabled 去掉。",
             "images/02-虚拟AP.png", "虚拟AP",
             "/interface/wifi/add name=wifi-guest master-interface=wifi1 configuration=cfg-guest disabled=no"),
            ("访客进 VLAN", "Bridge → VLANs；给访客口 PVID=20，并给 `vlan20` 配 `192.168.20.1/24` 和单独 DHCP。",
             "wifi-guest 不要和家里设备同一 PVID。",
             "images/03-vlan.png", "访客VLAN",
             """/interface/vlan/add name=vlan20 vlan-id=20 interface=bridge
/ip/address/add address=192.168.20.1/24 interface=vlan20 comment=lab-guest
/interface/bridge/port/add bridge=bridge interface=wifi-guest pvid=20 comment=lab-guest"""),
        ],
        "能连 Guest-WiFi，地址是 `192.168.20.x`，ping 不通 `192.168.88.10`",
        "/interface/wifi/print\n/ip/address/print where comment=lab-guest",
        "访客还能访问家里电脑：检查 PVID / VLAN filtering 有没有打开。",
    ),
))

lessons.append((
    "06-无线(wireless)/03-CAPsMAN/03-CAPsMAN.md",
    lesson(
        "CAPsMAN 管多台 AP",
        "一台当控制器，其它 AP 自动领 SSID。",
        "控制器和管理口在同一二层。CAP 用 `wifi-qcom`。旧 Wireless 的 CAPsMAN 管不了新 WiFi。",
        ("控制器下发配置，墙上 AP 只负责射频。", "CAPsMAN"),
        [
            ("控制器：安全 + 配置 + 下发", "WiFi → Security / Configuration / Provisioning",
             "先做 `sec-home`、`cfg-home`（SSID=`Home-WiFi`，Country=`China`）。Provisioning：Action=`create dynamic enabled`，Master Configuration=`cfg-home`。",
             "images/01-下发.png", "下发规则",
             """/interface/wifi/security/add name=sec-home authentication-types=wpa2-psk,wpa3-psk passphrase="********" wps=disable
/interface/wifi/configuration/add name=cfg-home ssid=Home-WiFi country=China security=sec-home
/interface/wifi/provisioning/add action=create-dynamic-enabled master-configuration=cfg-home
/interface/wifi/capsman/set enabled=yes ca-certificate=auto"""),
            ("CAP：加入控制器", "在 AP 上：WiFi → CAP",
             "Enabled 勾上。Discovery Interfaces 选 CAP 的桥。wifi1/wifi2 的 Configuration Manager=`capsman`。",
             "images/02-CAP.png", "CAP加入",
             """/interface/wifi/cap/set enabled=yes discovery-interfaces=bridge
/interface/wifi/set [find default-name=wifi1] configuration.manager=capsman disabled=no
/interface/wifi/set [find default-name=wifi2] configuration.manager=capsman disabled=no"""),
        ],
        "控制器上出现动态 wifi 接口，手机能搜到 Home-WiFi",
        "/interface/wifi/print\n/interface/wifi/radio/print",
        "CAP 加不进去：两边要二层通，控制器 `capsman` 已 Enabled。",
    ),
))

# ----- 08 QoS -----
lessons.append((
    "08-QoS(qos)/01-SimpleQueue限速/01-SimpleQueue限速.md",
    lesson(
        "Simple Queue 限一台电脑",
        "给指定 IP 封顶上下行。",
        "被限主机示例：`192.168.88.50`，上限 `10M/10M`（下载/上传，单位 bit）。",
        ("这台电脑进出都经过 R1 的一条 Simple Queue。", "Simple Queue"),
        [
            ("打开队列", "Queues → Simple Queues",
             "确认在 Simple Queues，不是 Queue Tree。",
             "images/01-队列.png", "打开SimpleQueues",
             "/queue/simple/print"),
            ("添加限速", "Queues → Simple Queues → +",
             "Name=`lab-pc1`，Target=`192.168.88.50/32`，Max Limit=`10M/10M`，Comment=`lab-pc1`。",
             "images/02-添加.png", "添加限速",
             "/queue/simple/add name=lab-pc1 target=192.168.88.50/32 max-limit=10M/10M comment=lab-pc1"),
        ],
        "那台电脑测速顶在约 10 Mbps，队列计数在涨",
        "/queue/simple/print stats where comment=lab-pc1",
        "限了没效果：Target 必须是这台机当前地址；PPPoE 出口上还要看是不是走别的口出去。",
    ),
))

lessons.append((
    "08-QoS(qos)/02-QueueTree限网段/02-QueueTree限网段.md",
    lesson(
        "Queue Tree 限网段",
        "先打标记，再按标记给整网封顶。",
        "内网上行封顶示例：`20M`。",
        ("mangle 给包打标，Queue Tree 按标限速。", "Queue Tree"),
        [
            ("打数据包标记", "IP → Firewall → Mangle → +",
             "Chain=`forward`，Src. Address=`192.168.88.0/24`，Action=`mark packet`，New Packet Mark=`lan-up`，Passthrough 去掉，Comment=`lab-lan-up`。",
             "images/01-mangle.png", "打标记",
             "/ip/firewall/mangle/add chain=forward src-address=192.168.88.0/24 action=mark-packet new-packet-mark=lan-up passthrough=no comment=lab-lan-up"),
            ("加 Queue Tree", "Queues → Queue Tree → +",
             "Name=`lab-lan-up`，Parent=`global`，Packet Mark=`lan-up`，Max Limit=`20M`。",
             "images/02-tree.png", "QueueTree",
             "/queue/tree/add name=lab-lan-up parent=global packet-mark=lan-up max-limit=20M"),
        ],
        "整网测速顶在约 20 Mbps，tree 计数在涨",
        "/queue/tree/print stats\n/ip/firewall/mangle/print where comment=lab-lan-up",
        "有 FastTrack 时，被 fasttrack 的包可能不进 mangle/queue。要限速的流不要走 FastTrack，或先把 FastTrack 关掉再试。",
    ),
))

# ----- 15 perf -----
lessons.append((
    "15-性能优化(performance)/01-FastTrack/01-FastTrack.md",
    lesson(
        "FastTrack",
        "已经建连的转发少走防火墙，CPU 降下来。",
        "放在 forward 的 drop 之前。后面还要留一条 `accept` established/related，不然有的包会掉。",
        ("新连接走完整防火墙，后续包走 FastTrack。", "FastTrack"),
        [
            ("打开 Filter", "IP → Firewall → Filter Rules",
             "看 forward 链现有规则顺序。",
             "images/01-filter.png", "打开Filter",
             "/ip/firewall/filter/print"),
            ("加上 FastTrack", "IP → Firewall → Filter Rules → +",
             "Chain=`forward`，Connection State 勾 `established` 和 `related`，Action=`fasttrack connection`，Comment=`lab-fasttrack`。拖到 forward 的 drop 前面。下面再留一条同样状态的 `accept`。",
             "images/02-fasttrack.png", "添加FastTrack",
             """/ip/firewall/filter/add chain=forward action=fasttrack-connection connection-state=established,related comment=lab-fasttrack
/ip/firewall/filter/add chain=forward action=accept connection-state=established,related comment=lab-fwd-est"""),
        ],
        "上网时 lab-fasttrack 计数很快涨，CPU 比没开时低",
        "/ip/firewall/filter/print stats where comment=lab-fasttrack",
        "要做 Queue / 精细 mangle 时，被 FastTrack 的流可能绕过去。限速课先关这条再测。",
    ),
))

lessons.append((
    "15-性能优化(performance)/02-查看CPU瓶颈/02-查看CPU瓶颈.md",
    lesson(
        "查看 CPU 瓶颈",
        "看是哪个进程把 CPU 吃满。",
        "",
        ("转发、队列、防火墙都会体现在 CPU。", "CPU 瓶颈"),
        [
            ("看资源", "System → Resources",
             "CPU 长期 >80% 再往下查。",
             "images/01-资源.png", "Resources",
             "/system/resource/print"),
            ("跑 Profile", "Tools → Profile",
             "点 Start，看占比最高的那一行（firewall、queue、networking）。",
             "images/02-profile.png", "Profile",
             "/tool/profile"),
        ],
        "能说出占用最高的名字",
        "/system/resource/cpu/print",
        "单核板子开满队列 + 防火墙，先 FastTrack，再考虑换机。",
    ),
))

# ----- 16 auto -----
lessons.append((
    "16-自动化(automation)/01-定时备份/01-定时备份.md",
    lesson(
        "定时备份",
        "每天生成一份 `.backup`。",
        "文件名 `auto-daily`。备份里有密码，不要传到公开网盘。",
        ("Scheduler 每天跑一次脚本，Files 里出现备份。", "定时备份"),
        [
            ("写脚本", "System → Scripts → +",
             "Name=`lab-daily-backup`，Policy 勾 `sensitive`、`ftp`、`read`、`write`。Source 填备份命令。",
             "images/01-脚本.png", "备份脚本",
             '/system/script/add name=lab-daily-backup policy=ftp,read,write,sensitive source={/system backup save name=auto-daily}'),
            ("加计划任务", "System → Scheduler → +",
             "Name=`lab-daily-backup`，Interval=`1d`，Start Time=`03:00:00`，On Event=`lab-daily-backup`。",
             "images/02-计划.png", "Scheduler",
             "/system/scheduler/add name=lab-daily-backup interval=1d start-time=03:00:00 on-event=lab-daily-backup"),
        ],
        "点一次 Run Script，Files 里有 `auto-daily.backup`",
        "/system/scheduler/print\n/file/print where name~\"auto-daily\"",
        "脚本没跑：检查 Policy，缺 `sensitive` 时 backup 会失败。",
    ),
))

lessons.append((
    "16-自动化(automation)/02-Netwatch探测/02-Netwatch探测.md",
    lesson(
        "Netwatch 探测",
        "盯一个地址，不通就写日志。",
        "探测目标示例：运营商网关或 `1.1.1.1`（换成你自己要盯的地址）。",
        ("R1 定时 ping，Down 时记一条 log。", "Netwatch"),
        [
            ("打开 Netwatch", "Tools → Netwatch",
             "确认窗口是 Netwatch。",
             "images/01-netwatch.png", "打开Netwatch",
             "/tool/netwatch/print"),
            ("添加探测", "Tools → Netwatch → +",
             "Name=`lab-gw`，Host 填要盯的地址，Type=`simple`，Interval=`10s`。Down Script：`/log warning \"lab-gw down\"`。Up Script：`/log info \"lab-gw up\"`。",
             "images/02-添加.png", "添加探测",
             """/tool/netwatch/add name=lab-gw host=1.1.1.1 type=simple interval=10s timeout=3s down-script="/log warning \\"lab-gw down\\"" up-script="/log info \\"lab-gw up\\""""),
        ],
        "Status 为 up；拔掉 WAN 后变 down，Log 有 warning",
        "/tool/netwatch/print\n/log/print where message~\"lab-gw\"",
        "v7 旧界面没有 Type 时，默认就是 ping。",
    ),
))

# ----- 18 routing -----
lessons.append((
    "18-动态路由(dynamic-routing)/01-OSPF互通/01-OSPF互通.md",
    lesson(
        "OSPF 互通",
        "两台 RouterOS 用 OSPF 互学网段。",
        """- 互联：R1 `10.0.12.1/30`、R2 `10.0.12.2/30`，口 `ether2`
- R1 LAN：`192.168.88.0/24`；R2 LAN：`192.168.89.0/24`
- Router ID：R1 `10.10.10.1`，R2 `10.10.10.2`""",
        ("两边在 Area 0 建邻接，把对方 LAN 学进路由表。", "OSPF"),
        [
            ("建 Instance 和 Area", "Routing → OSPF",
             "Instance：Name=`ospf-lab`，Version=`2`，Router ID=`10.10.10.1`。Area：Name=`backbone`，Area ID=`0.0.0.0`，Instance=`ospf-lab`。R2 把 Router ID 改成 `10.10.10.2`。",
             "images/01-instance.png", "Instance和Area",
             """/routing/ospf/instance/add name=ospf-lab version=2 router-id=10.10.10.1
/routing/ospf/area/add name=backbone area-id=0.0.0.0 instance=ospf-lab"""),
            ("套接口模板", "Routing → OSPF → Interface Templates → +",
             "Area=`backbone`，Interfaces 填 `ether2` 和 `bridge`（有 LAN 的那口）。Type 默认 broadcast。R2 同样做。",
             "images/02-模板.png", "接口模板",
             "/routing/ospf/interface-template/add area=backbone interfaces=ether2,bridge"),
        ],
        "Neighbors 状态 Full；Routes 里出现对方 `192.168.89.0/24`（或 `192.168.88.0/24`）",
        """/routing/ospf/neighbor/print
/ip/route/print where ospf""",
        "邻接起不来：两端 Area ID、网段掩码要一致，ether2 要能 ping 通。v7 没有 `/routing ospf network`，用 interface-template。",
    ),
))

lessons.append((
    "18-动态路由(dynamic-routing)/02-BGP互通/02-BGP互通.md",
    lesson(
        "BGP 互通",
        "两台之间建一条 eBGP，把各自 LAN 宣告过去。",
        """- 互联：R1 `10.0.12.1/30` AS `65001`；R2 `10.0.12.2/30` AS `65002`
- 宣告：R1 `192.168.88.0/24`，R2 `192.168.89.0/24`""",
        ("eBGP 建好后，对方网段出现在 IP 路由里。", "BGP"),
        [
            ("准备要宣告的网段", "IP → Firewall → Address Lists → +；IP → Routes → +",
             "List=`bgp-networks`，Address=`192.168.88.0/24`。再加一条同网段 blackhole，好让 BGP 认为网段在。R2 改成 `192.168.89.0/24`。",
             "images/01-网段.png", "宣告网段",
             """/ip/firewall/address-list/add list=bgp-networks address=192.168.88.0/24
/ip/route/add dst-address=192.168.88.0/24 blackhole comment=lab-bgp-net"""),
            ("加 BGP 连接", "Routing → BGP → Connections → +",
             "Name=`to-r2`，Remote Address=`10.0.12.2`，Remote AS=`65002`，Local Role=`ebgp`，AS=`65001`，Output Network=`bgp-networks`。R2 对调地址和 AS。",
             "images/02-连接.png", "BGP连接",
             """/routing/bgp/connection/add name=to-r2 remote.address=10.0.12.2 remote.as=65002 local.role=ebgp as=65001 output.network=bgp-networks"""),
        ],
        "BGP Sessions 为 established；路由表有对方 LAN",
        """/routing/bgp/session/print
/ip/route/print where bgp""",
        "建不上：TCP 179 要通，Role 必须填。v7 没有 `/routing bgp peer`。",
    ),
))

# ----- 19 MPLS -----
lessons.append((
    "19-MPLS(mpls)/01-LDP互通/01-LDP互通.md",
    lesson(
        "LDP 互通",
        "先有 IGP，再在互联口开 LDP，看到邻居和标签。",
        """- 先按 [OSPF 互通](../../18-动态路由(dynamic-routing)/01-OSPF互通/01-OSPF互通.md) 把邻接跑 Full
- 环回：R1 `10.10.10.1/32`，R2 `10.10.10.2/32`，口 `lo` 或 `bridge`
- LDP 只开在路由器互连口 `ether2`，不要开在用户口""",
        ("OSPF 把路算出来，LDP 给这条路贴标签。", "LDP"),
        [
            ("加环回", "IP → Addresses → +",
             "Address=`10.10.10.1/32`，Interface 用 loopback（没有就用 `bridge`）。R2 用 `.2`。",
             "images/01-环回.png", "环回地址",
             "/ip/address/add address=10.10.10.1/32 interface=bridge comment=lab-lsr"),
            ("开 LDP", "MPLS → LDP → +；再 LDP Interface → +",
             "AFI=`ip`，LSR ID=`10.10.10.1`，Transport Addresses=`10.10.10.1`。Interface 选 `ether2`。R2 改成 `.2`。",
             "images/02-ldp.png", "LDP",
             """/mpls/ldp/add afi=ip lsr-id=10.10.10.1 transport-addresses=10.10.10.1
/mpls/ldp/interface/add interface=ether2"""),
        ],
        "LDP Neighbors 有对端；Forwarding 里能看到标签",
        """/mpls/ldp/neighbor/print
/mpls/forwarding-table/print""",
        "没有邻居：先 ping 通 LSR ID，OSPF 要把 `10.10.10.2/32` 学过来。",
    ),
))

# ----- 20 advanced -----
lessons.append((
    "20-高级(advanced)/01-RoMON/01-RoMON.md",
    lesson(
        "RoMON",
        "二层找不到 IP 时，仍能用 WinBox 点到邻台。",
        "RoMON 走独立 MAC 封装，不靠你现有的 IP/VLAN 转发。",
        ("管理机 ↔ R1 ↔ R2，靠 RoMON 发现邻台。", "RoMON"),
        [
            ("打开 RoMON", "Tools → RoMON",
             "Enabled 勾上。",
             "images/01-romon.png", "打开RoMON",
             "/tool/romon/set enabled=yes"),
            ("口是否参加", "Tools → RoMON → Ports",
             "默认 `all` 允许。不想让 WAN 口参加：加一条 ether1，Forbid。",
             "images/02-端口.png", "RoMON端口",
             "/tool/romon/port/print"),
        ],
        "WinBox Neighbors 能看到带 RoMON 的邻台，能点进去",
        "/tool/romon/set enabled=yes\n/tool/romon/port/print",
        "交换机芯片口不通时，把口加进 CPU 能看到的桥，或换有线口试。",
    ),
))

lessons.append((
    "20-高级(advanced)/02-VRF隔离/02-VRF隔离.md",
    lesson(
        "VRF 隔离",
        "把一组口放进独立路由表，和家里网错开。",
        "office 口示例：`ether3`，地址 `192.168.77.1/24`。VRF 名字 `office`。",
        ("ether3 的路由只在 office 表里，不和 `192.168.88.0/24` 混。", "VRF"),
        [
            ("建 VRF", "IP → VRF → +",
             "Name=`office`，Interfaces 勾 `ether3`。这条要排在系统 `main` 上面。",
             "images/01-vrf.png", "建VRF",
             "/ip/vrf/add name=office interfaces=ether3"),
            ("给 office 配地址", "IP → Addresses → +",
             "Address=`192.168.77.1/24`，Interface=`ether3`。",
             "images/02-地址.png", "VRF地址",
             "/ip/address/add address=192.168.77.1/24 interface=ether3 comment=lab-vrf"),
        ],
        "Routes 能切到 `office` 表，看到 `192.168.77.0/24`；main 表里没有这条直连",
        """/ip/vrf/print
/ip/route/print where routing-table=office""",
        "口加不进 VRF：把 `office` 挪到 `main` 上面。防火墙从 7.14 起匹配 VRF 虚接口名，不是里面那张网卡。",
    ),
))

indexes = {
    "06-无线(wireless)/00-目录.md": """# 06-无线(wireless)

- [家里 Wi-Fi](01-家里WiFi/01-家里WiFi.md)
- [访客 Wi-Fi](02-访客WiFi/02-访客WiFi.md)
- [CAPsMAN 管多台 AP](03-CAPsMAN/03-CAPsMAN.md)

课文目录：[实战课表.md](../实战课表.md)
""",
    "08-QoS(qos)/00-目录.md": """# 08-QoS(qos)

- [Simple Queue 限一台电脑](01-SimpleQueue限速/01-SimpleQueue限速.md)
- [Queue Tree 限网段](02-QueueTree限网段/02-QueueTree限网段.md)

课文目录：[实战课表.md](../实战课表.md)
""",
    "15-性能优化(performance)/00-目录.md": """# 15-性能优化(performance)

- [FastTrack](01-FastTrack/01-FastTrack.md)
- [查看 CPU 瓶颈](02-查看CPU瓶颈/02-查看CPU瓶颈.md)

课文目录：[实战课表.md](../实战课表.md)
""",
    "16-自动化(automation)/00-目录.md": """# 16-自动化(automation)

- [定时备份](01-定时备份/01-定时备份.md)
- [Netwatch 探测](02-Netwatch探测/02-Netwatch探测.md)

课文目录：[实战课表.md](../实战课表.md)
""",
    "18-动态路由(dynamic-routing)/00-目录.md": """# 18-动态路由(dynamic-routing)

- [OSPF 互通](01-OSPF互通/01-OSPF互通.md)
- [BGP 互通](02-BGP互通/02-BGP互通.md)

课文目录：[实战课表.md](../实战课表.md)
""",
    "19-MPLS(mpls)/00-目录.md": """# 19-MPLS(mpls)

- [LDP 互通](01-LDP互通/01-LDP互通.md)

课文目录：[实战课表.md](../实战课表.md)
""",
    "20-高级(advanced)/00-目录.md": """# 20-高级(advanced)

- [RoMON](01-RoMON/01-RoMON.md)
- [VRF 隔离](02-VRF隔离/02-VRF隔离.md)

课文目录：[实战课表.md](../实战课表.md)
""",
}

for rel, text in lessons:
    p = ROOT / rel
    p.parent.mkdir(parents=True, exist_ok=True)
    (p.parent / "images").mkdir(exist_ok=True)
    p.write_text(text, encoding="utf-8")
    print("wrote", rel)

for rel, text in indexes.items():
    p = ROOT / rel
    p.write_text(text, encoding="utf-8")
    print("index", rel)
