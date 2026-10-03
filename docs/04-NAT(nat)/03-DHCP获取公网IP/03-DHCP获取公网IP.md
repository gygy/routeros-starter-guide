# DHCP 获取公网 IP

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[DHCP Client](https://help.mikrotik.com/docs/spaces/ROS/pages/24805500/DHCP)

## 目的

光猫桥接后 WAN 用 DHCP。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`（改成你的口）
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的管理员密码）
- 身份示例：`R1`

## 第1步：WAN DHCP Client

WinBox：`IP → DHCP Client → +`

动作：Interface=ether1，Add Default Route=yes。

![第1步](images/01-WANDHCP.png)

```routeros
/ip/dhcp-client/add interface=ether1 add-default-route=yes
```

## 检查

WinBox：状态 bound

```routeros
/ip/dhcp-client/print
```

## 常见问题

拿到地址后再配 masquerade。
