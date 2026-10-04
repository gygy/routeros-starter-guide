# NTP 时间

> 适用版本：RouterOS 7.x



## 目的

时间不准证书/日志会乱。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`（改成你的口）
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的管理员密码）
- 身份示例：`R1`

## 第1步：打开 Clock

WinBox：`System → Clock`

动作：看当前时间与时区。

![图(1) 打开Clock](images/01-ntp.png)

```routeros
/system/clock/print
```

## 第2步：开 NTP client

WinBox：`System → NTP Client`

动作：Servers 填 pool.ntp.org（或运营商 NTP）。

![图(2) 开NTPclient](images/02-client.png)

```routeros
/system/ntp/client/set enabled=yes servers=pool.ntp.org
```

## 检查

WinBox：时间接近正确

```routeros
/system/clock/print
/system/ntp/client/print
```
