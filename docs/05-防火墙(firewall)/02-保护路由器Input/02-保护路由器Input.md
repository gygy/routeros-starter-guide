# 保护路由器 Input

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[Filter](https://help.mikrotik.com/docs/spaces/ROS/pages/328020/Filter)

## 目的

只让 LAN 管路由器。

## 网络

- 示例 LAN：`192.168.88.1/24`，接口 `bridge`（改成你的口）
- WAN 示例口：`ether1`
- 密码示例：`********`（填你自己的）

## 第1步：允许已建立

WinBox：`IP → Firewall → Filter Rules → +`

Chain `input`，Connection State：established,related，Action accept。

![第1步](images/01-established.png)

```routeros
/ip/firewall/filter/add chain=input connection-state=established,related action=accept
```

## 第2步：允许 ICMP

WinBox：`同上 +`

Chain input，Protocol icmp，accept。

![第2步](images/02-icmp.png)

```routeros
/ip/firewall/filter/add chain=input protocol=icmp action=accept
```

## 第3步：允许 LAN

WinBox：`同上 +`

Chain input，In. Interface `bridge`，accept。

![第3步](images/03-lan.png)

```routeros
/ip/firewall/filter/add chain=input in-interface=bridge action=accept
```

## 第4步：其余丢掉

WinBox：`同上 +`

Chain input，Action drop。放最后。

![第4步](images/04-drop.png)

```routeros
/ip/firewall/filter/add chain=input action=drop
```

## 检查

WinBox：`IP → Firewall → Filter Rules`

```routeros
/ip/firewall/filter/print
```

## 常见问题

drop 要在允许规则之后。先用 Safe Mode。

