# DNS

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[DNS](https://help.mikrotik.com/docs/spaces/ROS/pages/377487806/DNS)

## 目的

路由器给内网做 DNS 转发。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`（改成你的口）
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的管理员密码）
- 身份示例：`R1`

## 第1步：设置 DNS

WinBox：`IP → DNS`

动作：Servers 加 1.1.1.1；勾选 Allow Remote Requests。901 已实配。

![第1步](images/01-DNS.png)

```routeros
/ip/dns/set servers=1.1.1.1 allow-remote-requests=yes
```

## 检查

WinBox：Allow Remote Requests=yes

```routeros
/ip/dns/print
```

## 常见问题

不要对公网开放 53。
