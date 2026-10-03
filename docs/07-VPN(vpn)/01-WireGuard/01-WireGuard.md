# WireGuard

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[WireGuard](https://help.mikrotik.com/docs/spaces/ROS/pages/69664792/WireGuard)

## 目的

家里做 WG 服务端，出门能连回家。

## 网络

- 隧道网段示例 `10.10.10.1/24`（路由器）
- Peer 的 Allowed Address 填对方隧道 IP

## 第1步：加 WG 接口

WinBox：`WireGuard → WireGuard → +`

Name `wg1`，Listen Port `13231`，OK。复制公钥给手机。

![第1步](images/01-wg.png)

```routeros
/interface/wireguard/add name=wg1 listen-port=13231
```

## 第2步：隧道地址

WinBox：`IP → Addresses → +`

`10.10.10.1/24` 接口 `wg1`。

![第2步](images/02-wgip.png)

```routeros
/ip/address/add address=10.10.10.1/24 interface=wg1
```

## 第3步：加 Peer

WinBox：`WireGuard → Peers → +`

Interface `wg1`，Public Key 填手机公钥，Allowed Address `10.10.10.2/32`。

![第3步](images/03-peer.png)

```routeros
/interface/wireguard/peers/add interface=wg1 public-key="PEER_PUBLIC_KEY" allowed-address=10.10.10.2/32
```

## 检查

WinBox：`WireGuard → Peers`

```routeros
/interface/wireguard/peers/print
```

## 常见问题

防火墙放行 13231/udp。密钥不要进 git。

