# DHCP 获取公网 IP

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[DHCP Client](https://help.mikrotik.com/docs/spaces/ROS/pages/24805389/DHCP)

## 目的

WAN 口 DHCP 拿公网/上联地址。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`（改成你的口）
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的管理员密码）
- 身份示例：`R1`

## 第1步：打开 DHCP Client

WinBox：`IP → DHCP Client`

动作：Interface 选 WAN 口。

![第1步](images/01-WANDHCP.png)

```routeros
/ip/dhcp-client/print
```

## 第2步：确认地址与路由

WinBox：`IP → Addresses / Routes`

动作：动态地址出现，且有默认路由。

![第2步](images/02-路由.png)

```routeros
/ip/dhcp-client/print
/ip/route/print where dst-address=0.0.0.0/0
```

## 检查

WinBox：Client bound 且有默认路由

```routeros
/ip/dhcp-client/print
/ip/route/print where dst-address=0.0.0.0/0
```

## 常见问题

与静态 WAN / PPPoE 不要叠三套。
