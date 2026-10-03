# 成品结构示例

用户：「写一课 RouterOS 新手教程：给网桥添加 LAN 地址」

交付：`docs/tutorials/ros-add-bridge-address.md` + 每步两张图。

---

# 给网桥添加 LAN 地址

> 官方依据（RouterOS 7）：[IP Addressing](https://help.mikrotik.com/docs/spaces/ROS/pages/328068/IP+Addressing)  
> 对照环境：Winbox 3 · New Terminal  
> 假设：已有网桥 `bridge`，LAN 用官方默认网段 `192.168.88.0/24`（按你的环境改）。

## 本课会做到

让 `bridge` 拥有 `192.168.88.1/24`，电脑连 LAN 后能访问路由器这个地址。

## 步骤 1：确认网桥存在

**官方依据：** [Bridge](https://help.mikrotik.com/docs/spaces/ROS/pages/328081/Bridging+and+Switching)

**这一步要完成：** 列表里能看到名为 `bridge` 的接口。

**命令行**

```routeros
/interface/bridge/print
```

![步骤1 命令行](images/add-bridge-address-s1-cli.png)

**Winbox**

路径：`Bridge` → 主表

看 `Name` 列是否有 `bridge`。没有则不要继续加地址，先做网桥课。

![步骤1 Winbox](images/add-bridge-address-s1-winbox.png)

**怎么确认成功：** `print` 至少一行，`NAME` 为 `bridge`。  
**常见失败：** 接口实际叫 `bridge1`，后面地址加错口。

## 步骤 2：添加地址

**官方依据：** [IP Addressing](https://help.mikrotik.com/docs/spaces/ROS/pages/328068/IP+Addressing)

**这一步要完成：** `bridge` 上出现 `192.168.88.1/24`。

**命令行**

```routeros
/ip/address/add address=192.168.88.1/24 interface=bridge comment=LAN
/ip/address/print
```

![步骤2 命令行](images/add-bridge-address-s2-cli.png)

**Winbox**

路径：`IP` → `Addresses` → 工具栏 `+`

- `Address`：`192.168.88.1/24`
- `Interface`：`bridge`
- `Comment`：`LAN`
- 点 `OK`

![步骤2 Winbox](images/add-bridge-address-s2-winbox.png)

**怎么确认成功：** 表格出现该行，`Network` 一般为 `192.168.88.0`。  
**常见失败：** `Interface` 选成 `ether1`（WAN）；只填 `192.168.88.1` 忘了 `/24`。

## 本课命令合集

```routeros
/interface/bridge/print
/ip/address/add address=192.168.88.1/24 interface=bridge comment=LAN
/ip/address/print
```

## 官方链接

- IP Addressing
- Bridging and Switching
