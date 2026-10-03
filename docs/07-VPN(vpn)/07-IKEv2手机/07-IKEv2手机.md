# IKEv2手机

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[IPsec](https://help.mikrotik.com/docs/spaces/ROS/pages/69730508/IPsec)

## 目的

手机导入 CA，类型 IKEv2，服务器填你家域名或 IP。

## 网络

- 示例 LAN：`192.168.88.1/24`，接口 `bridge`（改成你的口）
- WAN 示例口：`ether1`
- 密码示例：`********`（填你自己的）

## 第1步：对照 IPsec 策略

WinBox：`IP → IPsec → Installed SAs`

连上后这里有 SA。

![第1步](images/01-sa.png)

```routeros
/ip/ipsec/active-peers/print
```

## 检查

WinBox：`IP → IPsec → Installed SAs`

```routeros
/ip/ipsec/active-peers/print
```

## 常见问题

没有公网或端口被运营商拦就改用 WG。

