# Traceroute

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[Traceroute](https://help.mikrotik.com/docs/spaces/ROS/pages/328188/Traceroute)

## 目的

看出网走哪几跳。

## 网络

- 示例 LAN：`192.168.88.1/24`，接口 `bridge`（改成你的口）
- WAN 示例口：`ether1`
- 密码示例：`********`（填你自己的）

## 第1步：Traceroute

WinBox：`Tools → Traceroute`

填 `1.1.1.1`。

![第1步](images/01-tr.png)

```routeros
/tool/traceroute 1.1.1.1
```

## 检查

WinBox：`Tools → Traceroute`

```routeros
/tool/traceroute 1.1.1.1
```

## 常见问题

第一跳应是你的网关。

