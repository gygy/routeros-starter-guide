# 双WAN分流

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[IP Routing](https://help.mikrotik.com/docs/spaces/ROS/pages/59965516/IP+Routing)

## 目的

主备见双 WAN 课；分流用策略路由。

## 网络

- 示例 LAN：`192.168.88.1/24`，接口 `bridge`（改成你的口）
- WAN 示例口：`ether1`
- 密码示例：`********`（填你自己的）

## 第1步：两条默认路由

WinBox：`IP → Routes`

不同 distance。

![第1步](images/01-分流.png)

```routeros
/ip/route/print
```

## 检查

WinBox：`IP → Routes`

```routeros
/ip/route/print
```

## 常见问题

先保证两条线都能单独上网。

