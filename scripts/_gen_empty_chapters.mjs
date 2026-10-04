import fs from "fs";
import path from "path";

const ROOT = "g:/gitea/RouterOS入门与精通/docs";
const NET = `- 示例 LAN：\`192.168.88.0/24\`，网关 \`192.168.88.1\`，接口 \`bridge\`（改成你的口）
- WAN 示例：\`pppoe-out1\` 或 \`ether1\`
- 密码示例：\`********\`（填你自己的管理员密码）
- 身份示例：\`R1\``;

function lesson({ title, purpose, extraNet, body, cap, steps, checkWin, checkCli, faq }) {
  let n = 2;
  let s = `# ${title}

> 适用版本：RouterOS 7.x

## 目的

${purpose}

## 网络

${NET}
`;
  if (extraNet) s += `\n${extraNet}\n`;
  s += `
## 先看懂

${body}

![图(1) ${cap}](images/00-原理.png)

<p align="center">图(1) ${cap}</p>
`;
  for (const [t, win, action, img, c, cli] of steps) {
    s += `
## 第${n - 1}步：${t}

WinBox：\`${win}\`

动作：${action}

![图(${n}) ${c}](${img})

<p align="center">图(${n}) ${c}</p>

\`\`\`routeros
${cli.trim()}
\`\`\`
`;
    n += 1;
  }
  s += `
## 检查

WinBox：${checkWin}

\`\`\`routeros
${checkCli.trim()}
\`\`\`
`;
  if (faq) s += `\n## 常见问题\n\n${faq}\n`;
  return s;
}

const files = {};

files["06-无线(wireless)/01-家里WiFi/01-家里WiFi.md"] = lesson({
  title: "家里 Wi-Fi",
  purpose: "在带无线网卡的板子上开家里 SSID，手机连上走 LAN。",
  extraNet: "没有无线网卡的 x86 虚拟机没有 radio，换 hAP / Audience 这类板子做。菜单是 `WiFi`（wifi-qcom），不是旧的 `Wireless`。",
  body: "手机连 R1 的 SSID，流量进 bridge，再走家里上网。",
  cap: "家里 Wi-Fi",
  steps: [
    ["加安全配置", "WiFi → Security → +", "Name=`sec-home`，Authentication Types 勾 `WPA2 PSK` 和 `WPA3 PSK`，Passphrase 填你自己的 Wi-Fi 密码（教程里写成 `********`），WPS=`disabled`。", "images/01-安全.png", "安全配置", '/interface/wifi/security/add name=sec-home authentication-types=wpa2-psk,wpa3-psk passphrase="********" wps=disable'],
    ["加配置档案", "WiFi → Configuration → +", "Name=`cfg-home`，SSID=`Home-WiFi`，Country=`China`，Security=`sec-home`。", "images/02-配置.png", "配置档案", "/interface/wifi/configuration/add name=cfg-home ssid=Home-WiFi country=China security=sec-home"],
    ["套到 wifi1 并进桥", "WiFi → WiFi → 双击 wifi1；再 Bridge → Ports → +", "Configuration=`cfg-home`，Disabled 去掉。把 `wifi1` 加进 `bridge`。", "images/03-接口.png", "wifi1进桥", "/interface/wifi/set wifi1 configuration=cfg-home disabled=no\n/interface/bridge/port/add bridge=bridge interface=wifi1 comment=lab-wifi"],
  ],
  checkWin: "wifi1 Running，手机能拿到 `192.168.88.0/24` 地址",
  checkCli: "/interface/wifi/print\n/interface/bridge/port/print where interface=wifi1",
  faq: "SSID 出来但没地址：确认 wifi1 已经在 bridge 上，DHCP 绑的是 bridge。",
});

