# Trunk 端口

> 适用版本：RouterOS 7.x



## 目的

上联口带多个 VLAN。

## 网络

- 示例 LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`（改成你的口）
- WAN 示例：`pppoe-out1` 或 `ether1`
- 密码示例：`********`（填你自己的管理员密码）
- 身份示例：`R1`

## 第1步：打开 Bridge VLANs

WinBox：`Bridge → VLANs`

动作：准备 tagged 上联口。

![图(1) 打开BridgeVLANs](images/01-trunk.png)

```routeros
/interface/bridge/vlan/print
```

## 第2步：设置 Trunk

WinBox：`Bridge → VLANs → +`

动作：vlan-ids=10,20，tagged=ether2（示例）。

![图(2) 设置Trunk](images/02-tagged.png)

```routeros
/interface/bridge/vlan/add bridge=bridge vlan-ids=10,20 tagged=ether2
```

## 检查

WinBox：对端交换机能通各 VLAN

```routeros
/interface/bridge/vlan/print
```
