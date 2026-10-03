# VPN排错

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[WireGuard](https://help.mikrotik.com/docs/spaces/ROS/pages/69664792/WireGuard)

## 目的

先 ping 隧道 IP，再 ping 内网。

## 网络

- 示例 LAN：`192.168.88.1/24`，接口 `bridge`（改成你的口）
- WAN 示例口：`ether1`
- 密码示例：`********`（填你自己的）

## 第1步：看握手

WinBox：`WireGuard → Peers`

Last Handshake 是否在更新。

![第1步](images/01-握手.png)

```routeros
/interface/wireguard/peers/print
```

## 检查

WinBox：`WireGuard → Peers`

```routeros
/ping 10.10.10.2
```

## 常见问题

防火墙没放 UDP 端口时永远无握手。

