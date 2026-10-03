# Ping

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[Tools](https://help.mikrotik.com/docs/spaces/ROS/pages/24952854/Tools)

## 目的

测连通。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`（改成你的口）
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的管理员密码）
- 身份示例：`R1`

## 第1步：打开工具

WinBox：`Tools → Ping`

动作：按界面填写目标/接口后 Start；也可用右侧 CLI。

![第1步](images/01-ping.png)

```routeros
/ping 1.1.1.1 count=4
```

## 第2步：用终端核对

WinBox：`New Terminal`

动作：执行同名工具命令看结果。

![第2步](images/02-cli.png)

```routeros
/ping 1.1.1.1 count=4
```

## 检查

WinBox：有回复或有流量输出

```routeros
/ping 1.1.1.1 count=4
```

## 常见问题

先确认自己管理口别抓错。
