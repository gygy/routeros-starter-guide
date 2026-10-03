# IKEv2服务器

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[IPsec](https://help.mikrotik.com/docs/spaces/ROS/pages/69730508/IPsec)

## 目的

系统自带 VPN 客户端可用 IKEv2（证书稍后做）。

## 网络

- 示例 LAN：`192.168.88.1/24`，接口 `bridge`（改成你的口）
- WAN 示例口：`ether1`
- 密码示例：`********`（填你自己的）

## 第1步：打开 IPsec

WinBox：`IP → IPsec`

先看 Profiles / Proposals，下一课导入证书再加 Mode Config。

![第1步](images/01-ipsec.png)

```routeros
/ip/ipsec/profile/print
```

## 检查

WinBox：`IP → IPsec`

```routeros
/ip/ipsec/profile/print
```

## 常见问题

家庭优先 WireGuard，更简单。

