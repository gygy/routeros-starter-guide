# 第 2 章：让 WinBox 第一次连上 RouterOS 并改名改密

> 适用版本：RouterOS 7.x

## 目的

用 WinBox 登进路由器，改成 R1，并改掉管理员密码。还没有管理 IP 时，用 Neighbors 里的 **MAC** 连。

## 网络

- 电脑网线接到路由器 **LAN 口**（不要插 ether1 当 WAN 的口）
- 还没配 IP 时，Neighbors 里 IP 可能是 `0.0.0.0`，这是正常的
- 登录：`admin` / 你自己的密码（教程里写成 `********`）
- 图中的 MAC 是示例 `00:11:22:33:44:55`，选你列表里那一台

## 网络拓扑及原理图

电脑和路由器在同一二层，点邻居里的 MAC 就能进。

![图(1) 连接路由器](images/00-原理.png)

<p align="center">图(1) 连接路由器</p>

## 第1步：打开 WinBox

到 [MikroTik 下载页](https://mikrotik.com/download) 下 WinBox（3 或 4 均可），双击运行。

点 **Neighbors**。

![图(2) 打开WinBox](images/01-Neighbors.png)

<p align="center">图(2) 打开WinBox</p>


无设备命令。本机还没进路由器。

## 第2步：用 MAC 连接

WinBox：

1. 在 Neighbors 里点该设备的 **MAC Address**（IP 是 `0.0.0.0` 时不要点 IP）
2. `Login` 填 `admin`
3. `Password` 填你自己的密码；新机可能是空密码，第一次进去会要求改密
4. 点 **Connect**

进得去后，左边出现 `Interfaces`、`IP`、`System` 等菜单。

![图(3) 用MAC连接](images/02-已经连上.png)

<p align="center">图(3) 用MAC连接</p>


```routeros
/system/resource/print
/interface/print
```

## 第3步：改成 R1

WinBox：`System → Identity`

动作：Name 填 `R1`，Apply/OK。

```routeros
/system/identity/set name=R1
```

## 第4步：改管理员密码

WinBox：`System → Users → admin`

动作：Password 填你自己的新密码（教程里写成 `********`），OK。新机若是空密码，第一次进去也会要求改。

```routeros
/user/set [find name=admin] password=********
```

## 检查

WinBox 标题栏类似 `admin@R1`。左侧能点开 `Interfaces`。能用新密码重登。

```routeros
/system/identity/print
/user/print
```
