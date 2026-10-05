# -*- coding: utf-8 -*-
"""Render course packet-flow PNGs (packet-flow-diagram v1 style)."""
from __future__ import annotations

import base64
import urllib.request
from pathlib import Path

ROOT = Path(r"G:\gitea\RouterOS 入门实战\docs")
WIDTH = 4800

STYLES = """
    style Internet fill:#e0f7fa,stroke:#00acc1
    style Router fill:#ffebee,stroke:#e53935
    style LAN fill:#e8f5e9,stroke:#43a047
    style VPN fill:#ede7f6,stroke:#7e57c2
    style NAT fill:#fff9c4,stroke:#f9a825
"""

def masquerade():
    return """flowchart LR
    subgraph LAN["🟢 内网 192.168.88.0/24"]
        PC["电脑<br/>192.168.88.10"]
    end
    subgraph Router["🔴 R1 MikroTik"]
        direction TB
        IN["bridge 收包"]
        NAT["srcnat 链<br/>Masquerade"]
        OUT["ether1 出口"]
        IN --> NAT --> OUT
    end
    subgraph Internet["🌐 互联网"]
        Net["外网<br/>8.8.8.8"]
    end
    PC -->|"① 原始包<br/>src=192.168.88.10"| IN
    NAT -->|"② 改写源<br/>src=203.0.113.10"| OUT
    OUT -->|"③ 转发出去"| Net
    Net -->|"④ 回复到 WAN IP"| OUT
    NAT -->|"⑤ 还原源<br/>dst=192.168.88.10"| PC
    style Internet fill:#e0f7fa,stroke:#00acc1
    style Router fill:#ffebee,stroke:#e53935
    style LAN fill:#e8f5e9,stroke:#43a047
    style NAT fill:#fff9c4,stroke:#f9a825"""

def dstnat():
    return """flowchart LR
    subgraph Internet["🌐 互联网"]
        Client["外网用户<br/>访问 203.0.113.10:8080"]
    end
    subgraph Router["🔴 R1 MikroTik"]
        direction TB
        WAN["WAN 口接收<br/>dst=203.0.113.10:8080"]
        NAT["dstnat 链<br/>DST-NAT"]
        FWD["forward 转发"]
        WAN --> NAT --> FWD
    end
    subgraph LAN["🟢 内网 192.168.88.0/24"]
        Srv["内网服务<br/>192.168.88.10:80"]
    end
    Client -->|"① 原始包<br/>dst=203.0.113.10:8080"| WAN
    NAT -->|"② 改写目标<br/>dst=192.168.88.10:80"| FWD
    FWD -->|"③ 转发"| Srv
    Srv -->|"④ 回复包"| FWD
    NAT -->|"⑤ 还原地址"| Client
    style Internet fill:#e0f7fa,stroke:#00acc1
    style Router fill:#ffebee,stroke:#e53935
    style LAN fill:#e8f5e9,stroke:#43a047
    style NAT fill:#fff9c4,stroke:#f9a825"""

def netmap():
    return """flowchart LR
    subgraph Internet["🌐 互联网"]
        Client["外网用户<br/>203.0.113.20"]
    end
    subgraph Router["🔴 R1 MikroTik"]
        direction TB
        WAN["WAN 收包<br/>dst=203.0.113.10"]
        NAT["srcnat+dstnat<br/>netmap 1对1"]
        WAN --> NAT
    end
    subgraph LAN["🟢 内网"]
        Host["内网主机<br/>192.168.88.10"]
    end
    Client -->|"① 原始包<br/>dst=203.0.113.10"| WAN
    NAT -->|"② 一对一改写<br/>dst=192.168.88.10"| Host
    Host -->|"③ 回复 src=192.168.88.10"| NAT
    NAT -->|"④ 改回<br/>src=203.0.113.10"| Client
    style Internet fill:#e0f7fa,stroke:#00acc1
    style Router fill:#ffebee,stroke:#e53935
    style LAN fill:#e8f5e9,stroke:#43a047
    style NAT fill:#fff9c4,stroke:#f9a825"""

