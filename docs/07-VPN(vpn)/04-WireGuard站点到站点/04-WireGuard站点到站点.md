# WireGuard站点到站点

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[WireGuard](https://help.mikrotik.com/docs/spaces/ROS/pages/69664792/WireGuard)

## 目的

两个站点互加 Peer，Allowed Address 填对端局域网。

## 网络

- 站点 A LAN `192.168.88.0/24` 站点 B `192.168.89.0/24`

## 第1步：Allowed 填对端网段

WinBox：`WireGuard → Peers`

Allowed Address 含 `192.168.89.0/24`，并加静态路由走 wg1。

![第1步](images/01-s2s.png)

```routeros
/ip/route/add dst-address=192.168.89.0/24 gateway=wg1
```

## 检查

WinBox：`IP → Routes`

```routeros
/ip/route/print
```

## 常见问题

两边公钥交叉填写。

