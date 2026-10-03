# WireGuard手机

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[WireGuard](https://help.mikrotik.com/docs/spaces/ROS/pages/69664792/WireGuard)

## 目的

手机 App 填：接口地址、私钥、Peer 公网 IP:端口、路由器公钥、Allowed IPs。

## 网络

- Allowed IPs 回家访问内网可填 `192.168.88.0/24,10.10.10.0/24`

## 第1步：对照路由器 Peer

WinBox：`WireGuard → Peers`

手机公钥必须和这里一致。

![第1步](images/01-手机.png)

```routeros
/interface/wireguard/peers/print
```

## 检查

WinBox：`WireGuard → Peers`

```routeros
/interface/wireguard/print
```

## 常见问题

手机不要填真实教程占位密钥。

