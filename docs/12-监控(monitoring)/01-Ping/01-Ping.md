# Ping

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[Ping](https://help.mikrotik.com/docs/spaces/ROS/pages/328151/Ping)

## 目的

连通性第一刀。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的）
- 身份示例：`R1`

## 第1步：Tools Ping

WinBox：`Tools → Ping`

动作：Address 填 1.1.1.1，Start。

![第1步](images/01-ping.png)

```routeros
/ping 1.1.1.1 count=5
```

## 检查

WinBox：有 reply

```routeros
/ping 1.1.1.1 count=5
```

## 常见问题

先 ping 网关再 ping 外网。
