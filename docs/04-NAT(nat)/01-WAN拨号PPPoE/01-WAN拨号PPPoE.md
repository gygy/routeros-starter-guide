# WAN 拨号 PPPoE

> 适用版本：RouterOS 7.x



## 目的

运营商拨号上网。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`（改成你的口）
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的管理员密码）
- 身份示例：`R1`
- 账号密码填你自己的，文档只写占位


## 第1步：打开 PPP

WinBox：`PPP → Interface`

动作：看是否已有 pppoe-out1。账号密码填你自己的，勿写入教程。

![图(1) 打开PPP](images/01-PPPoE.png)

```routeros
/interface/pppoe-client/print
```

## 第2步：确认拿址

WinBox：`IP → Addresses`

动作：pppoe-out1 上有动态地址。

![图(2) 确认拿址](images/02-地址.png)

```routeros
/ip/address/print where interface=pppoe-out1
```

## 检查

WinBox：pppoe-out1 Running 且有地址

```routeros
/interface/pppoe-client/print
/ip/address/print where dynamic
```
