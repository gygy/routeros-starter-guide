# Traceroute

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[Traceroute](https://help.mikrotik.com/docs/spaces/ROS/pages/328151/Ping)

## 目的

看丢在第几跳。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的）
- 身份示例：`R1`

## 第1步：Tools Traceroute

WinBox：`Tools → Traceroute`

动作：填目标地址，Start。

![第1步](images/01-tr.png)

```routeros
/tool/traceroute 1.1.1.1
```

## 检查

WinBox：能看到路径

```routeros
/tool/traceroute 1.1.1.1
```

## 常见问题

超时跳可能被中间设备禁 ICMP。
