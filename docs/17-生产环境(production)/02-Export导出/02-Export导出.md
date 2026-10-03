# Export导出

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[SSH](https://help.mikrotik.com/docs/spaces/ROS/pages/328166/SSH)

## 目的

`/export` 得到可读脚本。

## 网络

- 示例 LAN：`192.168.88.1/24`，接口 `bridge`（改成你的口）
- WAN 示例口：`ether1`
- 密码示例：`********`（填你自己的）

## 第1步：Export

WinBox：`New Terminal`

执行 export。

![第1步](images/01-exp.png)

```routeros
/export file=r1-export compact
```

## 检查

WinBox：`Files`

```routeros
/file/print where name~"export"
```

## 常见问题

含密码，别发网盘公开。

