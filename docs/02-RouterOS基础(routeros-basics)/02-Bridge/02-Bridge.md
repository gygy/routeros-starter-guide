# Bridge

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[Bridge](https://help.mikrotik.com/docs/spaces/ROS/pages/328198/Bridge)

## 目的

建一个叫 bridge 的 LAN 桥。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`（改成你的口）
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的管理员密码）
- 身份示例：`R1`

## 第1步：新建 Bridge

WinBox：`Bridge → +`

动作：Name=bridge，Comment=lab-demo，OK。901 已实配。

![第1步](images/01-建桥.png)

```routeros
/interface/bridge/add name=bridge comment=lab-demo
```

## 第2步：加端口（可选）

WinBox：`Bridge → Ports → +`

动作：把 LAN 口（如 ether2）挂到 bridge。不要挂正在拨号的 WAN。

![第2步](images/02-端口.png)

```routeros
/interface/bridge/port/add bridge=bridge interface=ether2
```

## 检查

WinBox：Bridge 列表有 R 的 bridge

```routeros
/interface/bridge/print
```

## 常见问题

误把 WAN 加进桥会掉线。
