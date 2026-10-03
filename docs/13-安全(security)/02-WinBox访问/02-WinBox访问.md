# WinBox 访问

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[Services](https://help.mikrotik.com/docs/spaces/ROS/pages/328129/WinBox)

## 目的

限制 WinBox 服务。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`（改成你的口）
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的管理员密码）
- 身份示例：`R1`

## 第1步：打开 Services

WinBox：`IP → Services`

动作：找到 winbox。

![第1步](images/01-winbox服务.png)

```routeros
/ip/service/print where name=winbox
```

## 第2步：限制网段

WinBox：`IP → Services → winbox`

动作：Available From 填 192.168.88.0/24（示例）。

![第2步](images/02-限制.png)

```routeros
/ip/service/set winbox address=192.168.88.0/24
```

## 检查

WinBox：仅可信网段可连

```routeros
/ip/service/print where name=winbox
```

## 常见问题

改前保证自己还在可信网段。
