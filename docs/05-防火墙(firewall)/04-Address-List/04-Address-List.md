# Address-List

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[Address Lists](https://help.mikrotik.com/docs/spaces/ROS/pages/62816262/Address+Lists)

## 目的

一组地址反复用。

## 网络

- 示例 LAN：`192.168.88.1/24`，接口 `bridge`（改成你的口）
- WAN 示例口：`ether1`
- 密码示例：`********`（填你自己的）

## 第1步：加列表

WinBox：`IP → Firewall → Address Lists → +`

Name：`LAN`，Address：`192.168.88.0/24`。

![第1步](images/01-alist.png)

```routeros
/ip/firewall/address-list/add list=LAN address=192.168.88.0/24
```

## 检查

WinBox：`IP → Firewall → Address Lists`

```routeros
/ip/firewall/address-list/print
```

## 常见问题

Filter 里 Src. Address List 选 LAN。

