# Masquerade

> 适用版本：RouterOS 7.x

## 目的

内网共享上网。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`（改成你的口）
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的管理员密码）
- 身份示例：`R1`

## 先看懂

家里私网地址不能上公网，R1 把源地址换成 WAN 口。

![图(1) Masquerade](images/00-原理.svg)

<p align="center">图(1) Masquerade</p>

```mermaid
flowchart LR
    subgraph L["🟢 家里"]
      P["电脑 192.168.88.10"]
    end
    subgraph R["🔴 R1 srcnat"]
      M["masquerade 换源"]
    end
    subgraph W["🌐 互联网"]
      I["只看见 WAN 地址"]
    end
    P -->|① 私网源| M -->|② 公网源| I
    style L fill:#e8f5e9,stroke:#43a047
    style R fill:#ffebee,stroke:#e53935
    style W fill:#e0f7fa,stroke:#00acc1
    style M fill:#fff9c4,stroke:#f9a825
```

## 第1步：打开 NAT

WinBox：`IP → Firewall → NAT`

动作：确认在 NAT 页签（不是 Filter Rules）。

![图(2) 打开NAT](images/01-NAT.png)

<p align="center">图(2) 打开NAT</p>


```routeros
/ip/firewall/nat/print
```

## 第2步：添加 masquerade

WinBox：`IP → Firewall → NAT → +`

动作：Chain=srcnat，Out. Interface=pppoe-out1，Action=masquerade，Comment=lab-masq。

![图(3) 添加masquerade](images/02-添加.png)

<p align="center">图(3) 添加masquerade</p>


```routeros
/ip/firewall/nat/add chain=srcnat out-interface=pppoe-out1 action=masquerade comment=lab-masq
```

## 检查

WinBox：NAT 有 lab-masq

```routeros
/ip/firewall/nat/print where comment=lab-masq
```
