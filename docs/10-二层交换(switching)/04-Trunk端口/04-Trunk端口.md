# Trunk端口

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[Bridging and Switching](https://help.mikrotik.com/docs/spaces/ROS/pages/328081/Bridging+and+Switching)

## 目的

上联交换机打多个 VLAN 标签。

## 网络

- 示例 LAN：`192.168.88.1/24`，接口 `bridge`（改成你的口）
- WAN 示例口：`ether1`
- 密码示例：`********`（填你自己的）

## 第1步：Tagged 列表

WinBox：`Bridge → VLAN`

该 VLAN 的 Tagged 包含 trunk 口。

![第1步](images/01-trunk.png)

```routeros
/interface/bridge/vlan/add bridge=bridge vlan-ids=20 tagged=ether3
```

## 检查

WinBox：`Bridge → VLAN`

```routeros
/interface/bridge/vlan/print
```

## 常见问题

对端也要 trunk。