def hairpin():
    return """flowchart LR
    subgraph LAN["🟢 内网 192.168.88.0/24"]
        PC["家里电脑<br/>192.168.88.20"]
        Srv["内网服务<br/>192.168.88.10:80"]
    end
    subgraph Router["🔴 R1 MikroTik"]
        direction TB
        DST["dstnat<br/>公网:8080→88.10:80"]
        HP["srcnat hairpin<br/>伪装成网关"]
        DST --> HP
    end
    PC -->|"① 访问<br/>dst=203.0.113.10:8080"| DST
    DST -->|"② 改目标<br/>dst=192.168.88.10:80"| HP
    HP -->|"③ 改源<br/>src=192.168.88.1"| Srv
    Srv -->|"④ 回复到网关"| HP
    HP -->|"⑤ 还原回电脑"| PC
    style Router fill:#ffebee,stroke:#e53935
    style LAN fill:#e8f5e9,stroke:#43a047
    style DST fill:#fff9c4,stroke:#f9a825
    style HP fill:#fff9c4,stroke:#f9a825"""

def wg():
    return """flowchart LR
    subgraph Internet["🌐 互联网"]
        Phone["手机<br/>打 UDP 13231"]
    end
    subgraph Router["🔴 R1 MikroTik"]
        direction TB
        WAN["WAN 收握手"]
        WG["wg-demo 隧道<br/>10.10.10.1"]
        NAT["srcnat<br/>访问 LAN 时伪装"]
        WAN --> WG --> NAT
    end
    subgraph LAN["🟢 内网 192.168.88.0/24"]
        PC["家里电脑<br/>192.168.88.10"]
    end
    subgraph VPN["🟣 WireGuard 10.10.10.0/24"]
        Peer["手机 Peer<br/>10.10.10.2"]
    end
    Phone -->|"① 原始包<br/>UDP 13231"| WAN
    WG -->|"② 解封装<br/>内层 10.10.10.2"| Peer
    NAT -->|"③ 访问 LAN<br/>src 改成 192.168.88.1"| PC
    PC -->|"④ 回复网关"| NAT
    NAT -->|"⑤ 还原进隧道"| Phone
    style Internet fill:#e0f7fa,stroke:#00acc1
    style Router fill:#ffebee,stroke:#e53935
    style LAN fill:#e8f5e9,stroke:#43a047
    style VPN fill:#ede7f6,stroke:#7e57c2
    style NAT fill:#fff9c4,stroke:#f9a825
    style WG fill:#ede7f6,stroke:#7e57c2"""

def ike():
    return """flowchart LR
    subgraph Internet["🌐 互联网"]
        Phone["手机 IKEv2<br/>UDP 500/4500"]
    end
    subgraph Router["🔴 R1 MikroTik"]
        direction TB
        IKE["IKE 协商<br/>证书+ModeConfig"]
        TUN["隧道地址<br/>192.168.77.2"]
        NAT["需要时 srcnat"]
        IKE --> TUN --> NAT
    end
    subgraph LAN["🟢 内网 192.168.88.0/24"]
        Home["家里网段"]
    end
    Phone -->|"① IKE 握手"| IKE
    IKE -->|"② 下发地址<br/>192.168.77.2"| TUN
    TUN -->|"③ 内网流量"| Home
    Home -->|"④ 回复"| NAT
    NAT -->|"⑤ 还原进隧道"| Phone
    style Internet fill:#e0f7fa,stroke:#00acc1
    style Router fill:#ffebee,stroke:#e53935
    style LAN fill:#e8f5e9,stroke:#43a047
    style NAT fill:#fff9c4,stroke:#f9a825"""

def sstp():
    return """flowchart LR
    subgraph Internet["🌐 互联网"]
        Client["电脑 SSTP<br/>TCP 443"]
    end
    subgraph Router["🔴 R1"]
        direction TB
        SSL["www-ssl / SSTP<br/>证书"]
        PPP["PPP 地址"]
        SSL --> PPP
    end
    subgraph LAN["🟢 内网"]
        Home["192.168.88.0/24"]
    end
    Client -->|"① TLS 443"| SSL
    SSL -->|"② 建立 PPP"| PPP
    PPP -->|"③ 进内网"| Home
    Home -->|"④ 回复"| PPP
    PPP -->|"⑤ 封装回客户端"| Client
    style Internet fill:#e0f7fa,stroke:#00acc1
    style Router fill:#ffebee,stroke:#e53935
    style LAN fill:#e8f5e9,stroke:#43a047
    style SSL fill:#fff9c4,stroke:#f9a825"""

