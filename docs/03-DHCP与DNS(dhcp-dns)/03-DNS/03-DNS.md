# DNS

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[DNS](https://help.mikrotik.com/docs/spaces/ROS/pages/37748767/DNS)

## 目的

路由器转发 DNS，电脑才能用域名上网。

## 网络

- 示例 LAN：`192.168.88.1/24`，接口 `bridge`（改成你的口）
- WAN 示例口：`ether1`
- 密码示例：`********`（填你自己的）

## 第1步：设 DNS

WinBox：`IP → DNS`

Servers 填上游（可先填 `1.1.1.1`）；勾选 Allow Remote Requests；OK。

![第1步](images/01-DNS.png)

```routeros
/ip/dns/set servers=1.1.1.1 allow-remote-requests=yes
```

## 检查

WinBox：`IP → DNS`

```routeros
/ip/dns/print
```

## 常见问题

不要把 DNS 对公网放开，只给 LAN 用。

