---
name: ros-beginner-tutorial
description: >-
  为 MikroTik RouterOS 写简短实战课文（简体中文，v7）。输出到课程仓。
  每步：真机 WinBox 截图 → 操作 → 本步 CLI → 验证。禁止 AI 生成图、禁止把实验机密码写入教程。
  Use when RouterOS/WinBox 新手教程、实战配置、操作配图, or /ros-beginner-tutorial.
---

# RouterOS 实战配置教程

写 **短、直说步骤、照着就能配完** 的课文。不是参数百科。

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
4. 课文短：只有目的、网络、逐步操作、检查。不要原理、Packet Flow、企业案例。
5. 文首：`适用版本：RouterOS 7.x` · `管理工具：WinBox`。路由/防火墙/NAT/IPsec/WireGuard 按 v7。
6. 脱敏：MAC `00:11:22:33:44:55`；公网 TEST-NET；身份示例 `R1`。截图打水印，见课程仓 `CONTRIBUTING.md`、`automation/protect-media.ps1`。

## 何时使用

RouterOS / WinBox 新手教程、实战配置、要配图，或 `/ros-beginner-tutorial`。

## 工作流程

```
- [ ] 1. 一课一个功能；读 lab-env.local.md，连上 901 的 WinBox 和终端
- [ ] 2. WebFetch 官方文档，记下 URL
- [ ] 3. 拆成 3～8 步（最多 12），一步一个动作
- [ ] 4. 在真机 WinBox 做出该步 → 截 WinBox 窗口（禁止 GenerateImage 充数）
- [ ] 5. 脱敏 + 水印，存入本课 images/
- [ ] 6. 写下 WinBox 路径、动作、本步 CLI
- [ ] 7. 终端执行检查命令，写入「检查」
```

连不上 901 或截不到真机 WinBox：**停写课文**，说明缺什么。禁止用 AI 假界面凑图。

未点名主题时，按 reference 课表一次只写一课。

## 课文结构（短）

```markdown
# {功能名}

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[标题](URL)

## 目的
（一句话）

## 网络
- 地址/接口（示例网段，不是实验机真实公网）

## 第N步：{动词}
WinBox：`菜单 → 窗口`
动作：点什么、填什么
![第N步](images/01-….png)
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

「检查」里可含 ping。常见失败最多 3 条命令，不要展开成手册。

## 截图（必须真机）

- 截 **本机已打开、已登录 901** 的 WinBox 窗口（computer-use / 系统截图 / 用户提供的真机图）。
- **禁止** `GenerateImage`、禁止网图、禁止用 WebFig 顶替（除非用户点名 WebFig 课）。
- 文件名：`images/01-打开DHCP.png`（basename 两位序号 + 短中文）。
- 图上不能出现：真实密码、个人昵称、真实公网 IP、真实 MAC。出现了先打码再入库。

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
- [ ] 文首有官方链接
- [ ] 未用 AI 生成图凑数
