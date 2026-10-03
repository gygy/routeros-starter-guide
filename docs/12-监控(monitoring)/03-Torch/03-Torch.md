# Torch

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[Torch](https://help.mikrotik.com/docs/spaces/ROS/pages/328151/Torch)

## 目的

实时看谁在占带宽。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的）
- 身份示例：`R1`

## 第1步：打开 Torch

WinBox：`Tools → Torch`

动作：Interface 选 bridge 或 WAN，Start。

![第1步](images/01-torch.png)

```routeros
/tool/torch interface=bridge
```

## 检查

WinBox：能看到会话

```routeros
/tool/torch interface=bridge
```

## 常见问题

短时用，别长期开。
