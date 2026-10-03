# 升级 RouterOS

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[Upgrading](https://help.mikrotik.com/docs/spaces/ROS/pages/328128/Upgrading)

## 目的

看当前版本；升级前先备份。

## 网络

- 示例 LAN：`192.168.88.1/24`，接口 `bridge`（改成你的口）
- WAN 示例口：`ether1`
- 密码示例：`********`（填你自己的）

## 第1步：看版本

WinBox：`System → Packages`

记下当前 version。需要升级时按官网文档下载再 Upload。

![第1步](images/01-Packages.png)

```routeros
/system/package/print
```

## 检查

WinBox：`System → Packages`

```routeros
/system/package/update/check-for-updates
```

## 常见问题

CHR 演示许可功能受限。升级前务必备份。