files["06-无线(wireless)/02-访客WiFi/02-访客WiFi.md"] = lesson({
  title: "访客 Wi-Fi",
  purpose: "再开一个访客 SSID，和家里网段分开。",
  extraNet: "访客网段示例：`192.168.20.0/24`。本课用虚拟 AP + VLAN 20。",
  body: "家里 SSID 走家里网段，访客 SSID 走 VLAN20，互不二层互通。",
  cap: "访客 Wi-Fi",
  steps: [
    ["访客安全和配置", "WiFi → Security / Configuration → +", "Security Name=`sec-guest`，口令另设。Configuration Name=`cfg-guest`，SSID=`Guest-WiFi`，Country=`China`。Datapath 打开 client isolation。", "images/01-访客配置.png", "访客配置", '/interface/wifi/security/add name=sec-guest authentication-types=wpa2-psk,wpa3-psk passphrase="********" wps=disable\n/interface/wifi/datapath/add name=dp-guest client-isolation=yes\n/interface/wifi/configuration/add name=cfg-guest ssid=Guest-WiFi country=China security=sec-guest datapath=dp-guest'],
    ["加虚拟 AP", "WiFi → WiFi → +", "Name=`wifi-guest`，Master Interface=`wifi1`，Configuration=`cfg-guest`，Disabled 去掉。", "images/02-虚拟AP.png", "虚拟AP", "/interface/wifi/add name=wifi-guest master-interface=wifi1 configuration=cfg-guest disabled=no"],
    ["访客进 VLAN", "Bridge → Ports / VLANs；IP → Addresses", "wifi-guest 的 PVID=`20`。再给 `vlan20` 配 `192.168.20.1/24` 和单独 DHCP。", "images/03-vlan.png", "访客VLAN", "/interface/vlan/add name=vlan20 vlan-id=20 interface=bridge\n/ip/address/add address=192.168.20.1/24 interface=vlan20 comment=lab-guest\n/interface/bridge/port/add bridge=bridge interface=wifi-guest pvid=20 comment=lab-guest"],
  ],
  checkWin: "能连 Guest-WiFi，地址是 `192.168.20.x`，ping 不通 `192.168.88.10`",
  checkCli: "/interface/wifi/print\n/ip/address/print where comment=lab-guest",
  faq: "访客还能访问家里电脑：检查 PVID / VLAN filtering 有没有打开。",
});

files["06-无线(wireless)/03-CAPsMAN/03-CAPsMAN.md"] = lesson({
  title: "CAPsMAN 管多台 AP",
  purpose: "一台当控制器，其它 AP 自动领 SSID。",
  extraNet: "控制器和管理口在同一二层。CAP 用 `wifi-qcom`。旧 Wireless 的 CAPsMAN 管不了新 WiFi。",
  body: "控制器下发配置，墙上 AP 只负责射频。",
  cap: "CAPsMAN",
  steps: [
    ["控制器：安全 + 配置 + 下发", "WiFi → Security / Configuration / Provisioning", "先做 `sec-home`、`cfg-home`（SSID=`Home-WiFi`，Country=`China`）。Provisioning：Action=`create dynamic enabled`，Master Configuration=`cfg-home`。然后打开 CAPsMAN。", "images/01-下发.png", "下发规则", '/interface/wifi/security/add name=sec-home authentication-types=wpa2-psk,wpa3-psk passphrase="********" wps=disable\n/interface/wifi/configuration/add name=cfg-home ssid=Home-WiFi country=China security=sec-home\n/interface/wifi/provisioning/add action=create-dynamic-enabled master-configuration=cfg-home\n/interface/wifi/capsman/set enabled=yes ca-certificate=auto'],
    ["CAP：加入控制器", "在 AP 上：WiFi → CAP", "Enabled 勾上。Discovery Interfaces 选 CAP 的桥。wifi1/wifi2 的 Configuration Manager=`capsman`。", "images/02-CAP.png", "CAP加入", "/interface/wifi/cap/set enabled=yes discovery-interfaces=bridge\n/interface/wifi/set [find default-name=wifi1] configuration.manager=capsman disabled=no\n/interface/wifi/set [find default-name=wifi2] configuration.manager=capsman disabled=no"],
  ],
  checkWin: "控制器上出现动态 wifi 接口，手机能搜到 Home-WiFi",
  checkCli: "/interface/wifi/print\n/interface/wifi/radio/print",
  faq: "CAP 加不进去：两边要二层通，控制器 CAPsMAN 已 Enabled。",
});

files["08-QoS(qos)/01-SimpleQueue限速/01-SimpleQueue限速.md"] = lesson({
  title: "Simple Queue 限一台电脑",
  purpose: "给指定 IP 封顶上下行。",
  extraNet: "被限主机示例：`192.168.88.50`，上限 `10M/10M`（下载/上传，单位 bit）。",
  body: "这台电脑进出都经过 R1 的一条 Simple Queue。",
  cap: "Simple Queue",
  steps: [
    ["打开队列", "Queues → Simple Queues", "确认在 Simple Queues，不是 Queue Tree。", "images/01-队列.png", "打开SimpleQueues", "/queue/simple/print"],
    ["添加限速", "Queues → Simple Queues → +", "Name=`lab-pc1`，Target=`192.168.88.50/32`，Max Limit=`10M/10M`，Comment=`lab-pc1`。", "images/02-添加.png", "添加限速", "/queue/simple/add name=lab-pc1 target=192.168.88.50/32 max-limit=10M/10M comment=lab-pc1"],
  ],
  checkWin: "那台电脑测速顶在约 10 Mbps，队列计数在涨",
  checkCli: "/queue/simple/print stats where comment=lab-pc1",
  faq: "限了没效果：Target 必须是这台机当前地址。",
});

