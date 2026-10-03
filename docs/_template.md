# 文章标题

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[页面标题](https://help.mikrotik.com/docs/spaces/ROS/overview)

只写步骤。每步：真机 WinBox 图 + 操作 + 本步命令。

## 目的

一句话。

## 网络

- `192.168.88.1` / `192.168.88.0/24`
- `ether1` = WAN，`bridge` = LAN

## 第1步：…

WinBox：`菜单 → 窗口`

点 / 填：

![第1步](images/01-….png)

```routeros
/ip/address/add address=192.168.88.1/24 interface=bridge
```

## 检查

WinBox：`IP → Addresses`

```routeros
/ip/address/print
```

## 常见问题

```routeros
/interface/print
```
