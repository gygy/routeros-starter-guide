# Access端口

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[Bridging and Switching](https://help.mikrotik.com/docs/spaces/ROS/pages/328081/Bridging+and+Switching)

## 目的

电脑口只属于一个 VLAN。

## 网络

- 示例 LAN：`192.168.88.1/24`，接口 `bridge`（改成你的口）
- WAN 示例口：`ether1`
- 密码示例：`********`（填你自己的）

## 第1步：设 PVID

WinBox：`Bridge → Ports 双击口`

PVID 填 `10`，Frame Types 可选 admit only untagged。

![第1步](images/01-access.png)

```routeros
/interface/bridge/port/set [find interface=ether4] pvid=10
```

## 检查

WinBox：`Bridge → Ports`

```routeros
/interface/bridge/port/print
```

## 常见问题

Access 口不要 tagged。

