# DST-NAT 端口转发

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[NAT](https://help.mikrotik.com/docs/spaces/ROS/pages/8978531/NAT)

## 目的

把公网端口转到内网主机。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`（改成你的口）
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的管理员密码）
- 身份示例：`R1`

## 第1步：添加 dstnat

WinBox：`IP → Firewall → NAT → +`

动作：Chain=dstnat，tcp/8080，In.Interface=pppoe-out1，Action=dst-nat，To=192.168.88.10:80，Comment=lab-portfwd。901 已实配。

![第1步](images/01-dstnat.png)

```routeros
/ip/firewall/nat/add chain=dstnat protocol=tcp dst-port=8080 in-interface=pppoe-out1 action=dst-nat to-addresses=192.168.88.10 to-ports=80 comment=lab-portfwd
```

## 检查

WinBox：规则存在且计数可增

```routeros
/ip/firewall/nat/print where comment=lab-portfwd
```

## 常见问题

Filter 也要放行对应端口。
