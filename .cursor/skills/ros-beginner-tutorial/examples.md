# 成品示例（短）

用户：「手机用 IKEv2 连回 RouterOS」

落盘：**一份** `docs/07-VPN(vpn)/11-IKEv2回家/第 34 章：让手机用 IKEv2 连回家里 RouterOS.md`  
课文题目：`# 第 34 章：让手机用 IKEv2 连回家里 RouterOS`（文件名与 H1 相同）  
必须含：证书、池、IPsec、防火墙、导出、手机导入与配置、Windows 配置、测试。  
禁止再写 `06-IKEv2证书`、`07-IKEv2手机` 这种半成品。

---

用户：「家里电脑自动拿地址」

课文题目：`# 第 9 章：让家里电脑自动拿到地址`  
落盘：`docs/03-DHCP与DNS(dhcp-dns)/01-DHCP服务器/第 9 章：让家里电脑自动拿到地址.md`（同一课写 DNS）  
图必须是 901 上真机 WinBox，不是 AI 图。网段未指定时用 `192.168.88.0/24`。

---
# 第 9 章：让家里电脑自动拿到地址

> 适用版本：RouterOS 7.x

## 目的

内网电脑自动拿到地址。

## 网络

- 路由：`192.168.88.1`
- 网段：`192.168.88.0/24`
- 地址池：`192.168.88.100-192.168.88.200`
- 接口：`bridge`（改成你的 LAN 口）

## 第1步：打开 DHCP Server

WinBox：`IP → DHCP Server`

![第1步](images/01-打开DHCP.png)

```routeros
/ip/dhcp-server/print
```

## 第2步：DHCP Setup

点 `DHCP Setup`。接口选 `bridge`，Next。网段填 `192.168.88.0/24`。池填 `192.168.88.100-192.168.88.200`。网关和 DNS 填 `192.168.88.1`。点到结束。

![第2步](images/02-DHCP-Setup.png)

```routeros
/ip/pool/add name=dhcp_pool ranges=192.168.88.100-192.168.88.200
/ip/dhcp-server/add address-pool=dhcp_pool interface=bridge name=dhcp1
/ip/dhcp-server/network/add address=192.168.88.0/24 gateway=192.168.88.1 dns-server=192.168.88.1
```

（向导一步完成时，命令可写在最后一步；拆开的每步只写该步对应的那几条。）

## 检查

WinBox：`IP → DHCP Server → Leases`

```routeros
/ip/dhcp-server/print
/ip/dhcp-server/lease/print
```

电脑自动获取后应能 ping `192.168.88.1`。

## 常见问题

没地址：看 DHCP 是否绑在 `bridge`，电脑是否插在网桥口。

```routeros
/interface/bridge/port/print
```
