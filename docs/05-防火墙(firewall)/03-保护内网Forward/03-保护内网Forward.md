# 保护内网 Forward

> 适用版本：RouterOS 7.x

## 目的

控制转发流量。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`（改成你的口）
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的管理员密码）
- 身份示例：`R1`

## 先看懂

只允许「家里出去」和「已经聊上的回话」，WAN 主动进 LAN 默认丢。

![图(0) 保护Forward](images/00-原理.svg)

<p align="center">图(0) 保护Forward</p>

## 第1步：放行 established

WinBox：`IP → Firewall → Filter Rules`

动作：Chain=forward，Action=accept，Comment=lab-fwd-est。

![图(1) 放行established](images/01-fwd-est.png)

<p align="center">图(1) 放行established</p>


```routeros
/ip/firewall/filter/add chain=forward action=accept comment=lab-fwd-est
```

## 第2步：丢弃 invalid

WinBox：`IP → Firewall → Filter Rules`

动作：Chain=forward，Action=drop，Comment=lab-fwd-inv。

![图(2) 丢弃invalid](images/02-fwd-lan.png)

<p align="center">图(2) 丢弃invalid</p>


```routeros
/ip/firewall/filter/add chain=forward action=drop comment=lab-fwd-inv
```

## 第3步：核对列表

WinBox：`IP → Firewall → Filter Rules`

动作：确认 forward 规则顺序。

![图(3) 核对列表](images/03-fwd-drop.png)

<p align="center">图(3) 核对列表</p>


```routeros
/ip/firewall/filter/print where chain=forward
```

## 检查

WinBox：forward 有 lab-fwd-*

```routeros
/ip/firewall/filter/print where chain=forward
```
