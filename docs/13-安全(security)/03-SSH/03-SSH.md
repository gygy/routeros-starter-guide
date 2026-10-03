# SSH

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[SSH](https://help.mikrotik.com/docs/spaces/ROS/pages/328166/SSH)

## 目的

命令行远程。

## 网络

- 示例 LAN：`192.168.88.1/24`，接口 `bridge`（改成你的口）
- WAN 示例口：`ether1`
- 密码示例：`********`（填你自己的）

## 第1步：开 SSH

WinBox：`IP → Services 双击 ssh`

端口 22，Available From 仅 LAN。

![第1步](images/01-ssh.png)

```routeros
/ip/service/set ssh address=192.168.88.0/24
```

## 检查

WinBox：`IP → Services`

```routeros
/ip/service/print
```

## 常见问题

能 SSH 后可用密钥登录（进阶）。

