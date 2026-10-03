# Lab 03 - 家庭拨号

目标：

- 确认 WAN 口不在 LAN 网桥里
- 建立 `pppoe-out1`
- 看到 connected 和本端地址（截图须脱敏）
- 明白出接口是 `pppoe-out1` 不是 `ether1`
- 配合 NAT，让 LAN 共享上网

Topology:

```
PC -- bridge/LAN [R1] ether1 -- 光猫 -- 运营商
                    pppoe-out1
```

实验环境：

RouterOS 7.x · 运营商提供 **用户名 + 密码**（不是 DHCP 自动拿地址时）

完整逐步对照（命令行 + WinBox 截图）在：

**[PPPoE 拨号上网](<../../cookbook/00-home/pppoe-dial.md>)**

请把课文里的 `ISP_USER` / `ISP_PASS` / `ether1` 换成你的值。不要把真实账号、公网 IP、MAC 提交进仓库。

学习内容：

1. 确认 ether1 独立且 Running  
2. 添加 PPPoE Client  
3. monitor 看 connected  
4. 查默认路由  
5. DNS allow-remote-requests（按课文，避免开放解析器）  
6. masquerade 出接口用 `pppoe-out1`  
7. ping 公网 IP 与域名，区分路由问题和 DNS 问题

前置：[Lab 00](<../00-环境准备(getting-started)/README.md>)、[Lab 01](<../01-第一台路由器(first-router)/README.md>)。NAT 细节见 [Lab 04](<../04-NAT(nat)/README.md>)。
