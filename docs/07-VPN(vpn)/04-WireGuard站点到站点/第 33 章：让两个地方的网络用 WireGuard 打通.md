# 第 33 章：让两个地方的网络用 WireGuard 打通

> 适用版本：RouterOS 7.x

## 目的

两地互访。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`（改成你的口）
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的管理员密码）
- 身份示例：`R1`
- Endpoint 示例：`203.0.113.50:13231`（TEST-NET）
- 公钥示例：`BASE64PUBLICKEY=======`


## 网络拓扑及原理图

两边各一个 WG，把对端网段写进 allowed-address。

![图(1) WG站点](images/00-原理.png)

<p align="center">图(1) WG站点</p>

![图(2) 数据包变形](images/00-包变形.png)

<p align="center">图(2) 数据包变形</p>


## 第1步：核对服务端

WinBox：`WireGuard`

动作：wg-demo Running，有 Listen Port。

![图(3) 核对服务端](images/01-s2s.png)

<p align="center">图(3) 核对服务端</p>


```routeros
/interface/wireguard/print
```

## 第2步：添加/核对 Peer

WinBox：`WireGuard → Peers`

动作：Public Key、Allowed Address、Endpoint 按对端填写（勿写真实私钥）。

![图(4) 添加/核对Peer](images/02-peer.png)

<p align="center">图(4) 添加/核对Peer</p>


```routeros
/interface/wireguard/peers/print
```

## 检查

WinBox：Peer 有握手或能 ping 隧道地址

```routeros
/interface/wireguard/peers/print
```

## 常见问题

容易忽略：两边 Peer 互指公网与 AllowedIPs。
