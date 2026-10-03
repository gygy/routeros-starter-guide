---
name: ros-beginner-tutorial
description: >-
  为 MikroTik RouterOS 写「照着 WinBox 就能做完」的实战课文（简体中文，v7）。
  固定七段：目的、网络、逐步 WinBox（每步一张截图）、对应命令、检查、排错。
  不是参数百科。Use when the user asks for RouterOS/WinBox 新手教程、实战配置、
  操作步骤配图, or /ros-beginner-tutorial.
---

# RouterOS 实战配置教程

写 **照着操作就能完成配置** 的 RouterOS 课文。不是 MikroTik 官方手册那种参数百科。

默认：**RouterOS 7.x** + **WinBox 3**（界面英文，说明用中文）。  
官方说明 WinBox 操作与 CLI 基本对应，因此固定顺序是 **WinBox → 截图 → 动作 → 文末完整命令 → 验证**。依据：[WinBox](https://help.mikrotik.com/docs/spaces/ROS/pages/328129/WinBox)。

## 硬性要求

1. 先查 [help.mikrotik.com](https://help.mikrotik.com/docs/spaces/ROS/overview)，禁止凭记忆编菜单名/参数。Wiki 只作补充。
2. **一步一个明确动作**；**每一步一张 WinBox 截图**。不要「如图」却不写路径。
3. **WinBox 与 CLI 必须同一结果**。禁止 WinBox 讲一套、命令另一套。
4. 课文固定 **7 块**（步骤块内部可以有第 1…N 步，不要再加原理/Packet Flow/企业案例等章节）。
5. 适用版本写死：`适用版本：RouterOS 7.x` · `管理工具：WinBox`。Routing / Firewall / NAT / IPsec / WireGuard / Policy Routing 一律按 v7。
6. 隐私：账号密码用 `admin` / `ISP_USER` / `ISP_PASS`；MAC 用 `00:11:22:33:44:55`；公网 IP 用 TEST-NET；禁止个人昵称。截图脱敏 + 水印规则见课程仓 `CONTRIBUTING.md`。

菜单对照、课表映射、截图 prompt 见 [reference.md](reference.md)。成品骨架见 [examples.md](examples.md)。

## 何时使用

用户提到：RouterOS / ROS / MikroTik / WinBox 新手教程、实战配置、操作步骤、对照命令、要配截图，或调用 `/ros-beginner-tutorial`。

## 工作流程

```
- [ ] 1. 锁定一课一个功能（例如「DHCP 服务器」）；默认 ROS 7、家用网关
- [ ] 2. WebSearch + WebFetch 官方文档；记下准确 URL
- [ ] 3. 拆成可单独执行的 WinBox 步骤（建议 3～8 步，最多 12）
- [ ] 4. 每步写出：路径、点击、填写字段（与官方核对）
- [ ] 5. 每步生成 1 张 WinBox 截图（真机优先，否则 GenerateImage）
- [ ] 6. 文末写与上述步骤一一对应的完整 CLI + 检查命令
- [ ] 7. 按七段模板落盘；自检
```

未指定主题时，按 [reference.md](reference.md) 课表从前往后写，一次只写用户点名的一课。

## 课文固定 7 块（不要写多）

```text
1. 目的
2. 网络（参数）
3. 第 1 步 … 第 N 步（每步：WinBox 路径 + 动作 + 一张截图）
4. 对应命令（整段可复制，与上面每步对应）
5. 检查（WinBox 看哪里 + 等价 print）
6. 测试（如 ping；可并入检查，但必须有）
7. 常见问题（排错命令，针对做不成的情况）
```

文首另加一行官方依据（不算第 8 块科普）。

每课开头：

```markdown
# {功能名}

> 适用版本：RouterOS 7.x  
> 管理工具：WinBox  
> 官方依据：[页面标题](完整URL)
```

## 每一步（只做一件事）

```markdown
## 第N步：{动词 + 对象}

WinBox：

`{左侧树} → {窗口} → {按钮/页签}`

点击 / 填写：

- `{字段}`：`{值}`

![第N步](images/{两位序号}-{短中文}.png)
```

禁止：一步里堆互不相关的配置；只给命令不给 WinBox；WinBox 与文末 CLI 字段不一致。

## 对应命令

全部步骤做完后，用 **一个** `routeros` 代码块给出等价配置（RouterOS 7 路径式，如 `/ip/address/add`）。  
检查用 `print` / `monitor`，不要把检查命令混进「对应命令」里冒充配置。

## 截图

- **每步 1 张 WinBox 图**，不可省。不要用代码块代替截图。
- 默认不给逐步 CLI 截图（命令集中在文末）。用户明确要求逐步 CLI 图时再补。
- 必须调用 `GenerateImage`（无真机时）。`filename` 只用 basename。
- 真机：用户要求且已开 WinBox 时，优先实机截取。

落盘（一课一个目录，图不堆在总 images 里）：

```text
docs/{章目录}/{课号}-{课名}/
  ├─ {课号}-{课名}.md
  └─ images/
      ├─ 01-{本步动作}.png
      ├─ 02-{本步动作}.png
      └─ …
```

章目录必须落在课程仓已有章节里（见 reference 映射表）。**禁止**在仓库根再建 `RouterOS教程/` 或九段研发目录。

比例 `16:9`。画面能读清菜单和字段。英文 WinBox，图下中文说明。红框只标 1～2 处点击目标。Prompt 见 [reference.md](reference.md)。

## 命令规范

- RouterOS 7 路径式 CLI。可附等效短命令，不得只写 v6 路由语法。
- 未指定网段时用官方默认思路 `192.168.88.0/24`；用户指定则用用户的（如 `192.168.80.0/24`）。
- 接口示例：`ether1` = WAN，`bridge` = LAN，文中写「改成你的接口名」。
- 危险操作（reset、drop all、Netinstall）单独成步，并写恢复方法。

## 交付物

课程仓：`G:\gitea\RouterOS入门与精通\`

- 按上一节目录写入 `.md` + `images/`
- 更新该章 `README.md` 与仓库根需要指向「可跟做」的链接
- 写完一课再执行 `scripts\git-sync.ps1`（仅当用户要同步远程时；默认先落盘，**不要擅自 commit**，除非用户明确要求）

不要在对话里只丢命令。不要在聊天里再用 Markdown 贴一遍生成的原图；**课文里必须引用相对路径**。

技能正本：`C:\gitea\AIsync\skills\ros-beginner-tutorial`（本机 Cursor/Codex/Agents 技能目录指向它）。

## 自检

- [ ] 只有七块结构，没有参数百科章节
- [ ] 每步一张 WinBox 图，路径可点击复现
- [ ] 文末 CLI 与 WinBox 字段一一对应
- [ ] 有检查 / 测试 / 常见问题
- [ ] 文首有 help.mikrotik.com 链接
- [ ] 未把 Wiki 当唯一依据
- [ ] 未跳过截图「以后再补」
- [ ] 未在仓库根新建平行教程树
