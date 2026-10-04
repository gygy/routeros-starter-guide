# OpenVPN 回家

> 适用版本：RouterOS 7.x

## 目的

路由器开 OVPN 服务器，电脑用账号（和证书）连回家。

## 网络

- LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`（改成你的口）
- WAN：`pppoe-out1` 或 `ether1`
- 公网示例用 TEST-NET：`203.0.113.10`；密码只写 `********`
- 身份示例：`R1`
- 池：`192.168.77.2-192.168.77.20`，本端 `192.168.77.1`
- 默认 TCP 1194（也可改 UDP）

## 先看懂

电脑用账号连 TCP 1194，R1 从池里发 192.168.77.x。

![图(0) OpenVPN回家](images/00-原理.svg)

```mermaid
flowchart LR
    subgraph C["🟣 路上"]
      Ph["手机 / 电脑"]
    end
    subgraph R["🔴 R1"]
      V["隧道口"]
    end
    subgraph L["🟢 家里 LAN"]
      H["192.168.88.0/24"]
    end
    Ph -->|① 加密进隧道| V -->|② 解开进 LAN| H
    style C fill:#ede7f6,stroke:#7e57c2
    style R fill:#ffebee,stroke:#e53935
    style L fill:#e8f5e9,stroke:#43a047
    style V fill:#fff9c4,stroke:#f9a825
```

## 第1步：签服务器证书

WinBox：`System → Certificates`

动作：CA + server（tls-server）。最简只需服务器证书。

![图(1) 签服务器证书](images/01-证书.png)

```routeros
/certificate/add name=ca-ovpn common-name=ovpn-ca key-usage=key-cert-sign,crl-sign
/certificate/sign ca-ovpn
/certificate/add name=ovpn-server common-name=203.0.113.10 key-usage=tls-server
/certificate/sign ovpn-server ca=ca-ovpn
```

## 第2步：地址池和 PPP Profile

WinBox：`IP → Pool / PPP → Profiles`

动作：Pool=ovpn-pool。Profile 名 ovpn：Local Address=192.168.77.1，Remote Address=ovpn-pool。

![图(2) 地址池和PPPProfile](images/02-池.png)

```routeros
/ip/pool/add name=ovpn-pool ranges=192.168.77.2-192.168.77.20
/ppp/profile/add name=ovpn local-address=192.168.77.1 remote-address=ovpn-pool
```

## 第3步：PPP 账号

WinBox：`PPP → Secrets → +`

动作：Name=ovpnuser，Password=********，Service=ovpn，Profile=ovpn。

![图(3) PPP账号](images/03-用户.png)

```routeros
/ppp/secret/add name=ovpnuser password=******** service=ovpn profile=ovpn
```

## 第4步：启用 OVPN 服务器

WinBox：`PPP / Interfaces → OVPN Server`

动作：v7 用 /interface/ovpn-server/server add：certificate=ovpn-server，disabled=no，port=1194。

![图(4) 启用OVPN服务器](images/04-服务器.png)

```routeros
/interface/ovpn-server/server/add name=ovpn-home certificate=ovpn-server port=1194 protocol=tcp disabled=no default-profile=ovpn
```

## 第5步：防火墙放行 1194

WinBox：`IP → Firewall → Filter Rules`

动作：input TCP（或 UDP）1194 accept。

![图(5) 防火墙放行1194](images/05-防火墙.png)

```routeros
/ip/firewall/filter/add chain=input protocol=tcp dst-port=1194 action=accept comment=lab-ovpn
```

## 检查

WinBox：有 ovpn 动态接口或 PPP Active；客户端能 ping 192.168.77.1

```routeros
/interface/ovpn-server/server/print
/ppp/active/print
```

## 常见问题

容易忽略：客户端 .ovpn 里的 cipher 要和服务器一致。时间必须准。导出客户端配置需要 require-client-certificate。
