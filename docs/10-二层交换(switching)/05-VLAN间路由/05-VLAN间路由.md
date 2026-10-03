# VLAN间路由

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[IP Addressing](https://help.mikrotik.com/docs/spaces/ROS/pages/328068/IP+Addressing)

## 目的

每个 VLAN 一个地址，路由器当网关。

## 网络

- 示例 LAN：`192.168.88.1/24`，接口 `bridge`（改成你的口）
- WAN 示例口：`ether1`
- 密码示例：`********`（填你自己的）

## 第1步：VLAN 接口地址

WinBox：`Interfaces → VLAN → + 然后 IP → Addresses`

加 vlan10 接口挂在 bridge 上，地址 `192.168.10.1/24`。

![第1步](images/01-svi.png)

```routeros
/interface/vlan/add name=vlan10 vlan-id=10 interface=bridge
/ip/address/add address=192.168.10.1/24 interface=vlan10
```

## 检查

WinBox：`IP → Addresses`

```routeros
/ip/address/print
```

## 常见问题

还要 DHCP 和防火墙按网段放行。

