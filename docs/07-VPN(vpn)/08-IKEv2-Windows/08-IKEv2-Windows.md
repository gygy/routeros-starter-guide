# IKEv2 Windows

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[IPsec](https://help.mikrotik.com/docs/spaces/ROS/pages/69730508/IPsec)

## 目的

Windows 添加 VPN：IKEv2，预共享或证书与路由器一致。

## 网络

- 示例 LAN：`192.168.88.1/24`，接口 `bridge`（改成你的口）
- WAN 示例口：`ether1`
- 密码示例：`********`（填你自己的）

## 第1步：看 Peer

WinBox：`IP → IPsec → Peers`

电脑连上后计数增加。

![第1步](images/01-ike-win.png)

```routeros
/ip/ipsec/active-peers/print
```

## 检查

WinBox：`IP → IPsec → Peers`

```routeros
/ip/ipsec/active-peers/print
```

## 常见问题

系统 VPN 比第三方稳。

