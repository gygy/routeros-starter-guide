# 第 1 章：让电脑装好 WinBox 并连上实验网

> 主线：**RouterOS v7**  
> 难度：Level 1 · 入门  
> 前置：一台电脑、网线；有路由器或能开 CHR 更好  
> 对应 Lab：[00-环境准备(getting-started)](<../../labs/00-环境准备(getting-started)/00-环境准备.md>)  
> 学习目标：能选环境、装 WinBox、连上默认管理地址，并知道下一步做 Lab 01

本页把 WinBox 和环境搭起来。

## 1. 是什么？

RouterOS 跑在 MikroTik 硬件上，也可以跑在 **CHR**（云/虚拟机里的 RouterOS）上。本教程默认 **v7**。

## 2. 为什么需要它？

没有管理通道，后面所有实验都做不了。家里常见坑是：网线插错口、电脑和路由器不在同一网段、WinBox 版本过旧。

## 3. 你需要准备什么

三选一即可：

| 环境 | 适合谁 | 注意 |
| --- | --- | --- |
| 家用板子（hAP、RB 等） | 想马上上网 | 先用默认配置，不要一上来 `/system reset` 到空白 |
| CHR 虚拟机 | 没有闲置真机 | 桥接或 Host-Only 网卡，保证你的 PC 能 ping 到 CHR |
| 空配置实验机 | 已熟悉默认包 | 要自己加地址，见 Lab 01 |

软件：

- **WinBox**：到 [MikroTik 下载页](https://mikrotik.com/download) 下 Windows 版（WinBox 3 或 4 均可，步骤以窗口标题为准）
- 浏览器可开 **WebFig**（`http://192.168.88.1`），但入门以 WinBox 为主
- 官方文档：[First Time Configuration](https://help.mikrotik.com/docs/spaces/ROS/pages/328151/First+Time+Configuration)

## 4. 默认包大概长什么样

很多出厂机：

- 管理地址：**`192.168.88.1/24`**（在 LAN 网桥上）
- 用户 **`admin`**；近年版本会要求**第一次登录立刻改口令**
- WAN 示例口常写 **`ether1`**；其余口在 **`bridge`** 里当 LAN
- 电脑设自动获取地址，或临时设 `192.168.88.10/24`、网关 `192.168.88.1`

口名以你机器上的为准，教程里的 `ether1` 只是示例。

## 5. 第一次连上（最短路径）

1. 电脑网线插到**不是 ether1 的口**（常见是 ether2 起的 LAN 口）。  
2. 电脑能 ping `192.168.88.1`。  
3. 打开 WinBox：Neighbors 里应能看到设备，或在 Connect To 填 `192.168.88.1`，用户 `admin`。  
4. 改掉默认口令。  
5. 看 `Interfaces`：哪个口 Running、哪个在 bridge 里。

做完这些，去 [Lab 00](<../../labs/00-环境准备(getting-started)/00-环境准备.md>) 打勾，再做 [Lab 01](<../../labs/01-第一台路由器(first-router)/01-第一台路由器.md>)。

## 6. 家庭拨号还是 DHCP 上网？

- 光猫/运营商给 **账号密码** → 做 [PPPoE 实验](<../../labs/03-PPPoE拨号(pppoe)/03-PPPoE拨号.md>)，步骤正文在 [家庭 PPPoE 课文](<../../cookbook/00-home/pppoe-dial.md>)。  
- 上联已经是 DHCP（再拨过的光猫、小区网）→ Lab 02 的 WAN 用 DHCP Client，不必强上 PPPoE。

无论哪种，LAN 电脑要上网，后面都要有 **NAT（masquerade）** 和基本 **防火墙**，见 Lab 04、Lab 05。

## 7. 常见错误

- 电脑插在 ether1（WAN）上，拿不到 `192.168.88.x`。  
- ether1 还在网桥里又去跑 PPPoE。  
- 把教程里的 `ISP_USER` 当成你自己的宽带账号。  
- 用网上来路不明的 `.rsc` 一键导入。`configs/00-baseline` 也要先读，接口名改成你的再导入。

## 8. 安全注意事项

- 管理口不要对公网开放 WinBox/WWW/API。

## 9. Lab

[00-环境准备](<../../labs/00-环境准备(getting-started)/00-环境准备.md>)

## 10. 延伸阅读

- [MikroTik Help · RouterOS](https://help.mikrotik.com/docs/spaces/ROS/overview)  
- [第 5 章：弄清地址、网关和 DNS 各管什么](<../01-网络基础(networking-basics)/第 5 章：弄清地址、网关和 DNS 各管什么.md>)
