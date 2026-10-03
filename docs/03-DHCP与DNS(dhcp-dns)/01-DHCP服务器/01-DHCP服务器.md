# DHCP 服务器

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[DHCP Server](https://help.mikrotik.com/docs/spaces/ROS/pages/24805389/DHCP)

## 目的

给内网发地址。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`（改成你的口）
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的管理员密码）
- 身份示例：`R1`

## 第1步：打开 DHCP Server

WinBox：`IP → DHCP Server`

动作：看是否已有 dhcp1。

![第1步](images/01-DHCP.png)

```routeros
/ip/dhcp-server/print
```

## 第2步：核对 Network

WinBox：`IP → DHCP Server → Networks`

动作：Address=192.168.88.0/24，Gateway=192.168.88.1。

![第2步](images/02-网络.png)

```routeros
/ip/dhcp-server/network/print
```

## 检查

WinBox：dhcp1 启用

```routeros
/ip/dhcp-server/print
/ip/dhcp-server/network/print
```

## 常见问题

先有地址池再开 Server。