files["08-QoS(qos)/02-QueueTree限网段/02-QueueTree限网段.md"] = lesson({
  title: "Queue Tree 限网段",
  purpose: "先打标记，再按标记给整网封顶。",
  extraNet: "内网上行封顶示例：`20M`。",
  body: "mangle 给包打标，Queue Tree 按标限速。",
  cap: "Queue Tree",
  steps: [
    ["打数据包标记", "IP → Firewall → Mangle → +", "Chain=`forward`，Src. Address=`192.168.88.0/24`，Action=`mark packet`，New Packet Mark=`lan-up`，Passthrough 去掉，Comment=`lab-lan-up`。", "images/01-mangle.png", "打标记", "/ip/firewall/mangle/add chain=forward src-address=192.168.88.0/24 action=mark-packet new-packet-mark=lan-up passthrough=no comment=lab-lan-up"],
    ["加 Queue Tree", "Queues → Queue Tree → +", "Name=`lab-lan-up`，Parent=`global`，Packet Mark=`lan-up`，Max Limit=`20M`。", "images/02-tree.png", "QueueTree", "/queue/tree/add name=lab-lan-up parent=global packet-mark=lan-up max-limit=20M"],
  ],
  checkWin: "整网测速顶在约 20 Mbps，tree 计数在涨",
  checkCli: "/queue/tree/print stats\n/ip/firewall/mangle/print where comment=lab-lan-up",
  faq: "有 FastTrack 时，被 fasttrack 的包可能不进 mangle/queue。要限速的流先关掉 FastTrack 再试。",
});

files["15-性能优化(performance)/01-FastTrack/01-FastTrack.md"] = lesson({
  title: "FastTrack",
  purpose: "已经建连的转发少走防火墙，CPU 降下来。",
  extraNet: "放在 forward 的 drop 之前。后面还要留一条 `accept` established/related。",
  body: "新连接走完整防火墙，后续包走 FastTrack。",
  cap: "FastTrack",
  steps: [
    ["打开 Filter", "IP → Firewall → Filter Rules", "看 forward 链现有规则顺序。", "images/01-filter.png", "打开Filter", "/ip/firewall/filter/print"],
    ["加上 FastTrack", "IP → Firewall → Filter Rules → +", "Chain=`forward`，Connection State 勾 `established` 和 `related`，Action=`fasttrack connection`，Comment=`lab-fasttrack`。拖到 forward 的 drop 前面。下面再留一条同样状态的 `accept`。", "images/02-fasttrack.png", "添加FastTrack", "/ip/firewall/filter/add chain=forward action=fasttrack-connection connection-state=established,related comment=lab-fasttrack\n/ip/firewall/filter/add chain=forward action=accept connection-state=established,related comment=lab-fwd-est"],
  ],
  checkWin: "上网时 lab-fasttrack 计数很快涨，CPU 比没开时低",
  checkCli: "/ip/firewall/filter/print stats where comment=lab-fasttrack",
  faq: "要做 Queue / 精细 mangle 时，被 FastTrack 的流可能绕过去。",
});

files["15-性能优化(performance)/02-查看CPU瓶颈/02-查看CPU瓶颈.md"] = lesson({
  title: "查看 CPU 瓶颈",
  purpose: "看是哪个进程把 CPU 吃满。",
  extraNet: "",
  body: "转发、队列、防火墙都会体现在 CPU。",
  cap: "CPU 瓶颈",
  steps: [
    ["看资源", "System → Resources", "CPU 长期很高再往下查。", "images/01-资源.png", "Resources", "/system/resource/print"],
    ["跑 Profile", "Tools → Profile", "点 Start，看占比最高的那一行（firewall、queue、networking）。", "images/02-profile.png", "Profile", "/tool/profile"],
  ],
  checkWin: "能说出占用最高的名字",
  checkCli: "/system/resource/cpu/print",
  faq: "",
});

