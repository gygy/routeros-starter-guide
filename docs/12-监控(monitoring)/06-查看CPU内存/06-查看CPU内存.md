# 查看 CPU 内存

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[System Resource](https://help.mikrotik.com/docs/spaces/ROS/pages/328084/System+Resource)

## 目的

判断设备是否扛得住。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的）
- 身份示例：`R1`

## 第1步：Resources

WinBox：`System → Resources`

动作：看 CPU Load、Free Memory。

![第1步](images/01-cpu.png)

```routeros
/system/resource/print
```

## 检查

WinBox：CPU/内存正常

```routeros
/system/resource/print
```

## 常见问题

内存长期很低要减功能或升级硬件。
