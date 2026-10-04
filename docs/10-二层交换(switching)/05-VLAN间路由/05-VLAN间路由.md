# VLAN 间路由

> 适用版本：RouterOS 7.x



## 目的

给 VLAN 接口加地址做三层互通。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`（改成你的口）
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的管理员密码）
- 身份示例：`R1`

## 第1步：确认 VLAN 接口

WinBox：`Interfaces`

动作：应有 vlan10（或你建的 VLAN 接口）。

![图(1) 确认VLAN接口](images/01-svi.png)

```routeros
/interface/vlan/print
```

## 第2步：加地址

WinBox：`IP → Addresses → +`

动作：Address=192.168.10.1/24，Interface=vlan10。

![图(2) 加地址](images/02-地址.png)

```routeros
/ip/address/add address=192.168.10.1/24 interface=vlan10
```

## 检查

WinBox：vlan10 有地址且可 ping

```routeros
/ip/address/print where interface=vlan10
```
