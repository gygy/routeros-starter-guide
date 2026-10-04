# 查看 CPU 内存

> 适用版本：RouterOS 7.x

## 目的

看负载。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`（改成你的口）
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的管理员密码）
- 身份示例：`R1`

## 第1步：打开 Resources

WinBox：`System → Resources`

动作：看 CPU、Memory、HDD。

![图(1) 打开Resources](images/01-cpu.png)

```routeros
/system/resource/print
```

## 第2步：对照接口流量

WinBox：`Interfaces`

动作：CPU 高时看哪个口在跑流量。

![图(2) 对照接口流量](images/02-接口.png)

```routeros
/interface/print stats
```

## 检查

WinBox：能读出 CPU/内存

```routeros
/system/resource/print
```
