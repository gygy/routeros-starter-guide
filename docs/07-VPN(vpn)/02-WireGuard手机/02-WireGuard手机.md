# WireGuard 手机

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[WireGuard](https://help.mikrotik.com/docs/spaces/ROS/pages/69664792/WireGuard)

## 目的

手机当 Peer 回家。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的）
- 身份示例：`R1`

## 第1步：路由器加 Peer

WinBox：`WireGuard → Peers → +`

动作：Allowed Address=10.10.10.2/32，手机公钥贴进来。

![第1步](images/01-手机.png)

```routeros
/interface/wireguard/peers/add interface=wg-demo public-key="PHONE_PUBLIC_KEY" allowed-address=10.10.10.2/32
```

## 检查

WinBox：手机能 ping 10.10.10.1

```routeros
/interface/wireguard/peers/print
```

## 常见问题

Endpoint 填家公网 IP 或域名。
