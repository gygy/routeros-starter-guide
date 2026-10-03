# WAN拨号 PPPoE

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[PPPoE](https://help.mikrotik.com/docs/spaces/ROS/pages/2031625/PPPoE)

## 目的

运营商给账号密码时，用 PPPoE 上网。

## 网络

- WAN 口：`ether1`（不要在桥里）
- 账号：`ISP_USER` 密码：`ISP_PASS`（换成运营商给你的）
- 完整截图步骤也可看 cookbook/00-home/pppoe-dial.md

## 第1步：加 PPPoE 客户端

WinBox：`PPP → PPPoE Client → +`

Name：`pppoe-out1`；Interface：`ether1`；User/Password 填运营商账号；OK。

![第1步](images/01-PPPoE.png)

```routeros
/interface/pppoe-client/add name=pppoe-out1 interface=ether1 user=ISP_USER password=ISP_PASS add-default-route=yes use-peer-dns=yes disabled=no
```

## 检查

WinBox：`PPP → PPPoE Client`

```routeros
/interface/pppoe-client/monitor pppoe-out1
```

## 常见问题

出接口是 `pppoe-out1` 不是 ether1。NAT 见下一课。

