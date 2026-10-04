---
name: ros-beginner-tutorial
description: >-
  为 MikroTik RouterOS 写简短实战课文（简体中文，v7）。输出到课程仓。
  每步：真机 WinBox 截图 → 操作 → 本步 CLI → 验证。禁止 AI 假 WinBox；原理/网络图走 network-v1-diagram 与 packet-flow-diagram。禁止把实验机密码写入教程。
  Use when RouterOS/WinBox 新手教程、实战配置、操作配图, or /ros-beginner-tutorial.
---

# RouterOS 实战配置教程

写 **短、直说步骤、照着就能配完** 的课文。不是参数百科。

**站在用户角度：一个完整功能及配置过程 = 一份教程。**  
例如「手机回家走 IKEv2」从证书、池、Peer、防火墙到客户端导入，写在同一课里；不要拆成「只开窗口」「只加证书」的半成品。

默认：**RouterOS 7.x** + **WinBox 3**（界面英文，说明中文）。  
结构固定：**WinBox 截图 → 操作 → 本步命令 → 验证**。依据：[WinBox](https://help.mikrotik.com/docs/spaces/ROS/pages/328129/WinBox)。

## 输出目录

只写到：`G:\gitea\RouterOS入门与精通\`  
一课一个子目录，见 [reference.md](reference.md)。禁止仓库根再建 `RouterOS教程/`。

## 实验机（只给 Agent 连，禁止写入教程）

连接信息只读本机 **`lab-env.local.md`**（与本技能同目录，已 gitignore）。没有该文件则先按 `lab-env.example.md` 复制再填。

- 环境：PVE 上的 x86 虚拟机 **VMID 901**（RouterOS x86）
- 无管理 IP 时：WinBox **Neighbors → 点 MAC** 连接（真实 MAC 只写 `lab-env.local.md`，教程用 `00:11:22:33:44:55`）
- 本机可用 WinBox 3 或 WinBox 4；课文写 WinBox，截图以真机为准
- 教程里登录账号写 `admin`；**真实密码、真实管理 IP、个人昵称一律不准出现在 md / 图 / .rsc**
- 教程密码位只写 `********`，并写「填你自己的管理员密码」
- 登录类截图：密码框必须是空的或圆点，不得露出明文

终端：用 SSH/`New Terminal` 对 **901** 执行本步命令，核对与 WinBox 一致。

## 硬性要求

1. 菜单/参数先查 [help.mikrotik.com](https://help.mikrotik.com/docs/spaces/ROS/overview)，禁止瞎编。
2. **每一步**：一张 **真机 WinBox 截图** + 点击/填写 + **这一步的 CLI**。不许「如图」不写路径。
3. WinBox 与 CLI 同一结果。
4. 课文短：不要长文讲原理。路径/地址会变的课，用 **示意图** 讲清（谁连谁、地址怎么变）。图按下方「拓扑 / 原理示意图」走 `network-v1-diagram` / `packet-flow-diagram`。不要百科、不要 Packet Flow 长文。
5. 文首只保留：`适用版本：RouterOS 7.x`。**不要写**「管理工具：WinBox」，**不要写**「官方依据：…」。官方页面只给 Agent 查菜单，不出现在读者课文里。
6. 脱敏靠**实验机数据**（Identity=`R1`、教程网段、MAC 占位），不要在图上贴白块打码。MAC `00:11:22:33:44:55`；公网 TEST-NET。课程仓可用右上角一处文字水印 `RouterOS 入门与精通`，不得用白矩形遮内容。

## 何时使用

RouterOS / WinBox 新手教程、实战配置、要配图，或 `/ros-beginner-tutorial`。

## 工作流程

```
- [ ] 1. 一课一个功能；读 lab-env.local.md，连上 901 的 WinBox 和终端
- [ ] 2. WebFetch 官方文档，记下 URL
- [ ] 3. 拆成 3～8 步。若涉及「包从哪来、到哪去、地址变不变」：先 **读并执行** `network-v1-diagram`（整体原理）和/或 `packet-flow-diagram`（包变形），图落到本课 `images/`，再写 WinBox 步骤
- [ ] 4. 在真机 WinBox 做出该步 → 截 WinBox 窗口（禁止 GenerateImage 充 WinBox 界面）
- [ ] 5. 截图：红框对准**本步菜单名 / 要填的字段 / 关键结果**；框旁写中文标签。禁止白块打码、禁止红框标到空白或错误窗口。
- [ ] 6. **图注写在课文里、图片下方正中**（不是画进图里）：`图(N) 短说明`，**N 从 1 起编，禁止图(0)**。例如 `图(1) ikev2防火墙设置`。字色用正文色，不要做成图底黑条。
- [ ] 7. 写下 WinBox 路径、动作、本步 CLI（与红框一致）
- [ ] 8. 终端执行检查命令，写入「检查」。常见问题：只写用户容易忽略的具体坑；没有就整节省略。
```

连不上 901 或截不到真机 WinBox：**停写课文**，说明缺什么。禁止用 AI 假界面凑图。

未点名主题时，按 reference 课表一次只写一课。用户点名「完整配置过程」时，该功能从准备到检查写完再结束。

完整功能课（用户侧一整件事）优先写这些：

1. IKEv2 回家（证书 + 服务器 + 手机/Windows）
2. SSTP
3. OpenVPN
4. L2TP/IPsec
5. ZeroTier（仅 ARM/ARM64；x86 实验机写清不支持）
6. WireGuard 回家（接口 + 地址 + Peer + 防火墙/NAT + 客户端）
7. 端口敲门（Filter + Address List，无独立菜单）
8. 安全加固（改密、关服务、限制来源、NTP）
9. 配置 IPv6
10. 开启 HTTPS（www-ssl / 证书）
11. DHCP Option 分流（option 121 无类静态路由）
12. 端口映射 + 端口回流（dst-nat + hairpin masquerade）
13. SSH 公钥登录

## 课文结构（短）

```markdown
# {功能名}

> 适用版本：RouterOS 7.x

## 目的
（一句话）

## 网络
- 地址/接口（示例网段，不是实验机真实公网）

## 先看懂
（仅当本课有「谁连谁 / 包怎么走」时）示意图 + 一句人话。
![…](images/00-原理.png)

<p align="center">图(1) 短说明</p>
（地址/端口会改写时再附包变形图，图号接着编）

## 第N步：{动词}
WinBox：`菜单 → 窗口`
动作：点什么、填什么（字段名与图上红框标签一致）
![…](images/01-….png)

<p align="center">图(N) 短说明</p>

命令：
\`\`\`routeros
/ip/address/add ...
\`\`\`

## 检查
WinBox 看哪里。
\`\`\`routeros
/ip/address/print
\`\`\`
```

「检查」里可含 ping。

## 常见问题（可省略）

只写**具体、用户容易忽略**的坑，例如：证书 CN 必须等于客户端填的地址；LAN 访问公网映射必须加 hairpin；option 121 客户端不请求则不发。  
不要写「接口名填错」「没点 Apply」这类空话。没有这种坑就**整节不写**。

## 拓扑 / 原理示意图（初学者）

读者是新手。凡是「电脑怎么上网、包怎么改地址、隧道怎么回家、VLAN 怎么隔离」，必须在 WinBox 步骤**之前**给图。

**要配图的课（部分，不是每一课）：** VPN、NAT（含端口映射/回流）、防火墙转发路径、端口敲门、DHCP/Option 分流、IPv6、VLAN、双 WAN、策略路由。  
**可省略：** 只改名称/密码、看 CPU/日志、备份导出、纯菜单认识且路径已在上一课讲过。

画图前必须先读并按原文执行这两个技能（本技能不另写一套画法）：

| 图 | 技能 | 何时 |
|----|------|------|
| **A · 整体原理 / 网络拓扑** | `network-v1-diagram` 的 A 类 | 谁连谁、左外网 / 中 R1 / 右内网（或 VPN） |
| **B · 数据包变形** | `packet-flow-diagram`（与 `network-v1-diagram` 的 B 类同一套） | 地址或端口会 Before → After：NAT、端口映射/回流、防火墙改写、VPN 出站伪装 |

未说明时：NAT/端口转发/回流/VPN 回家 **A + B 各一张**；只讲谁连谁、包头不变（如纯 VLAN 口类型）可以只要 A。

课程仓落盘（不要写到技能仓库的 `docs/images/`）：

- A：本课 `images/00-原理.png`（按 network-v1-diagram：`GenerateImage`、深蓝底、左→中→右、外网青 / 路由器红橙 / 内网绿 / VPN 紫、中文+示例 IP）
- B：本课 `images/00-包变形.png`（按 packet-flow-diagram：Mermaid `flowchart LR`、白底、①～⑤、分区 emoji；用该技能的 `scripts/render.py` 或 `network-v1-diagram` 的 `render_packet_flow.py` 出 4800px PNG）

课文里仍用本课图注：`<p align="center">图(1) …</p>`，从 1 起编。有 A+B 时图(1)=原理、图(2)=包变形，WinBox 从下一号接着。  
**不要**把那两套技能里的「第一版风格说明」「复制此图」写进读者课文。

图必须同时做到：

1. **标明步骤**：①②③… 能对上包走的顺序（或课文步骤）。
2. **讲清原理**：谁是外网、谁是 R1、谁是家里电脑/手机；变了的地址/端口画出 Before → After。
3. **一看就懂**：图下用一句话人话。不要堆英文缩写墙。

禁止：用 WinBox 截图冒充拓扑；用 AI 画假 WinBox；用 Mermaid 顶替 A 类整体原理图；用 GenerateImage 画 B 类流程图；图里出现真实公网/密码/昵称（用 `192.168.88.0/24`、`203.0.113.10`）。重画旧课的 `00-原理.svg` 时改成上述 PNG，不要再手搓另一套扁平 SVG 当主图。

## 截图（必须真机）

- 截 **本机已打开、已登录 901** 的 WinBox 窗口。窗口必须就是这一步的菜单（Firewall/NAT/WireGuard/PPP…），禁止拿 Packages、TR069 等无关窗顶替。
- **禁止**用 `GenerateImage`、网图、WebFig **顶替 WinBox**（除非用户点名 WebFig 课）。整体原理图按 `network-v1-diagram` 用 GenerateImage，不在本节。
- 红框 + 中文标签标出：① 左侧或顶栏**菜单名** ② 教程要求填写的**字段** ③ 本步**关键结果**（表格行、勾选、端口）。每张图 1～3 处，框必须套在对应文字上。
- **图注不属于图片。** 不要在 PNG/SVG 里画底栏、不要把「图(1) …」烧进像素。截完图后，在 Markdown **紧挨图片的下一行**居中写正文，例如：`<p align="center">图(1) ikev2防火墙设置</p>`。这是课文里的一行字（随主题黑/深色），不是 WinBox 底栏那种深色条。
- **图号从 1 开始，禁止图(0)。** 原理图文件名可以是 `images/00-原理.png`，包变形 `images/00-包变形.png`，图注仍是 `图(1) …`；WinBox 图接着编。序号与文件名无关。
- **禁止白块、马赛克条遮内容。** 实验机事先改成教程占位数据（R1、192.168.88.0/24、密码框圆点）。图里若仍有真实隐私，先改实验机再截，不要贴白矩形。
- 文件名：`images/01-打开DHCP.png`（basename 两位序号 + 短中文）。

## 命令

- RouterOS 7 路径式：`/ip/address/add ...`
- 未指定网段用 `192.168.88.0/24`；`ether1`=WAN，`bridge`=LAN，注明改成读者自己的口。
- 危险操作（reset、drop all）单独成步并写恢复办法。

## 落盘后

- 更新该章 `README.md`（可跟做）
- **不要**把 `lab-env.local.md` 拷进课程仓
- 不要擅自 commit / 不要把密码写进 git-sync 日志

不要在对话里贴大图；课文用相对路径引用即可。

技能正本：`C:\gitea\AIsync\skills\ros-beginner-tutorial`

## 自检

- [ ] 输出只在课程仓对应章目录
- [ ] 每步真机 WinBox 图 + 操作 + 本步命令
- [ ] 教程/图中无实验机密码、无个人昵称、无真实公网/MAC
- [ ] 短：无百科章节
- [ ] 文首只有适用版本，无「管理工具 / 官方依据」
- [ ] 红框对准菜单和字段；图注在课文里图片下一行居中，从 **图(1)** 起编、无图(0)，**没有**画进图里的黑条
- [ ] 无白块打码
- [ ] 常见问题要么具体、要么省略
- [ ] 该配原理图的课：A 图按 `network-v1-diagram`，需要时 B 图按 `packet-flow-diagram`；图在本课 `images/`，图号从 1 起
- [ ] 未用 AI 生成假 WinBox
