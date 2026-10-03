# NTP 时间

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[NTP](https://help.mikrotik.com/docs/spaces/ROS/pages/328151/NTP)

## 目的

证书和日志都需要正确时间。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的）
- 身份示例：`R1`

## 第1步：开 NTP Client

WinBox：`System → NTP Client`

动作：Enabled=yes，Servers 加 1.1.1.1。901 已实配。

![第1步](images/01-ntp.png)

```routeros
/system/ntp/client/set enabled=yes
/system/ntp/client/servers/add address=1.1.1.1
```

## 检查

WinBox：System → Clock 时间接近正确

```routeros
/system/ntp/client/print
```

## 常见问题

时区也要设对。
