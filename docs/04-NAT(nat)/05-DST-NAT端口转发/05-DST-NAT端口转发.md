# DST-NAT 端口转发

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[NAT](https://help.mikrotik.com/docs/spaces/ROS/pages/3211299/NAT)

## 目的

外网访问内网某台机的端口。

## 网络

- 示例 LAN：`192.168.88.1/24`，接口 `bridge`（改成你的口）
- WAN 示例口：`ether1`
- 密码示例：`********`（填你自己的）

## 第1步：加 dstnat

WinBox：`IP → Firewall → NAT → +`

Chain `dstnat`；Protocol tcp；Dst. Port `80`；In. Interface 填 WAN；Action `dst-nat`；To Addresses 内网 IP；To Ports `80`。

![第1步](images/01-dstnat.png)

```routeros
/ip/firewall/nat/add chain=dstnat protocol=tcp dst-port=80 in-interface=pppoe-out1 action=dst-nat to-addresses=192.168.88.10 to-ports=80
```

## 检查

WinBox：`IP → Firewall → NAT`

```routeros
/ip/firewall/nat/print
```

## 常见问题

同时要放行 forward。家里没公网时转发无效。

