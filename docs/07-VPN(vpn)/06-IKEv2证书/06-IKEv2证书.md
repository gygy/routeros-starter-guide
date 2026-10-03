# IKEv2证书

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[Certificates](https://help.mikrotik.com/docs/spaces/ROS/pages/40992867/Certificates)

## 目的

做 CA 和服务器证。

## 网络

- 示例 LAN：`192.168.88.1/24`，接口 `bridge`（改成你的口）
- WAN 示例口：`ether1`
- 密码示例：`********`（填你自己的）

## 第1步：Certificates

WinBox：`System → Certificates`

按官方 IPsec 文档生成 CA、server 证并 Sign。

![第1步](images/01-证书.png)

```routeros
/certificate/print
```

## 检查

WinBox：`System → Certificates`

```routeros
/certificate/print
```

## 常见问题

证书名不要用个人姓名。

