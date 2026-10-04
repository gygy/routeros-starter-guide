# WireGuard 电脑

> 适用版本：RouterOS 7.x

## 目的

电脑连回家。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`（改成你的口）
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的管理员密码）
- 身份示例：`R1`
- Endpoint 示例：`203.0.113.50:13231`（TEST-NET）
- 公钥示例：`BASE64PUBLICKEY=======`


## 先看懂

和手机同一套，只是客户端换成电脑。

![图(0) 电脑Peer](images/00-原理.svg)

## 第1步：核对服务端

WinBox：`WireGuard`

动作：wg-demo Running，有 Listen Port。

![图(1) 核对服务端](images/01-电脑.png)

```routeros
/interface/wireguard/print
```

## 第2步：添加/核对 Peer

WinBox：`WireGuard → Peers`

动作：Public Key、Allowed Address、Endpoint 按对端填写（勿写真实私钥）。

![图(2) 添加/核对Peer](images/02-peer.png)

```routeros
/interface/wireguard/peers/print
```

## 检查

WinBox：Peer 有握手或能 ping 隧道地址

```routeros
/interface/wireguard/peers/print
```
