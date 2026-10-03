# VPN 排错

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[WireGuard](https://help.mikrotik.com/docs/spaces/ROS/pages/69664792/WireGuard)

## 目的

先看接口与握手。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`（改成你的口）
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的管理员密码）
- 身份示例：`R1`

## 第1步：看 WireGuard

WinBox：`WireGuard`

动作：接口是否 Running，端口是否监听。

![第1步](images/01-握手.png)

```routeros
/interface/wireguard/print
```

## 第2步：看 Peer 握手

WinBox：`WireGuard → Peers`

动作：Last Handshake 是否更新。

![第2步](images/02-peer.png)

```routeros
/interface/wireguard/peers/print
```

## 检查

WinBox：握手时间在刷新或隧道能 ping

```routeros
/interface/wireguard/peers/print
/ping 10.10.10.2 count=2
```

## 常见问题

先查端口转发与公钥是否配对。
