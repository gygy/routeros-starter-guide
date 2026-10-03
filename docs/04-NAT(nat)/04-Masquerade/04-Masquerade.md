# Masquerade

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[NAT](https://help.mikrotik.com/docs/spaces/ROS/pages/3211299/NAT)

## 目的

LAN 共用 WAN 地址出门。

## 网络

- 示例 LAN：`192.168.88.1/24`，接口 `bridge`（改成你的口）
- WAN 示例口：`ether1`
- 密码示例：`********`（填你自己的）

## 第1步：加 masquerade

WinBox：`IP → Firewall → NAT → +`

Chain：`srcnat`；Out. Interface：有网的那个（`pppoe-out1` 或 `ether1`）；Action：`masquerade`；OK。

![第1步](images/01-NAT.png)

```routeros
/ip/firewall/nat/add chain=srcnat out-interface=pppoe-out1 action=masquerade
```

## 检查

WinBox：`IP → Firewall → NAT`

```routeros
/ip/firewall/nat/print
```

## 常见问题

拨号时出接口必须是 pppoe-out1。