files["16-自动化(automation)/01-定时备份/01-定时备份.md"] = lesson({
  title: "定时备份",
  purpose: "每天生成一份 `.backup`。",
  extraNet: "文件名 `auto-daily`。备份里有密码，不要传到公开网盘。",
  body: "Scheduler 每天跑一次脚本，Files 里出现备份。",
  cap: "定时备份",
  steps: [
    ["写脚本", "System → Scripts → +", "Name=`lab-daily-backup`，Policy 勾 `sensitive`、`ftp`、`read`、`write`。Source 填备份命令。", "images/01-脚本.png", "备份脚本", "/system/script/add name=lab-daily-backup policy=ftp,read,write,sensitive source={/system backup save name=auto-daily}"],
    ["加计划任务", "System → Scheduler → +", "Name=`lab-daily-backup`，Interval=`1d`，Start Time=`03:00:00`，On Event=`lab-daily-backup`。", "images/02-计划.png", "Scheduler", "/system/scheduler/add name=lab-daily-backup interval=1d start-time=03:00:00 on-event=lab-daily-backup"],
  ],
  checkWin: "点一次 Run Script，Files 里有 `auto-daily.backup`",
  checkCli: '/system/scheduler/print\n/file/print where name~"auto-daily"',
  faq: "脚本没跑：检查 Policy，缺 `sensitive` 时 backup 会失败。",
});

files["16-自动化(automation)/02-Netwatch探测/02-Netwatch探测.md"] = lesson({
  title: "Netwatch 探测",
  purpose: "盯一个地址，不通就写日志。",
  extraNet: "探测目标换成你自己要盯的地址。",
  body: "R1 定时探测，Down 时记一条 log。",
  cap: "Netwatch",
  steps: [
    ["打开 Netwatch", "Tools → Netwatch", "确认窗口是 Netwatch。", "images/01-netwatch.png", "打开Netwatch", "/tool/netwatch/print"],
    ["添加探测", "Tools → Netwatch → +", "Name=`lab-gw`，Host 填要盯的地址，Type=`simple`，Interval=`10s`。Down Script 写 `/log warning lab-gw-down`。Up Script 写 `/log info lab-gw-up`。", "images/02-添加.png", "添加探测", '/tool/netwatch/add name=lab-gw host=1.1.1.1 type=simple interval=10s timeout=3s down-script="/log warning lab-gw-down" up-script="/log info lab-gw-up"'],
  ],
  checkWin: "Status 为 up；拔掉 WAN 后变 down，Log 有 warning",
  checkCli: '/tool/netwatch/print\n/log/print where message~"lab-gw"',
  faq: "v7 旧界面没有 Type 时，默认就是 ping。",
});

files["18-动态路由(dynamic-routing)/01-OSPF互通/01-OSPF互通.md"] = lesson({
  title: "OSPF 互通",
  purpose: "两台 RouterOS 用 OSPF 互学网段。",
  extraNet: `- 互联：R1 \`10.0.12.1/30\`、R2 \`10.0.12.2/30\`，口 \`ether2\`
- R1 LAN：\`192.168.88.0/24\`；R2 LAN：\`192.168.89.0/24\`
- Router ID：R1 \`10.10.10.1\`，R2 \`10.10.10.2\``,
  body: "两边在 Area 0 建邻接，把对方 LAN 学进路由表。",
  cap: "OSPF",
  steps: [
    ["建 Instance 和 Area", "Routing → OSPF", "Instance：Name=`ospf-lab`，Version=`2`，Router ID=`10.10.10.1`。Area：Name=`backbone`，Area ID=`0.0.0.0`，Instance=`ospf-lab`。R2 把 Router ID 改成 `10.10.10.2`。", "images/01-instance.png", "Instance和Area", "/routing/ospf/instance/add name=ospf-lab version=2 router-id=10.10.10.1\n/routing/ospf/area/add name=backbone area-id=0.0.0.0 instance=ospf-lab"],
    ["套接口模板", "Routing → OSPF → Interface Templates → +", "Area=`backbone`，Interfaces 填 `ether2` 和 `bridge`（有 LAN 的那口）。R2 同样做。", "images/02-模板.png", "接口模板", "/routing/ospf/interface-template/add area=backbone interfaces=ether2,bridge"],
  ],
  checkWin: "Neighbors 状态 Full；Routes 里出现对方 LAN",
  checkCli: "/routing/ospf/neighbor/print\n/ip/route/print where ospf",
  faq: "邻接起不来：两端 Area ID、网段掩码要一致，ether2 要能 ping 通。v7 没有 `/routing ospf network`，用 interface-template。",
});

