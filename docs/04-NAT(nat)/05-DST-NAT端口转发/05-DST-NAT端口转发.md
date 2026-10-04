# DST-NAT 端口转发

> 适用版本：RouterOS 7.x

## 目的

把公网端口转到内网主机。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`（改成你的口）
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的管理员密码）
- 身份示例：`R1`

## 先看懂

别人访问你的 WAN:8080，R1 改成 192.168.88.10:80。

![图(0) 端口转发](images/00-原理.svg)

```mermaid
flowchart LR
    subgraph W["🌐 外网"]
      U["用户 → WAN:8080"]
    end
    subgraph R["🔴 R1"]
      D["dstnat 改目标 .10:80"]
    end
    subgraph L["🟢 家里"]
      S["192.168.88.10:80"]
    end
    U -->|① 原始包| D -->|② 转发| S
    style W fill:#e0f7fa,stroke:#00acc1
    style R fill:#ffebee,stroke:#e53935
    style L fill:#e8f5e9,stroke:#43a047
    style D fill:#fff9c4,stroke:#f9a825
```

## 第1步：打开 NAT 列表

WinBox：`IP → Firewall → NAT`

动作：先看到现有 NAT 规则。

![图(1) 打开NAT列表](images/01-dstnat.png)

```routeros
/ip/firewall/nat/print
```

## 第2步：添加 dst-nat

WinBox：`IP → Firewall → NAT → +`

动作：Chain=dstnat，Protocol=tcp，Dst. Port=8080，In. Interface=pppoe-out1，Action=dst-nat，To Addresses=192.168.88.10，Comment=lab-portfwd。

![图(2) 添加dst-nat](images/02-规则.png)

```routeros
/ip/firewall/nat/add chain=dstnat protocol=tcp dst-port=8080 in-interface=pppoe-out1 action=dst-nat to-addresses=192.168.88.10 comment=lab-portfwd
```

## 检查

WinBox：NAT 有 lab-portfwd

```routeros
/ip/firewall/nat/print where comment=lab-portfwd
```
