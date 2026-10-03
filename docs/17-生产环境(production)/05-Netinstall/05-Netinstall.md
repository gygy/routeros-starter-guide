# Netinstall

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[Netinstall](https://help.mikrotik.com/docs/spaces/ROS/pages/24819399/Netinstall)

## 目的

系统坏了用 Netinstall 救砖。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的）
- 身份示例：`R1`

## 第1步：准备

WinBox：`System → Packages`

动作：记下架构（x86）。Netinstall 在电脑侧操作。

![第1步](images/01-netinstall.png)

```routeros
/system/resource/print
```

## 检查

WinBox：能重新装上 RouterOS

```routeros
/system/resource/print
```

## 常见问题

按官方 Netinstall 文档操作。