files["18-动态路由(dynamic-routing)/02-BGP互通/02-BGP互通.md"] = lesson({
  title: "BGP 互通",
  purpose: "两台之间建一条 eBGP，把各自 LAN 宣告过去。",
  extraNet: `- 互联：R1 \`10.0.12.1/30\` AS \`65001\`；R2 \`10.0.12.2/30\` AS \`65002\`
- 宣告：R1 \`192.168.88.0/24\`，R2 \`192.168.89.0/24\``,
  body: "eBGP 建好后，对方网段出现在 IP 路由里。",
  cap: "BGP",
  steps: [
    ["准备要宣告的网段", "IP → Firewall → Address Lists → +；IP → Routes → +", "List=`bgp-networks`，Address=`192.168.88.0/24`。再加一条同网段 blackhole。R2 改成 `192.168.89.0/24`。", "images/01-网段.png", "宣告网段", "/ip/firewall/address-list/add list=bgp-networks address=192.168.88.0/24\n/ip/route/add dst-address=192.168.88.0/24 blackhole comment=lab-bgp-net"],
    ["加 BGP 连接", "Routing → BGP → Connections → +", "Name=`to-r2`，Remote Address=`10.0.12.2`，Remote AS=`65002`，Local Role=`ebgp`，AS=`65001`，Output Network=`bgp-networks`。R2 对调地址和 AS。", "images/02-连接.png", "BGP连接", "/routing/bgp/connection/add name=to-r2 remote.address=10.0.12.2 remote.as=65002 local.role=ebgp as=65001 output.network=bgp-networks"],
  ],
  checkWin: "BGP Sessions 为 established；路由表有对方 LAN",
  checkCli: "/routing/bgp/session/print\n/ip/route/print where bgp",
  faq: "建不上：TCP 179 要通，Role 必须填。v7 没有 `/routing bgp peer`。",
});

files["19-MPLS(mpls)/01-LDP互通/01-LDP互通.md"] = lesson({
  title: "LDP 互通",
  purpose: "先有 IGP，再在互联口开 LDP，看到邻居和标签。",
  extraNet: `- 先按 [OSPF 互通](../../18-动态路由(dynamic-routing)/01-OSPF互通/01-OSPF互通.md) 把邻接跑 Full
- 环回：R1 \`10.10.10.1/32\`，R2 \`10.10.10.2/32\`
- LDP 只开在互连口 \`ether2\`，不要开在用户口`,
  body: "OSPF 把路算出来，LDP 给这条路贴标签。",
  cap: "LDP",
  steps: [
    ["加环回", "IP → Addresses → +", "Address=`10.10.10.1/32`，Interface 用 loopback（没有就用 `bridge`）。R2 用 `.2`。", "images/01-环回.png", "环回地址", "/ip/address/add address=10.10.10.1/32 interface=bridge comment=lab-lsr"],
    ["开 LDP", "MPLS → LDP → +；再 LDP Interface → +", "AFI=`ip`，LSR ID=`10.10.10.1`，Transport Addresses=`10.10.10.1`。Interface 选 `ether2`。R2 改成 `.2`。", "images/02-ldp.png", "LDP", "/mpls/ldp/add afi=ip lsr-id=10.10.10.1 transport-addresses=10.10.10.1\n/mpls/ldp/interface/add interface=ether2"],
  ],
  checkWin: "LDP Neighbors 有对端；Forwarding 里能看到标签",
  checkCli: "/mpls/ldp/neighbor/print\n/mpls/forwarding-table/print",
  faq: "没有邻居：先 ping 通 LSR ID，OSPF 要把 `10.10.10.2/32` 学过来。",
});

files["20-高级(advanced)/01-RoMON/01-RoMON.md"] = lesson({
  title: "RoMON",
  purpose: "二层找不到 IP 时，仍能用 WinBox 点到邻台。",
  extraNet: "RoMON 走独立 MAC 封装，不靠你现有的 IP/VLAN 转发。",
  body: "管理机经过 R1 还能点到 R2。",
  cap: "RoMON",
  steps: [
    ["打开 RoMON", "Tools → RoMON", "Enabled 勾上。", "images/01-romon.png", "打开RoMON", "/tool/romon/set enabled=yes"],
    ["口是否参加", "Tools → RoMON → Ports", "默认 `all` 允许。不想让 WAN 口参加：加一条 ether1，Forbid。", "images/02-端口.png", "RoMON端口", "/tool/romon/port/print"],
  ],
  checkWin: "WinBox Neighbors 能看到带 RoMON 的邻台，能点进去",
  checkCli: "/tool/romon/set enabled=yes\n/tool/romon/port/print",
  faq: "交换机芯片口不通时，换有线口试。",
});

