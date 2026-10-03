# Lab 00 - 环境准备

目标：

- 装好 WinBox
- 电脑能 ping 到路由器
- 用 WinBox 登录并改掉默认口令
- 分清哪个口是 WAN 示例口、哪个口在 LAN 网桥里

Topology:

```
PC ---- LAN口(如 ether2) [RouterOS] ether1 ---- （先空着或上联）
         192.168.88.0/24
```

实验环境：

RouterOS 7.x · WinBox 3 或 4

学习内容：

1. 对照 [环境准备](<../../docs/00-入门(introduction)/环境准备.md>) 选真机或 CHR
2. 下载 WinBox（仅官方站点）
3. 登录 `192.168.88.1`（或你的实际 LAN 地址）
4. 改 admin 口令（不要写进仓库、不要截进图）
5. `Interfaces` / `Bridge → Ports` 看一眼拓扑

验收：

- WinBox 已打开设备  
- 你知道 **不要把 ether1 当 LAN 插电脑**（若你用的是默认包思路）

下一步：[Lab 01 第一台路由器](<../01-第一台路由器(first-router)/README.md>)。家里要拨号则看 [PPPoE](<../02-PPPoE拨号(pppoe)/README.md>)。
