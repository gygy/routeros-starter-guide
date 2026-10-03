# VLAN 基础

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[Bridge VLAN](https://help.mikrotik.com/docs/spaces/ROS/pages/18964487/Bridging+and+Switching)

## 目的

用 VLAN 隔离访客/摄像头。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的）
- 身份示例：`R1`

## 第1步：看 Bridge

WinBox：`Bridge`

动作：先有 bridge，再谈 VLAN Filtering。

![第1步](images/01-vlan.png)

```routeros
/interface/bridge/print
```

## 检查

WinBox：Bridge 存在

```routeros
/interface/bridge/print
```

## 常见问题

先会建桥再开 filtering。
