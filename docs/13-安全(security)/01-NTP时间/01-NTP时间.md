# NTP时间

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[NTP](https://help.mikrotik.com/docs/spaces/ROS/pages/328184/NTP)

## 目的

证书和日志需要正确时间。

## 网络

- 示例 LAN：`192.168.88.1/24`，接口 `bridge`（改成你的口）
- WAN 示例口：`ether1`
- 密码示例：`********`（填你自己的）

## 第1步：NTP Client

WinBox：`System → NTP Client`

Enabled，Server `ntp.aliyun.com` 或你能访问的 NTP。

![第1步](images/01-ntp.png)

```routeros
/system/ntp/client/set enabled=yes servers=time.windows.com
```

## 检查

WinBox：`System → Clock`

```routeros
/system/clock/print
```

## 常见问题

时区设 Asia/Shanghai。

