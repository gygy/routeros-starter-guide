# IKEv2 服务器

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[IPsec](https://help.mikrotik.com/docs/spaces/ROS/pages/377798671/IPsec)

## 目的

手机系统 VPN 常用 IKEv2。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的）
- 身份示例：`R1`

## 第1步：打开 IPsec

WinBox：`IP → IPsec`

动作：先看 Policies / Peers / Identities 结构。

![第1步](images/01-ipsec.png)

```routeros
/ip/ipsec/policy/print
```

## 检查

WinBox：IPsec 窗口可打开

```routeros
/ip/ipsec/peer/print
```

## 常见问题

证书课见下一课。
