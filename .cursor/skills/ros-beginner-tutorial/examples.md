# 成品结构示例

用户：「写一课 RouterOS 实战：DHCP 服务器」

落盘：

```text
docs/03-DHCP与DNS(dhcp-dns)/04-DHCP服务器/04-DHCP服务器.md
docs/03-DHCP与DNS(dhcp-dns)/04-DHCP服务器/images/01-打开DHCP.png
…
```

（网段按用户指定；未指定时改用 `192.168.88.0/24`。）

---

# DHCP服务器

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[DHCP](https://help.mikrotik.com/docs/spaces/ROS/pages/24805500/DHCP)

## 目的

让内网电脑自动获取 IP 地址。

## 网络

- 路由器：`192.168.80.1`
- 内网：`192.168.80.0/24`
- DHCP 范围：`192.168.80.100-192.168.80.200`
- LAN 接口：`bridge`（改成你的接口名）

---

## 第1步：打开 DHCP Server

WinBox：

`IP → DHCP Server → DHCP`

![第1步](images/01-打开DHCP.png)

---

## 第2步：创建 DHCP

点击：

`DHCP Setup`

![第2步](images/02-DHCP-Setup.png)

---

## 第3步：选择接口

选择：

`bridge`

点击：

`Next`

![第3步](images/03-选择接口.png)

---

## 第4步：设置网段

填写：

```text
192.168.80.0/24
```

点击：

`Next`

![第4步](images/04-设置网段.png)

---

## 第5步：设置地址池

填写：

```text
192.168.80.100-192.168.80.200
```

点击：

`Next`

![第5步](images/05-地址池.png)

---

## 第6步：完成向导

点击：

`Next` → 直到结束 → `OK`

（网关、DNS 向导里填 `192.168.80.1`，与「网络」一致。）

![第6步](images/06-完成.png)

---

## 对应命令

```routeros
/ip/pool/add name=dhcp_pool ranges=192.168.80.100-192.168.80.200
/ip/dhcp-server/add address-pool=dhcp_pool interface=bridge name=dhcp1
/ip/dhcp-server/network/add address=192.168.80.0/24 gateway=192.168.80.1 dns-server=192.168.80.1
```

---

## 检查

WinBox：

`IP → DHCP Server → Leases`

电脑连上 LAN 后应看到租约地址。

命令：

```routeros
/ip/dhcp-server/print
/ip/dhcp-server/lease/print
```

## 测试

电脑设自动获取地址，应能 ping 通 `192.168.80.1`。

```routeros
/ping 192.168.80.1
```

---

## 常见问题

### 电脑没有获取 IP

```routeros
/ip/dhcp-server/print
/ip/dhcp-server/network/print
/ip/pool/print
/interface/bridge/port/print
```

确认 DHCP 绑的是 `bridge`，且电脑插在网桥端口上，而不是 WAN `ether1`。
