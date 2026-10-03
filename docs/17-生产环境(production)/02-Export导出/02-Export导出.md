# Export 导出

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[Export](https://help.mikrotik.com/docs/spaces/ROS/pages/328182/Backup)

## 目的

文本配置便于 diff。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的）
- 身份示例：`R1`

## 第1步：导出

WinBox：`New Terminal`

动作：export file=demo-backup。

![第1步](images/01-exp.png)

```routeros
/export file=demo-backup
```

## 检查

WinBox：Files 有 .rsc

```routeros
/file/print where name~"demo-backup"
```

## 常见问题

外发前删掉密码行。
