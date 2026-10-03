# WireGuard电脑

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[WireGuard](https://help.mikrotik.com/docs/spaces/ROS/pages/69664792/WireGuard)

## 目的

电脑官方客户端，字段同手机。

## 网络

- 示例 LAN：`192.168.88.1/24`，接口 `bridge`（改成你的口）
- WAN 示例口：`ether1`
- 密码示例：`********`（填你自己的）

## 第1步：同一套 Peer

WinBox：`WireGuard → Peers → +`

再加一条电脑公钥，Allowed `10.10.10.3/32`。

![第1步](images/01-电脑.png)

```routeros
/interface/wireguard/peers/add interface=wg1 public-key="PC_PUBLIC_KEY" allowed-address=10.10.10.3/32
```

## 检查

WinBox：`WireGuard → Peers`

```routeros
/interface/wireguard/peers/print
```

## 常见问题

一台设备一条 Peer。

