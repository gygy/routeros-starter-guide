# Traceroute

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[Tools](https://help.mikrotik.com/docs/spaces/ROS/pages/24952854/Tools)

## 目的

看路径。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`（改成你的口）
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的管理员密码）
- 身份示例：`R1`

## 第1步：打开 Traceroute

WinBox：`Tools → Traceroute`

动作：Address 填目标后 Start。

![第1步](images/01-tr.png)

```routeros
/tool/traceroute 1.1.1.1
```

## 第2步：终端核对

WinBox：`New Terminal`

动作：执行 traceroute。

![第2步](images/02-cli.png)

```routeros
/tool/traceroute 1.1.1.1
```

## 检查

WinBox：能看到跳数

```routeros
/tool/traceroute 1.1.1.1
```

## 常见问题

超时跳用 * 表示。
