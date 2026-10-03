# 官方文档、菜单对照与截图 Prompt

## 官方文档入口（RouterOS 7）

总览：<https://help.mikrotik.com/docs/spaces/ROS/overview>

按主题打开对应页（URL 以站点实际为准，写作前 `WebFetch` 核对）：

| 主题 | 检索关键词 |
|------|------------|
| 首次连接 / Winbox / MAC | First Time Configuration, Winbox, MAC server |
| 接口 / Bridge | Bridge, Interface |
| IP 地址 | IP Addressing |
| DHCP 客户端 / 服务 | DHCP Client, DHCP Server |
| DNS | DNS |
| 路由 | IP Routes, Default Route |
| NAT / masquerade | NAT, masquerade |
| 防火墙 Filter | Firewall Filter, ICMP, connection state |
| PPP / PPPoE | PPPoE Client |
| 无线 | Wireless, WiFi |
| VLAN | VLAN, Bridge VLAN Filtering |
| 用户 / 服务 | Users, Services, IP Services |
| 备份 | Backup, Export |

引用格式：页面标题 + 完整 URL。若文档区分 v6/v7，正文只写 v7。

## Winbox 3 常见路径 ↔ CLI

| 做什么 | Winbox 左侧 | CLI |
|--------|-------------|-----|
| 看接口 | `Interfaces` | `/interface/print` |
| 网桥 | `Bridge` | `/interface/bridge` |
| 地址 | `IP` → `Addresses` | `/ip/address` |
| DHCP 客户端 | `IP` → `DHCP Client` | `/ip/dhcp-client` |
| DHCP 服务 | `IP` → `DHCP Server` | `/ip/dhcp-server` |
| DNS | `IP` → `DNS` | `/ip/dns` |
| 路由 | `IP` → `Routes` | `/ip/route` |
| NAT | `IP` → `Firewall` → `NAT` | `/ip/firewall/nat` |
| Filter | `IP` → `Firewall` → `Filter Rules` | `/ip/firewall/filter` |
| 服务端口 | `IP` → `Services` | `/ip/service` |
| 用户 | `System` → `Users` | `/user` |
| 时钟 | `System` → `Clock` | `/system/clock` |
| 身份 | `System` → `Identity` | `/system/identity` |
| 备份 | `Files` + 菜单 `Backup` | `/system/backup/save` |
| 导出 | New Terminal | `/export` |
| 新终端 | 工具栏 `New Terminal` | （本窗口即 CLI） |

对话框按钮：添加用工具栏 `+`，保存用 `Apply`/`OK`，启用看 `Enable` 勾选或旗帜 `X`。

## CLI 截图 Prompt

`GenerateImage`，`aspect_ratio`: `16:9`，`filename`: `{slug}-s{N}-cli.png`。

```
Photorealistic screenshot of MikroTik Winbox 3 "New Terminal" window on Windows.
Black terminal background, Consolas or monospace green-white text.
Window title bar "New Terminal - {identity}" with typical Winbox dark chrome.
Prompt exactly: {prompt}
User typed command in bright white:
{command}
RouterOS 7 style output below in gray/green, including table headers if print:
{output}
No Windows Command Prompt, no bash $, no fake logos.
Sharp readable text, 16:9, like a real desktop screenshot, slight desktop blur around the window.
```

`{prompt}` 示例：`[admin@MikroTik] >` 或 `[admin@MikroTik] /ip/address>`。
`{output}` 必须像真的 `print`（Flags、Columns、行项目），不要 Lorem ipsum。

## Winbox 截图 Prompt

`GenerateImage`，`aspect_ratio`: `16:9`，`filename`: `{slug}-s{N}-winbox.png`。

```
Photorealistic screenshot of MikroTik Winbox 3 on Windows desktop.
Classic Winbox UI: dark gray title bar "Winbox ... {router-ip} (admin)",
left navigation tree with categories (Neighbors, Interfaces, Bridge, IP, Routing, System, ...).
Highlighted left-tree item: {tree-path}.
Right pane: {window-description} showing English labels.
Visible fields exactly: {fields-and-values}.
A red rectangle annotation highlighting {click-target} (the + button or Apply or a specific row).
Windows 10/11 desktop wallpaper faintly visible at edges.
Sharp UI text, 16:9, authentic Winbox 3 look (not Winbox 4 fluent, not webfig unless requested).
```

`{tree-path}` 示例：`IP > Addresses`。
`{fields-and-values}` 必须包含本步真实值（如 `Address=192.168.88.1/24`，`Interface=bridge`）。

## 真机截图（仅当用户要求）

- CLI：SSH 到设备执行命令后，用终端工具截图；或 Winbox New Terminal 截图。
- Winbox：本机已打开的 Winbox 窗口截图。
- 文件仍按 `{slug}-s{N}-cli.png` / `-winbox.png` 命名并写入教程 `images/`。

## 文风

- 称呼读者为「你」；术语中英并列一次（如「地址列表 Address List」）。
- 步骤标题用动词：添加、启用、检查、保存。
- 不写「众所周知」「轻松掌握」等空话。
