# Access 端口

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[Bridge VLAN](https://help.mikrotik.com/docs/spaces/ROS/pages/18964487/Bridging+and+Switching)

## 目的

终端口只属一个 VLAN。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的）
- 身份示例：`R1`

## 第1步：设置 Access

WinBox：`Bridge → VLANs / Ports`

动作：端口 PVID=10，untagged 含该口。

![第1步](images/01-access.png)

```routeros
/interface/bridge/vlan/add bridge=bridge vlan-ids=10 untagged=ether3
```

## 检查

WinBox：终端拿对应网段地址

```routeros
/interface/bridge/vlan/print
```

## 常见问题

Access 口不要打 tag。
