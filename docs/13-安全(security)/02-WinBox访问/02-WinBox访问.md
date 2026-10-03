# WinBox访问

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[WinBox](https://help.mikrotik.com/docs/spaces/ROS/pages/328129/WinBox)

## 目的

限制谁能用 8291。

## 网络

- 示例 LAN：`192.168.88.1/24`，接口 `bridge`（改成你的口）
- WAN 示例口：`ether1`
- 密码示例：`********`（填你自己的）

## 第1步：Services

WinBox：`IP → Services 双击 winbox`

Available From 填 `192.168.88.0/24`。

![第1步](images/01-winbox服务.png)

```routeros
/ip/service/set winbox address=192.168.88.0/24
```

## 检查

WinBox：`IP → Services`

```routeros
/ip/service/print
```

## 常见问题

不要对 0.0.0.0/0 开放。

