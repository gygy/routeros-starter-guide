# ARP

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[ARP](https://help.mikrotik.com/docs/spaces/ROS/pages/24805444/ARP)

## 目的

查 IP 与 MAC 对应。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`（改成你的口）
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的管理员密码）
- 身份示例：`R1`

## 第1步：打开 ARP

WinBox：`IP → ARP`

动作：看 Address / MAC Address / Interface。

![第1步](images/01-ARP.png)

```routeros
/ip/arp/print
```

## 检查

WinBox：IP → ARP

```routeros
/ip/arp/print
```

## 常见问题

长期 Incomplete 查线或网段。
