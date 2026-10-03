# VPN 排错

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[WireGuard](https://help.mikrotik.com/docs/spaces/ROS/pages/69664792/WireGuard)

## 目的

先看握手和防火墙。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的）
- 身份示例：`R1`

## 第1步：看 WireGuard

WinBox：`WireGuard / Peers`

动作：Last Handshake 是否更新。

![第1步](images/01-握手.png)

```routeros
/interface/wireguard/peers/print
```

## 检查

WinBox：Handshake 在变

```routeros
/interface/wireguard/peers/print
/ip/firewall/filter/print
```

## 常见问题

端口没转发是最常见原因。
