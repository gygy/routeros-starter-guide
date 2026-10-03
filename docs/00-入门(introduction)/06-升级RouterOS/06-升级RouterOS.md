# 升级 RouterOS

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[Upgrading](https://help.mikrotik.com/docs/spaces/ROS/pages/18972686/Upgrading+and+installation)

## 目的

确认当前包版本，再决定是否升级。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`（改成你的口）
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的管理员密码）
- 身份示例：`R1`

## 第1步：查看 Packages

WinBox：`System → Packages`

动作：看 routeros 版本号。升级前先备份。

![第1步](images/01-Packages.png)

```routeros
/system/package/print
```

## 检查

WinBox：System → Packages

```routeros
/system/resource/print
```

## 常见问题

x86 Demo 许可功能有限；生产机选维护窗口升级。
