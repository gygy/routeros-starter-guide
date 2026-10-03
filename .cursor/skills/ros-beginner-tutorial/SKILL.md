---
name: ros-beginner-tutorial
description: >-
  Generates MikroTik RouterOS beginner tutorials in Chinese, grounded in
  official help.mikrotik.com docs. Every operation step must include a CLI
  screenshot and a Winbox screenshot. Use when the user asks for RouterOS
  新手教程, Winbox 入门, ROS 命令行教程, MikroTik 操作步骤配图, or to write
  step-by-step ROS lessons with CLI and Winbox images.
---

# ROS 新手教程生成

为 MikroTik RouterOS **新手**写可跟着做的教程。默认 **RouterOS 7 + Winbox 3**，简体中文。

硬性要求：

1. 操作步骤必须对照 **官方帮助文档**（先查后写，禁止凭记忆编菜单名/参数）。
2. **每一个操作步骤**都必须同时有：**命令行截图** + **Winbox 截图**。缺一张即未完成。
3. 命令与 Winbox 路径必须指向同一结果，便于对照。

详细文档入口、菜单对照、截图 prompt 见 [reference.md](reference.md)。成品结构示例见 [examples.md](examples.md)。

## 何时使用

用户提到：RouterOS / ROS / MikroTik / Winbox 新手教程、入门、操作步骤、对照命令行和 Winbox、要配截图。

## 工作流程

```
- [ ] 1. 锁定主题、ROS 大版本（默认 7）、设备角色（家用网关/交换机）
- [ ] 2. WebSearch + WebFetch 官方文档；记下准确 URL
- [ ] 3. 拆成 5～12 个「可单独执行」的操作步骤
- [ ] 4. 每步写出 CLI + Winbox 路径，并与文档核对
- [ ] 5. 每步生成 CLI 截图 + Winbox 截图（见下方）
- [ ] 6. 组装 Markdown；每步嵌入两张图
- [ ] 7. 自检：每步两图、每步有官方链接、命令可复制
```

未指定主题时，按入门课默认顺序（可只写用户点名的一课）：

1. 首次登录（Winbox / MAC / IP、默认账号）
2. 身份与接口（bridge、ether、WAN）
3. IP 地址与 DHCP 客户端/服务
4. 默认路由与 DNS
5. NAT masquerade 上网
6. 防火墙入门（input / forward）
7. 无线或 VLAN（按主题选一）
8. 备份与安全（改密、禁服务、备份）

## 官方文档（必须先查）

主站：<https://help.mikrotik.com/docs/spaces/ROS/overview>

检索：`site:help.mikrotik.com/docs RouterOS 7 {主题}`。

用 `WebFetch` 打开具体页面，摘取：菜单路径、CLI 语法、默认行为、版本注意。Wiki（wiki.mikrotik.com）仅作补充，**正文引用以 help.mikrotik.com 为准**。

每课开头写：

```markdown
> 官方依据（RouterOS 7）：[页面标题](完整URL)
> 对照环境：Winbox 3 · 命令行 New Terminal / SSH
```

文档与常见菜单对照表见 [reference.md](reference.md)。

## 每一步的写法

固定结构，一步只做一件事：

```markdown
### 步骤 N：{动词 + 对象}

**官方依据：** [小节标题](URL#锚点)

**这一步要完成：** 一句话结果（例如：WAN 口拿到公网/拨号地址）。

**命令行**

在 Terminal 执行（可整段复制）：

\`\`\`routeros
{命令}
{建议紧跟的 print / 校验命令}
\`\`\`

![步骤N 命令行](images/{slug}-s{N}-cli.png)

**Winbox**

路径：`{左侧树} → {窗口} → {按钮/页签} → {字段}`

要点：要点哪个 `+` / `Apply` / `OK`，填哪些字段（中英对照）。

![步骤N Winbox](images/{slug}-s{N}-winbox.png)

**怎么确认成功：** 应看到的 `print` 输出或 Winbox 表格列。
**常见失败：** 1～2 条（接口名错、没点 Apply、缺默认路由）。
```

禁止：一步里堆多个互不相关的配置；只给命令不给 Winbox；Winbox 只写「如图」不写路径。

## 截图（每步两张，不可省）

用户要的是教程配图，**必须调用 `GenerateImage`**（每步 2 次）。不要用代码块代替截图。

保存约定：教程 Markdown 与 `images/` 同级；文件名 `{课题slug}-s{步骤号}-cli.png` / `-winbox.png`。`filename` 参数只用 basename（不含目录）。生成后把图片拷进教程的 `images/`，Markdown 用相对路径引用。

比例：CLI 用 `16:9`，Winbox 用 `16:9`。画面必须能读清文字（命令、菜单、字段值）。

完整 prompt 模板见 [reference.md](reference.md)。生成时把模板里的 `{占位符}` 换成**这一步真实命令/菜单/字段**，不要生成空白示例窗。

### CLI 图必须出现

- 黑底 RouterOS 终端（Winbox「New Terminal」风格）
- 提示符形如 `[admin@MikroTik] >` 或带路径 `[admin@MikroTik] /ip/address>`
- **完整命令** + **真实风格的输出**（`print` 表格、`Flags` 等）
- 不要 Windows CMD、不要 Linux bash 提示符

### Winbox 图必须出现

- Winbox 3：深色顶栏、左侧菜单树、右侧表格或对话框
- 左侧树高亮当前项（如 `IP` → `Addresses`）
- 右侧能看见本步关键字段（Interface、Address、勾选、`+` / `Apply` / `OK`）
- 红框或黄圈标出要点击的控件（每张图只强调 1～2 处）
- 界面文字以 **英文 Winbox** 为主（与官方一致），图下用中文说明

若用户明确要求「真机截图」且本机/远程已开 Winbox 或 SSH：优先实机截取，不再用生成图充数。未提供真机时用上述生成图。

## 命令规范

- 用 RouterOS 7 **路径式** CLI：`/ip/address/add ...`，可同时给等效短命令。
- 示例接口名用 `ether1`（WAN）、`bridge`（LAN），文中声明「请改成你的接口名」。
- 示例网段用 `192.168.88.0/24`（官方默认），或用户指定的网段。
- 危险操作（清配置、重置、drop all）必须单独成步，并写恢复方法。
- 不编造不存在的菜单（先查文档）。

## 交付物

教程仓库（任意工作区都写这里，不要写进 `ros-sentinel`）：

`G:\gitea\RouterOS入门与精通\`

- 课文：`{slug}.md`（可带 `ros-` 前缀，如 `ros-pppoe-dial.md`）
- 配图：`images/{slug}-s{N}-cli.png` 与 `images/{slug}-s{N}-winbox.png`
- 新课写入 `README.md` 目录表

写完后在该仓库执行 `scripts\git-sync.ps1`（Gitea；GitHub 远程建好后会一并推）。

不要在对话里只丢命令；教程正文才是交付物。生成图不要在聊天里用 Markdown 再贴一遍原图（客户端会显示）；**教程文件里必须引用图片路径**。

本技能装在用户级 `~/.cursor/skills/ros-beginner-tutorial`，任意 Cursor 工作区可用 `/ros-beginner-tutorial`。

## 自检

- [ ] 每个操作步骤都有 CLI 图和 Winbox 图
- [ ] 每步有 help.mikrotik.com 链接
- [ ] Winbox 路径与 CLI 等价
- [ ] 有成功校验和常见失败
- [ ] 未把 Wiki 当作唯一依据
- [ ] 未跳过截图「以后再补」
