# 查看CPU内存

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[First Time Configuration](https://help.mikrotik.com/docs/spaces/ROS/pages/328151/First+Time+Configuration)

## 目的

CPU 长期 100% 要减规则或关 Torch。

## 网络

- 示例 LAN：`192.168.88.1/24`，接口 `bridge`（改成你的口）
- WAN 示例口：`ether1`
- 密码示例：`********`（填你自己的）

## 第1步：Resources

WinBox：`System → Resources`

看 CPU、Memory。

![第1步](images/01-cpu.png)

```routeros
/system/resource/print
```

## 检查

WinBox：`System → Resources`

```routeros
/system/resource/print
```

## 常见问题

FastTrack 能降低 CPU（防火墙课之后）。