def ovpn():
    return """flowchart LR
    subgraph Internet["🌐 互联网"]
        Client["OpenVPN 客户端"]
    end
    subgraph Router["🔴 R1"]
        direction TB
        OV["OVPN Server"]
        TUN["隧道网段"]
        OV --> TUN
    end
    subgraph LAN["🟢 内网"]
        Home["192.168.88.0/24"]
    end
    Client -->|"① 连服务器"| OV
    OV -->|"② 分配隧道 IP"| TUN
    TUN -->|"③ 访问 LAN"| Home
    Home -->|"④ 回复"| TUN
    TUN -->|"⑤ 封装回客户端"| Client
    style Internet fill:#e0f7fa,stroke:#00acc1
    style Router fill:#ffebee,stroke:#e53935
    style LAN fill:#e8f5e9,stroke:#43a047
    style OV fill:#fff9c4,stroke:#f9a825"""

def l2tp():
    return """flowchart LR
    subgraph Internet["🌐 互联网"]
        Client["L2TP/IPsec 客户端"]
    end
    subgraph Router["🔴 R1"]
        direction TB
        IPSEC["IPsec UDP 500/4500"]
        L2["L2TP PPP"]
        IPSEC --> L2
    end
    subgraph LAN["🟢 内网"]
        Home["192.168.88.0/24"]
    end
    Client -->|"① IPsec 握手"| IPSEC
    IPSEC -->|"② L2TP 建会话"| L2
    L2 -->|"③ 进内网"| Home
    Home -->|"④ 回复"| L2
    L2 -->|"⑤ 封装回客户端"| Client
    style Internet fill:#e0f7fa,stroke:#00acc1
    style Router fill:#ffebee,stroke:#e53935
    style LAN fill:#e8f5e9,stroke:#43a047
    style IPSEC fill:#fff9c4,stroke:#f9a825"""

def zt():
    return """flowchart LR
    subgraph Internet["🌐 ZeroTier 云"]
        Cloud["Planet / Moon"]
    end
    subgraph Router["🔴 R1 ARM"]
        direction TB
        ZT["zerotier 接口"]
        BR["可选桥到 LAN"]
        ZT --> BR
    end
    subgraph LAN["🟢 内网"]
        Home["192.168.88.0/24"]
    end
    Cloud -->|"① 成员入网"| ZT
    ZT -->|"② 虚拟二层"| BR
    BR -->|"③ 访问 LAN"| Home
    Home -->|"④ 回复"| BR
    BR -->|"⑤ 回 ZeroTier"| Cloud
    style Internet fill:#e0f7fa,stroke:#00acc1
    style Router fill:#ffebee,stroke:#e53935
    style LAN fill:#e8f5e9,stroke:#43a047
    style ZT fill:#ede7f6,stroke:#7e57c2"""

def ipsec_s2s():
    return """flowchart LR
    subgraph A["🟢 站点 A 192.168.88.0/24"]
        LA["本地电脑"]
    end
    subgraph Router["🔴 R1"]
        direction TB
        POL["IPsec policy"]
        SA["已建立 SA"]
        POL --> SA
    end
    subgraph B["🟢 站点 B 192.168.89.0/24"]
        LB["对端电脑"]
    end
    LA -->|"① 访问 89.0/24"| POL
    POL -->|"② 封装 ESP"| SA
    SA -->|"③ 发到对端"| LB
    LB -->|"④ 回程 ESP"| SA
    SA -->|"⑤ 解封装"| LA
    style A fill:#e8f5e9,stroke:#43a047
    style B fill:#e8f5e9,stroke:#43a047
    style Router fill:#ffebee,stroke:#e53935
    style POL fill:#fff9c4,stroke:#f9a825"""

def knock():
    return """flowchart LR
    subgraph Internet["🌐 互联网"]
        Admin["管理员"]
    end
    subgraph Router["🔴 R1 Filter"]
        direction TB
        K1["第一敲 → 名单"]
        K2["第二敲确认"]
        OK["放行 SSH"]
        K1 --> K2 --> OK
    end
    subgraph LAN["🟢 管理"]
        SSH["TCP 22"]
    end
    Admin -->|"① 敲端口 A"| K1
    K1 -->|"② 写入 address-list"| K2
    Admin -->|"③ 敲端口 B"| K2
    K2 -->|"④ 临时放行"| OK
    OK -->|"⑤ 可连 SSH"| SSH
    style Internet fill:#e0f7fa,stroke:#00acc1
    style Router fill:#ffebee,stroke:#e53935
    style LAN fill:#e8f5e9,stroke:#43a047
    style OK fill:#fff9c4,stroke:#f9a825"""

