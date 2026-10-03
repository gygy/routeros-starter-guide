# DHCP服务器

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[DHCP](https://help.mikrotik.com/docs/spaces/ROS/pages/24805500/DHCP)

## 目的

电脑自动拿 LAN 地址。

## 网络

- 示例 LAN：`192.168.88.1/24`，接口 `bridge`（改成你的口）
- WAN 示例口：`ether1`
- 密码示例：`********`（填你自己的）

## 第1步：DHCP Setup

WinBox：`IP → DHCP Server → DHCP Setup`

接口 `bridge`；网段 `192.168.88.0/24`；池 `192.168.88.100-192.168.88.200`；网关和 DNS 填 `192.168.88.1`。

![第1步](images/01-DHCP.png)

```routeros
/ip/pool/add name=dhcp_pool ranges=192.168.88.100-192.168.88.200
/ip/dhcp-server/add address-pool=dhcp_pool interface=bridge name=dhcp1
/ip/dhcp-server/network/add address=192.168.88.0/24 gateway=192.168.88.1 dns-server=192.168.88.1
```

## 检查

WinBox：`IP → DHCP Server → Leases`

```routeros
/ip/dhcp-server/lease/print
```

## 常见问题

电脑要插在桥端口上。

