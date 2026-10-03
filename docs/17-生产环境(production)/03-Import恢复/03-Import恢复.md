# Import 恢复

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[Import](https://help.mikrotik.com/docs/spaces/ROS/pages/328182/Backup)

## 目的

用 .rsc 或 .backup 恢复。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的）
- 身份示例：`R1`

## 第1步：Import / Restore

WinBox：`Files`

动作：选中文件 → Restore（backup）或 Terminal 里 /import。

![第1步](images/01-rst.png)

```routeros
/import file-name=demo-backup.rsc
```

## 检查

WinBox：关键配置回来

```routeros
/system/identity/print
```

## 常见问题

恢复前再备一份当前配置。
