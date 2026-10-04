# 升级 RouterOS

> 适用版本：RouterOS 7.x

## 目的

查看当前版本与软件包。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`（改成你的口）
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的管理员密码）
- 身份示例：`R1`

## 第1步：打开 Packages

WinBox：`System → Packages`

动作：看当前版本与已装包。

![图(1) 打开Packages](images/01-Packages.png)

```routeros
/system/package/print
```

## 第2步：核对版本

WinBox：`System → Resources`

动作：Version 与 Packages 一致。

![图(2) 核对版本](images/02-版本.png)

```routeros
/system/resource/print
```

## 检查

WinBox：版本号可读

```routeros
/system/package/print
/system/resource/print
```
