# 文章标题

> 适用版本：RouterOS 7.x

只写步骤。每步：真机 WinBox 图 + 操作 + 本步命令。图注写在图片**下面一行**，居中，不要画进图里。

## 目的

一句话。

## 网络

- `192.168.88.1` / `192.168.88.0/24`
- `ether1` = WAN，`bridge` = LAN

## 先看懂

一句话说明包怎么走。需要拓扑的课配 `images/00-原理.svg`。

![原理](images/00-原理.svg)

<p align="center">图(0) 原理</p>

## 第1步：…

WinBox：`菜单 → 窗口`

点 / 填：

![步骤](images/01-….png)

<p align="center">图(1) 短说明</p>

```routeros
/ip/address/add address=192.168.88.1/24 interface=bridge
```

## 检查

WinBox：`IP → Addresses`

```routeros
/ip/address/print
```
