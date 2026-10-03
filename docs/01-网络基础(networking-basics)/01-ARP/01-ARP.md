# ARP

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[ARP](https://help.mikrotik.com/docs/spaces/ROS/pages/328083/ARP)

## 目的

看局域网谁在用。

## 网络

- 示例 LAN：`192.168.88.1/24`，接口 `bridge`（改成你的口）
- WAN 示例口：`ether1`
- 密码示例：`********`（填你自己的）

## 第1步：打开 ARP

WinBox：`IP → ARP`

看 Address 和 Interface。

![第1步](images/01-ARP.png)

```routeros
/ip/arp/print
```

## 检查

WinBox：`IP → ARP`

```routeros
/ip/arp/print
```

## 常见问题

图中 MAC 请自行对照，教程示例用 `00:11:22:33:44:55`。

