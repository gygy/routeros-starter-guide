# IKEv2 手机

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[IPsec](https://help.mikrotik.com/docs/spaces/ROS/pages/377798671/IPsec)

## 目的

手机系统 VPN 连回家。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的）
- 身份示例：`R1`

## 第1步：看 Active Peers / SA

WinBox：`IP → IPsec → Active Peers`

动作：手机连上后这里有条目。

![第1步](images/01-sa.png)

```routeros
/ip/ipsec/active-peers/print
```

## 检查

WinBox：手机显示已连接

```routeros
/ip/ipsec/installed-sa/print
```

## 常见问题

UDP 500/4500 要放行。
