# 两地IPsec互联

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[IPsec](https://help.mikrotik.com/docs/spaces/ROS/pages/69730508/IPsec)

## 目的

两边 Policy 对填，PSK 私下给。

## 网络

- 示例 LAN：`192.168.88.1/24`，接口 `bridge`（改成你的口）
- WAN 示例口：`ether1`
- 密码示例：`********`（填你自己的）

## 第1步：看 SA

WinBox：`IP → IPsec → Installed SAs`

有 SA 再 ping 对端 LAN。

![第1步](images/01-两地.png)

```routeros
/ip/ipsec/installed-sa/print
```

## 检查

WinBox：`IP → IPsec`

```routeros
/ping 192.168.90.1
```

## 常见问题

NAT 后的 IPsec 要开 NAT-T。

