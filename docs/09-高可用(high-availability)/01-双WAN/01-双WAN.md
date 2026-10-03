# 双WAN

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[IP Routing](https://help.mikrotik.com/docs/spaces/ROS/pages/59965516/IP+Routing)

## 目的

两条线上网（主备或一起用）。先让两条都能单独通。

## 网络

- wan1：`pppoe-out1` 或 `ether1`
- wan2：`ether2`（示例）

## 第1步：两条默认路由

WinBox：`IP → Routes`

两条 `0.0.0.0/0`，距离不同：主用 distance=1，备用 distance=2。

![第1步](images/01-双路由.png)

```routeros
/ip/route/add dst-address=0.0.0.0/0 gateway=pppoe-out1 distance=1
/ip/route/add dst-address=0.0.0.0/0 gateway=192.168.2.1 distance=2
```

## 检查

WinBox：`IP → Routes`

```routeros
/ip/route/print
```

## 常见问题

先通一条再加第二条。策略分流以后再做。

