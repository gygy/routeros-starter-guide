# ARP

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[ARP](https://help.mikrotik.com/docs/spaces/ROS/pages/159903761/ARP)

## 目的

看 IP 与 MAC 对应。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`（改成你的口）
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的管理员密码）
- 身份示例：`R1`

## 第1步：打开 ARP

WinBox：`IP → ARP`

动作：查看 IP Address / MAC Address / Interface。

![第1步](images/01-ARP.png)

```routeros
/ip/arp/print
```

## 第2步：刷新观察

WinBox：`IP → ARP`

动作：内网通信后会出现动态条目。

![第2步](images/02-刷新.png)

```routeros
/ip/arp/print where dynamic
```

## 检查

WinBox：能看到邻居或为空（刚开机）

```routeros
/ip/arp/print
```

## 常见问题

动态条目会随通信出现。
