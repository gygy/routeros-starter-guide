# Bridge

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[Bridging and Switching](https://help.mikrotik.com/docs/spaces/ROS/pages/328081/Bridging+and+Switching)

## 目的

把几个 LAN 口绑成一个网桥。

## 网络

- 示例 LAN：`192.168.88.1/24`，接口 `bridge`（改成你的口）
- WAN 示例口：`ether1`
- 密码示例：`********`（填你自己的）

## 第1步：建桥

WinBox：`Bridge → Bridge → +`

Name 填 `bridge`，OK。

![第1步](images/01-建桥.png)

```routeros
/interface/bridge/add name=bridge
```

## 第2步：加端口

WinBox：`Bridge → Ports → +`

Interface 选 `ether2`，Bridge 选 `bridge`，OK。LAN 口都加进去，WAN 的 ether1 不要加。

![第2步](images/02-端口.png)

```routeros
/interface/bridge/port/add interface=ether2 bridge=bridge
```

## 检查

WinBox：`Bridge → Ports`

```routeros
/interface/bridge/port/print
```

## 常见问题

ether1 若当 WAN，不要放进桥。