def fwd():
    return """flowchart LR
    subgraph Internet["🌐 互联网"]
        WAN["不可信流量"]
    end
    subgraph Router["🔴 R1 Filter forward"]
        direction TB
        EST["established/related"]
        LANOK["LAN 出站放行"]
        DROP["其余 drop"]
        EST --> LANOK --> DROP
    end
    subgraph LAN["🟢 内网"]
        PC["电脑"]
    end
    WAN -->|"① 新连接进来"| DROP
    PC -->|"② 内网先出站"| LANOK
    LANOK -->|"③ 建连"| WAN
    WAN -->|"④ 回包 related"| EST
    EST -->|"⑤ 放行回内网"| PC
    style Internet fill:#e0f7fa,stroke:#00acc1
    style Router fill:#ffebee,stroke:#e53935
    style LAN fill:#e8f5e9,stroke:#43a047
    style DROP fill:#fff9c4,stroke:#f9a825"""

def inp():
    return """flowchart LR
    subgraph Internet["🌐 互联网"]
        Att["扫描/攻击"]
    end
    subgraph Router["🔴 R1 Filter input"]
        direction TB
        EST["已建立连接"]
        ICMP["有限 ICMP"]
        LAN["只信 LAN 管理"]
        DROP["其余丢弃"]
        EST --> ICMP --> LAN --> DROP
    end
    subgraph Admin["🟢 管理员"]
        PC["192.168.88.10"]
    end
    PC -->|"① WinBox/SSH"| LAN
    Att -->|"② 新连接打路由器"| DROP
    Att -->|"③ 已建立可回"| EST
    style Internet fill:#e0f7fa,stroke:#00acc1
    style Router fill:#ffebee,stroke:#e53935
    style Admin fill:#e8f5e9,stroke:#43a047
    style DROP fill:#fff9c4,stroke:#f9a825"""

def opt121():
    return """flowchart LR
    subgraph LAN["🟢 电脑 DHCP"]
        PC["客户端"]
    end
    subgraph Router["🔴 R1 DHCP Server"]
        direction TB
        OFFER["offer 地址"]
        OPT["option 121<br/>无类静态路由"]
        OFFER --> OPT
    end
    subgraph Dest["🌐 分流目标"]
        T["指定网段走另一网关"]
    end
    PC -->|"① DHCP 请求"| OFFER
    OFFER -->|"② 发地址+网关"| PC
    OPT -->|"③ 另下发路由"| PC
    PC -->|"④ 匹配网段"| T
    PC -->|"⑤ 其余走默认网关"| OFFER
    style LAN fill:#e8f5e9,stroke:#43a047
    style Router fill:#ffebee,stroke:#e53935
    style Dest fill:#e0f7fa,stroke:#00acc1
    style OPT fill:#fff9c4,stroke:#f9a825"""

def pbr():
    return """flowchart LR
    subgraph LAN["🟢 内网"]
        A["地址列表 A"]
        B["地址列表 B"]
    end
    subgraph Router["🔴 R1"]
        direction TB
        M["mangle 打标记"]
        T["路由表 table1"]
        M --> T
    end
    subgraph Internet["🌐 出口"]
        W1["WAN1"]
        W2["WAN2"]
    end
    A -->|"① 匹配名单"| M
    M -->|"② 打 routing-mark"| T
    T -->|"③ 查 table1"| W2
    B -->|"④ 不打标"| W1
    W2 -->|"⑤ 回程"| A
    style LAN fill:#e8f5e9,stroke:#43a047
    style Router fill:#ffebee,stroke:#e53935
    style Internet fill:#e0f7fa,stroke:#00acc1
    style M fill:#fff9c4,stroke:#f9a825"""

