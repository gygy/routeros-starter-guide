# 双 WAN

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[Routes](https://help.mikrotik.com/docs/spaces/ROS/pages/59968792/Routes)

## 目的

两条上行，用 distance 区分主备。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`（改成你的口）
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的管理员密码）
- 身份示例：`R1`

## 第1步：看默认路由

WinBox：`IP → Routes`

动作：主线 distance 更小，带 A。

![第1步](images/01-双路由.png)

```routeros
/ip/route/print where dst-address=0.0.0.0/0
```

## 第2步：备线 distance

WinBox：`IP → Routes → +`

动作：备线 distance=2；可加 check-gateway=ping。

![第2步](images/02-备路由.png)

```routeros
/ip/route/add dst-address=0.0.0.0/0 gateway=ether2 distance=2 check-gateway=ping
```

## 检查

WinBox：主线 Active

```routeros
/ip/route/print where dst-address=0.0.0.0/0
```

## 常见问题

两条线都要各自 NAT。
