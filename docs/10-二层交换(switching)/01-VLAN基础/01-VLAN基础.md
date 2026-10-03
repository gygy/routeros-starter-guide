# VLAN基础

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[Bridging and Switching](https://help.mikrotik.com/docs/spaces/ROS/pages/328081/Bridging+and+Switching)

## 目的

用 VLAN 把访客/摄像头分开。家里单网段可跳过。

## 网络

- 示例 LAN：`192.168.88.1/24`，接口 `bridge`（改成你的口）
- WAN 示例口：`ether1`
- 密码示例：`********`（填你自己的）

## 第1步：打开 VLAN Filtering

WinBox：`Bridge → VLAN`

先看有没有桥。下一课再加 VLAN。

![第1步](images/01-vlan.png)

```routeros
/interface/bridge/vlan/print
```

## 检查

WinBox：`Bridge → VLAN`

```routeros
/interface/bridge/vlan/print
```

## 常见问题

v7 推荐 bridge vlan-filtering。

