# 文章标题

> 适用版本：RouterOS 7.x

只写步骤。每步：真机 WinBox 图 + 操作 + 本步命令。图底居中标注 `图(N) 短说明`。

## 目的

一句话。

## 网络

- `192.168.88.1` / `192.168.88.0/24`
- `ether1` = WAN，`bridge` = LAN

## 第1步：…

WinBox：`菜单 → 窗口`

点 / 填：

![图(1) 短说明](images/01-….png)

```routeros
/ip/address/add address=192.168.88.1/24 interface=bridge
```

## 检查

WinBox：`IP → Addresses`

```routeros
/ip/address/print
```
