# IPsec 站点到站点

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[IPsec](https://help.mikrotik.com/docs/spaces/ROS/pages/377798671/IPsec)

## 目的

两地办公室互通。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的）
- 身份示例：`R1`

## 第1步：看 Policy

WinBox：`IP → IPsec → Policies`

动作：Src/Dst Address 填两边 LAN。

![第1步](images/01-policy.png)

```routeros
/ip/ipsec/policy/print
```

## 检查

WinBox：Installed SA 有条目

```routeros
/ip/ipsec/installed-sa/print
```

## 常见问题

预共享密钥两端一致。
