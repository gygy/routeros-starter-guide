# 文章标题（实战课文模板）

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[页面标题](https://help.mikrotik.com/docs/spaces/ROS/overview)

**实战课文只用下面 7 块**，不要写成参数百科（不要「是什么 / Packet Flow / 企业案例」长文）。  
配图：每步一张 WinBox 截图，放在本课目录的 `images/`。脱敏与水印见 `CONTRIBUTING.md`。

## 目的

一句话：做完后设备上出现什么结果。

## 网络

- 路由器：`192.168.88.1`
- 内网：`192.168.88.0/24`
- 接口：`ether1` = WAN，`bridge` = LAN（改成你的口名）

---

## 第1步：…

WinBox：

`菜单 → 窗口`

点击 / 填写：

- `字段`：`值`

![第1步](images/01-….png)

---

## 第2步：…

（一步一个动作，一张图。需要几步就写几步。）

---

## 对应命令

```routeros
/ip/address/add address=192.168.88.1/24 interface=bridge
```

须与上面 WinBox 字段一致。

---

## 检查

WinBox：`IP → Addresses`

```routeros
/ip/address/print
```

## 测试

```routeros
/ping 192.168.88.1
```

---

## 常见问题

### 失败时看什么

```routeros
/interface/print
```
