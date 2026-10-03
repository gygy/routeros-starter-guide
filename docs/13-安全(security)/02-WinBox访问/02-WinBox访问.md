# WinBox 访问

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[Services](https://help.mikrotik.com/docs/spaces/ROS/pages/328166/Services)

## 目的

限制 WinBox 只对可信网段。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的）
- 身份示例：`R1`

## 第1步：看 winbox 服务

WinBox：`IP → Services`

动作：winbox 端口默认 8291；可改 Available From。

![第1步](images/01-winbox服务.png)

```routeros
/ip/service/print where name=winbox
```

## 检查

WinBox：仅 LAN/VPN 能连

```routeros
/ip/service/set winbox address=192.168.88.0/24
```

## 常见问题

公网暴露 8291 很危险。
