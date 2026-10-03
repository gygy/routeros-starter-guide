# Import恢复

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[Backup](https://help.mikrotik.com/docs/spaces/ROS/pages/40960324/Backup)

## 目的

二进制备份用 Restore；文本用 import。

## 网络

- 示例 LAN：`192.168.88.1/24`，接口 `bridge`（改成你的口）
- WAN 示例口：`ether1`
- 密码示例：`********`（填你自己的）

## 第1步：Restore

WinBox：`Files 选中 .backup → Restore`

路由器会重启。

![第1步](images/01-rst.png)

```routeros
/system/backup/load name=r1
```

## 检查

WinBox：`Files`

```routeros
/system/backup/load name=r1
```

## 常见问题

Restore 覆盖当前配置。先确认文件名。

