# WAN 拨号 PPPoE

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[PPPoE Client](https://help.mikrotik.com/docs/spaces/ROS/pages/55574532/PPPoE+Client)

## 目的

用运营商账号上网。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`（改成你的口）
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的管理员密码）
- 身份示例：`R1`

## 第1步：看 PPPoE 接口

WinBox：`PPP → Interface`

动作：有 pppoe-out1 且带 R 表示已拨上。账号写 ISP_USER / ISP_PASS。

![第1步](images/01-PPPoE.png)

```routeros
/interface/pppoe-client/print
```

## 检查

WinBox：pppoe-out1 Running

```routeros
/interface/pppoe-client/print
/ping 1.1.1.1 count=3
```

## 常见问题

逐步截图见 cookbook/00-home/pppoe-dial.md。
