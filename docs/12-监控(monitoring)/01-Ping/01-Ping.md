# Ping

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[Ping](https://help.mikrotik.com/docs/spaces/ROS/pages/328187/Ping)

## 目的

先 ping 通再查别的。

## 网络

- 示例 LAN：`192.168.88.1/24`，接口 `bridge`（改成你的口）
- WAN 示例口：`ether1`
- 密码示例：`********`（填你自己的）

## 第1步：Ping

WinBox：`Tools → Ping`

Address 填 `1.1.1.1`，Start。

![第1步](images/01-ping.png)

```routeros
/ping 1.1.1.1 count=5
```

## 检查

WinBox：`Tools → Ping`

```routeros
/ping 192.168.88.1 count=3
```

## 常见问题

能 ping IP 不能打开网页：查 DNS。