def dual():
    return """flowchart LR
    subgraph LAN["🟢 内网"]
        PC["电脑"]
    end
    subgraph Router["🔴 R1"]
        direction TB
        R["路由/检测"]
        F["主线路失败切备用"]
        R --> F
    end
    subgraph Internet["🌐 双 WAN"]
        W1["WAN1 主"]
        W2["WAN2 备"]
    end
    PC -->|"① 默认走 WAN1"| R
    R -->|"② 探测可达"| W1
    W1 -->|"③ 失败"| F
    F -->|"④ 切 WAN2"| W2
    W2 -->|"⑤ 流量出去"| PC
    style LAN fill:#e8f5e9,stroke:#43a047
    style Router fill:#ffebee,stroke:#e53935
    style Internet fill:#e0f7fa,stroke:#00acc1
    style F fill:#fff9c4,stroke:#f9a825"""

def vlanr():
    return """flowchart LR
    subgraph V10["🟢 VLAN10"]
        A["电脑 A"]
    end
    subgraph Router["🔴 R1 三层"]
        direction TB
        SVI["VLAN 接口 IP"]
        FWD["forward / 防火墙"]
        SVI --> FWD
    end
    subgraph V20["🟢 VLAN20"]
        B["电脑 B"]
    end
    A -->|"① 访问 VLAN20"| SVI
    SVI -->|"② 路由"| FWD
    FWD -->|"③ 转发"| B
    B -->|"④ 回复"| FWD
    FWD -->|"⑤ 回 VLAN10"| A
    style V10 fill:#e8f5e9,stroke:#43a047
    style V20 fill:#e8f5e9,stroke:#43a047
    style Router fill:#ffebee,stroke:#e53935
    style FWD fill:#fff9c4,stroke:#f9a825"""

OUTS = {
    r"04-NAT(nat)\04-Masquerade": masquerade,
    r"04-NAT(nat)\05-DST-NAT端口转发": dstnat,
    r"04-NAT(nat)\06-1对1NAT": netmap,
    r"04-NAT(nat)\07-NAT排错": dstnat,
    r"04-NAT(nat)\08-端口映射与回流": hairpin,
    r"07-VPN(vpn)\01-WireGuard": wg,
    r"07-VPN(vpn)\02-WireGuard手机": wg,
    r"07-VPN(vpn)\03-WireGuard电脑": wg,
    r"07-VPN(vpn)\04-WireGuard站点到站点": ipsec_s2s,
    r"07-VPN(vpn)\05-IKEv2服务器": ike,
    r"07-VPN(vpn)\07-IKEv2手机": ike,
    r"07-VPN(vpn)\08-IKEv2-Windows": ike,
    r"07-VPN(vpn)\09-IPsec站点到站点": ipsec_s2s,
    r"07-VPN(vpn)\11-IKEv2回家": ike,
    r"07-VPN(vpn)\12-SSTP": sstp,
    r"07-VPN(vpn)\13-OpenVPN": ovpn,
    r"07-VPN(vpn)\14-L2TP": l2tp,
    r"07-VPN(vpn)\15-ZeroTier": zt,
    r"05-防火墙(firewall)\02-保护路由器Input": inp,
    r"05-防火墙(firewall)\03-保护内网Forward": fwd,
    r"05-防火墙(firewall)\05-端口放行": inp,
    r"05-防火墙(firewall)\08-端口敲门": knock,
    r"03-DHCP与DNS(dhcp-dns)\04-DHCP-Option分流": opt121,
    r"11-三层路由(routing)\04-策略路由": pbr,
    r"09-高可用(high-availability)\01-双WAN": dual,
    r"10-二层交换(switching)\05-VLAN间路由": vlanr,
}


def render(source: str, out: Path) -> None:
    encoded = base64.urlsafe_b64encode(source.encode("utf-8")).decode("ascii")
    url = f"https://mermaid.ink/img/{encoded}?type=png&bgColor=ffffff&width={WIDTH}"
    req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0"})
    with urllib.request.urlopen(req, timeout=180) as resp:
        out.parent.mkdir(parents=True, exist_ok=True)
        out.write_bytes(resp.read())
    print(f"OK {out} ({out.stat().st_size // 1024} KB)")


def main() -> None:
    for rel, fn in OUTS.items():
        out = ROOT / rel / "images" / "00-包变形.png"
        render(fn(), out)


if __name__ == "__main__":
    main()
