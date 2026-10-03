# WireGuard 站点到站点

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[WireGuard](https://help.mikrotik.com/docs/spaces/ROS/pages/69664792/WireGuard)

## 目的

两台 RouterOS 互连内网。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的）
- 身份示例：`R1`

## 第1步：对端 Peer

WinBox：`WireGuard → Peers → +`

动作：Allowed Address 填对端 LAN；两边对称配置。

![第1步](images/01-s2s.png)

```routeros
/interface/wireguard/peers/add interface=wg-demo public-key="SITE_B_KEY" allowed-address=192.168.89.0/24 endpoint-address=203.0.113.20 endpoint-port=13231
```

## 检查

WinBox：两边能互 ping 内网

```routeros
/interface/wireguard/peers/print
```

## 常见问题

记得加对方网段路由。
