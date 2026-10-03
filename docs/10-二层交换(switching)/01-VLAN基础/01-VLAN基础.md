# VLAN 基础

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[Bridge VLAN](https://help.mikrotik.com/docs/spaces/ROS/pages/18964487/Bridging+and+Switching)

## 目的

先认 VLAN ID 与 Bridge VLAN Filtering。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`（改成你的口）
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的管理员密码）
- 身份示例：`R1`

## 第1步：打开 Bridge

WinBox：`Bridge`

动作：确认有 bridge。

![第1步](images/01-vlan.png)

```routeros
/interface/bridge/print
```

## 第2步：看 VLAN Filtering

WinBox：`Bridge → 双击 bridge`

动作：vlan-filtering 按你环境开启（改前备份）。

![第2步](images/02-filtering.png)

```routeros
/interface/bridge/print detail
```

## 检查

WinBox：知道 VLAN ID 与 filtering 开关

```routeros
/interface/bridge/print
/interface/bridge/vlan/print
```

## 常见问题

乱开 filtering 可能断管理。
