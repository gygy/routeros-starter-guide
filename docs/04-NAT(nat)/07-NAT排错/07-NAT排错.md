# NAT 排错

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[NAT](https://help.mikrotik.com/docs/spaces/ROS/pages/8978531/NAT)

## 目的

出网失败先查 NAT 计数和出接口。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`（改成你的口）
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的管理员密码）
- 身份示例：`R1`

## 第1步：看 NAT

WinBox：`IP → Firewall → NAT`

动作：看 Bytes 是否增长；核对 out-interface。

![第1步](images/01-计数.png)

```routeros
/ip/firewall/nat/print stats
```

## 检查

WinBox：masquerade 计数在涨

```routeros
/ip/firewall/nat/print stats
/ip/route/print where dst-address=0.0.0.0/0
```

## 常见问题

能 ping IP 不能开网页多半是 DNS。
