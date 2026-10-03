# SSH

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[SSH](https://help.mikrotik.com/docs/spaces/ROS/pages/24805387/SSH)

## 目的

命令行管理用 SSH。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的）
- 身份示例：`R1`

## 第1步：确认 SSH 服务

WinBox：`IP → Services`

动作：ssh=22 启用；限制来源网段。

![第1步](images/01-ssh.png)

```routeros
/ip/service/print where name=ssh
```

## 检查

WinBox：本机可 ssh 登录管理地址

```routeros
/ip/service/print where name=ssh
```

## 常见问题

生产建议密钥登录。
