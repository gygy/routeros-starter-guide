# WireGuard 电脑

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[WireGuard](https://help.mikrotik.com/docs/spaces/ROS/pages/69664792/WireGuard)

## 目的

电脑 Peer 与手机同理。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的）
- 身份示例：`R1`

## 第1步：加电脑 Peer

WinBox：`WireGuard → Peers → +`

动作：Allowed Address=10.10.10.3/32。

![第1步](images/01-电脑.png)

```routeros
/interface/wireguard/peers/add interface=wg-demo public-key="PC_PUBLIC_KEY" allowed-address=10.10.10.3/32
```

## 检查

WinBox：电脑能访问家里网段（需放行）

```routeros
/interface/wireguard/peers/print
```

## 常见问题

Allowed Address 别写错。
