# 第 N 课：让……

> 适用版本：RouterOS 7.x

## 目的

一句话。

## 网络

- `192.168.88.1` / `192.168.88.0/24`
- `ether1` = WAN，`bridge` = LAN

## 网络拓扑及原理图

一句话说明包怎么走。

![原理](images/00-原理.png)

<p align="center">图(1) 原理</p>

## 第1步：…

WinBox：`菜单 → 窗口`

点 / 填：

![步骤](images/01-….png)

<p align="center">图(2) 短说明</p>

```routeros
/ip/address/add address=192.168.88.1/24 interface=bridge
```

## 检查

WinBox：`IP → Addresses`

```routeros
/ip/address/print
```
