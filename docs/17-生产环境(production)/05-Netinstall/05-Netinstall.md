# Netinstall

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[Netinstall](https://help.mikrotik.com/docs/spaces/ROS/pages/24819391/Netinstall)

## 目的

系统起不来时，用电脑上的 Netinstall 救砖。不在 WinBox 里做。

## 网络

- 示例 LAN：`192.168.88.1/24`，接口 `bridge`（改成你的口）
- WAN 示例口：`ether1`
- 密码示例：`********`（填你自己的）

## 第1步：读官方步骤

WinBox：`（本机 Netinstall 程序）`

按官网接网线进 Etherboot。本课不截 WinBox。

![第1步](images/01-netinstall.png)

```routeros
# 在电脑运行 Netinstall，不是 RouterOS 命令
```

## 检查

WinBox：`官网 Netinstall 页`

```routeros
/system/package/print
```

## 常见问题

接错口会失败。

