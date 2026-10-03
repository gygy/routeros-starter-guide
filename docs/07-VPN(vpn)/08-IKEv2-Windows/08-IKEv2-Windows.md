# IKEv2 Windows

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[IPsec](https://help.mikrotik.com/docs/spaces/ROS/pages/377798671/IPsec)

## 目的

Windows 内置 VPN 连 IKEv2。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的）
- 身份示例：`R1`

## 第1步：确认策略

WinBox：`IP → IPsec → Policies`

动作：服务器侧策略/Identity 已就绪后再连 Windows。

![第1步](images/01-ike-win.png)

```routeros
/ip/ipsec/identity/print
```

## 检查

WinBox：Windows 能访问内网

```routeros
/ip/ipsec/active-peers/print
```

## 常见问题

服务器证书 CN 要匹配连接主机名。
