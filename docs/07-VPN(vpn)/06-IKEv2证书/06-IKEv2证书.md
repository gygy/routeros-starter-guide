# IKEv2 证书

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[Certificates](https://help.mikrotik.com/docs/spaces/ROS/pages/121012236/IPsec)

## 目的

证书用于 IKEv2 身份校验。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`（改成你的口）
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的管理员密码）
- 身份示例：`R1`

## 第1步：打开 Certificates

WinBox：`System → Certificates`

动作：查看已有证书列表。

![第1步](images/01-证书.png)

```routeros
/certificate/print
```

## 第2步：核对用途

WinBox：`System → Certificates`

动作：CA/服务器证书用途正确后再配 IPsec Identity。

![第2步](images/02-用途.png)

```routeros
/certificate/print detail
```

## 检查

WinBox：证书列表可读

```routeros
/certificate/print
```

## 常见问题

私钥勿导出到教程。
