# 保护内网 Forward

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[Filter](https://help.mikrotik.com/docs/spaces/ROS/pages/328020/Filter)

## 目的

LAN 可以上网，WAN 不能随便进 LAN。

## 网络

- 示例 LAN：`192.168.88.1/24`，接口 `bridge`（改成你的口）
- WAN 示例口：`ether1`
- 密码示例：`********`（填你自己的）

## 第1步：允许回程

WinBox：`IP → Firewall → Filter Rules → +`

Chain `forward`，established,related，accept。

![第1步](images/01-fwd-est.png)

```routeros
/ip/firewall/filter/add chain=forward connection-state=established,related action=accept
```

## 第2步：允许 LAN 出去

WinBox：`同上 +`

Chain forward，In. Interface `bridge`，accept。

![第2步](images/02-fwd-lan.png)

```routeros
/ip/firewall/filter/add chain=forward in-interface=bridge action=accept
```

## 第3步：丢无效/其余

WinBox：`同上 +`

可加 invalid drop，再 forward drop。

![第3步](images/03-fwd-drop.png)

```routeros
/ip/firewall/filter/add chain=forward connection-state=invalid action=drop
/ip/firewall/filter/add chain=forward action=drop
```

## 检查

WinBox：`IP → Firewall → Filter Rules`

```routeros
/ip/firewall/filter/print where chain=forward
```

## 常见问题

端口转发要在 drop 前放行 dstnat 流量。

