# WireGuard远程访问

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[WireGuard](https://help.mikrotik.com/docs/spaces/ROS/pages/69664792/WireGuard)

## 目的

做完 WG 服务端，手机 Allowed IPs 填家网段。

## 网络

- 示例 LAN：`192.168.88.1/24`，接口 `bridge`（改成你的口）
- WAN 示例口：`ether1`
- 密码示例：`********`（填你自己的）

## 第1步：检查握手

WinBox：`WireGuard → Peers`

Last Handshake 有更新即成功。

![第1步](images/01-远程wg.png)

```routeros
/interface/wireguard/peers/print
```

## 检查

WinBox：`WireGuard → Peers`

```routeros
/ping 10.10.10.2
```

## 常见问题

光猫要做 13231/udp 转发到路由器。

