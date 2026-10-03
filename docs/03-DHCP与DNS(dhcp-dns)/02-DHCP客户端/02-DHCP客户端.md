# DHCP客户端

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[DHCP](https://help.mikrotik.com/docs/spaces/ROS/pages/24805500/DHCP)

## 目的

WAN 口从上级自动拿地址（光猫已拨号时常用）。

## 网络

- 示例 LAN：`192.168.88.1/24`，接口 `bridge`（改成你的口）
- WAN 示例口：`ether1`
- 密码示例：`********`（填你自己的）

## 第1步：加 DHCP Client

WinBox：`IP → DHCP Client → +`

Interface：`ether1`；勾选 Add Default Route；OK。

![第1步](images/01-DHCPClient.png)

```routeros
/ip/dhcp-client/add interface=ether1 add-default-route=yes use-peer-dns=yes
```

## 检查

WinBox：`IP → DHCP Client`

```routeros
/ip/dhcp-client/print
```

## 常见问题

账号拨号不要用这一课，用 PPPoE。

