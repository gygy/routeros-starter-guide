# Address List

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[Address Lists](https://help.mikrotik.com/docs/spaces/ROS/pages/328122/Filter)

## 目的

把网段收进列表，规则更好维护。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`（改成你的口）
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的管理员密码）
- 身份示例：`R1`

## 第1步：添加列表

WinBox：`IP → Firewall → Address Lists → +`

动作：List=mgmt，Address=192.168.88.0/24。901 已实配。

![第1步](images/01-alist.png)

```routeros
/ip/firewall/address-list/add list=mgmt address=192.168.88.0/24 comment=lab
```

## 检查

WinBox：Address Lists 有 mgmt

```routeros
/ip/firewall/address-list/print
```

## 常见问题

规则里用 Address List 引用。
