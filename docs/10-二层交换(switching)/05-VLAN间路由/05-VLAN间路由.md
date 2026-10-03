# VLAN 间路由

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[IP Addressing](https://help.mikrotik.com/docs/spaces/ROS/pages/328068/IP+Addressing)

## 目的

给 VLAN 接口加地址即可三层互通。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的）
- 身份示例：`R1`

## 第1步：给 vlan10 加地址

WinBox：`IP → Addresses → +`

动作：Address=192.168.10.1/24，Interface=vlan10。901 已实配。

![第1步](images/01-svi.png)

```routeros
/ip/address/add address=192.168.10.1/24 interface=vlan10
```

## 检查

WinBox：Addresses 有 192.168.10.1

```routeros
/ip/address/print where interface=vlan10
```

## 常见问题

跨 VLAN 再用防火墙做隔离。
