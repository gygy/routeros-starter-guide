# DHCP 客户端

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[DHCP Client](https://help.mikrotik.com/docs/spaces/ROS/pages/24805389/DHCP)

## 目的

WAN 口用 DHCP 拿地址。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`（改成你的口）
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的管理员密码）
- 身份示例：`R1`

## 第1步：打开 DHCP Client

WinBox：`IP → DHCP Client`

动作：看 Interface、Status。

![第1步](images/01-DHCPClient.png)

```routeros
/ip/dhcp-client/print
```

## 第2步：添加客户端

WinBox：`IP → DHCP Client → +`

动作：Interface=ether1（示例），Add Default Route=yes。

![第2步](images/02-添加.png)

```routeros
/ip/dhcp-client/add interface=ether1 add-default-route=yes
```

## 检查

WinBox：Status=bound 或已有动态地址

```routeros
/ip/dhcp-client/print
/ip/address/print where dynamic
```

## 常见问题

与 PPPoE 二选一，别重复默认路由。