files["20-高级(advanced)/02-VRF隔离/02-VRF隔离.md"] = lesson({
  title: "VRF 隔离",
  purpose: "把一组口放进独立路由表，和家里网错开。",
  extraNet: "office 口示例：`ether3`，地址 `192.168.77.1/24`。VRF 名字 `office`。",
  body: "ether3 的路由只在 office 表里，不和 `192.168.88.0/24` 混。",
  cap: "VRF",
  steps: [
    ["建 VRF", "IP → VRF → +", "Name=`office`，Interfaces 勾 `ether3`。这条要排在系统 `main` 上面。", "images/01-vrf.png", "建VRF", "/ip/vrf/add name=office interfaces=ether3"],
    ["给 office 配地址", "IP → Addresses → +", "Address=`192.168.77.1/24`，Interface=`ether3`。", "images/02-地址.png", "VRF地址", "/ip/address/add address=192.168.77.1/24 interface=ether3 comment=lab-vrf"],
  ],
  checkWin: "Routes 能切到 `office` 表，看到 `192.168.77.0/24`",
  checkCli: "/ip/vrf/print\n/ip/route/print where routing-table=office",
  faq: "口加不进 VRF：把 `office` 挪到 `main` 上面。防火墙从 7.14 起匹配 VRF 虚接口名。",
});

const indexes = {
  "06-无线(wireless)/00-目录.md": `# 06-无线(wireless)

- [家里 Wi-Fi](01-家里WiFi/01-家里WiFi.md)
- [访客 Wi-Fi](02-访客WiFi/02-访客WiFi.md)
- [CAPsMAN 管多台 AP](03-CAPsMAN/03-CAPsMAN.md)

课文目录：[实战课表.md](../实战课表.md)
`,
  "08-QoS(qos)/00-目录.md": `# 08-QoS(qos)

- [Simple Queue 限一台电脑](01-SimpleQueue限速/01-SimpleQueue限速.md)
- [Queue Tree 限网段](02-QueueTree限网段/02-QueueTree限网段.md)

课文目录：[实战课表.md](../实战课表.md)
`,
  "15-性能优化(performance)/00-目录.md": `# 15-性能优化(performance)

- [FastTrack](01-FastTrack/01-FastTrack.md)
- [查看 CPU 瓶颈](02-查看CPU瓶颈/02-查看CPU瓶颈.md)

课文目录：[实战课表.md](../实战课表.md)
`,
  "16-自动化(automation)/00-目录.md": `# 16-自动化(automation)

- [定时备份](01-定时备份/01-定时备份.md)
- [Netwatch 探测](02-Netwatch探测/02-Netwatch探测.md)

课文目录：[实战课表.md](../实战课表.md)
`,
  "18-动态路由(dynamic-routing)/00-目录.md": `# 18-动态路由(dynamic-routing)

- [OSPF 互通](01-OSPF互通/01-OSPF互通.md)
- [BGP 互通](02-BGP互通/02-BGP互通.md)

课文目录：[实战课表.md](../实战课表.md)
`,
  "19-MPLS(mpls)/00-目录.md": `# 19-MPLS(mpls)

- [LDP 互通](01-LDP互通/01-LDP互通.md)

课文目录：[实战课表.md](../实战课表.md)
`,
  "20-高级(advanced)/00-目录.md": `# 20-高级(advanced)

- [RoMON](01-RoMON/01-RoMON.md)
- [VRF 隔离](02-VRF隔离/02-VRF隔离.md)

课文目录：[实战课表.md](../实战课表.md)
`,
};

for (const [rel, text] of Object.entries({ ...files, ...indexes })) {
  const p = path.join(ROOT, rel);
  fs.mkdirSync(path.dirname(p), { recursive: true });
  if (!rel.endsWith("00-目录.md")) {
    fs.mkdirSync(path.join(path.dirname(p), "images"), { recursive: true });
  }
  fs.writeFileSync(p, text, "utf8");
  console.log("wrote", rel);
}
