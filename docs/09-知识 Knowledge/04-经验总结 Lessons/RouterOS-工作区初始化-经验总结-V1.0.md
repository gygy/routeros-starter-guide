# RouterOS-工作区初始化-经验总结-V1.0.md

# RouterOS 工作区初始化

## 1. 治理时间

2026-10-03

## 2. 治理范围

工作区根：`G:\gitea\RouterOS入门与精通`  
依据：`docs/.workspace-rules.md`（含 §7 GitHub 发布边界）

## 3. 原目录结构

根目录仅有 `README.md`、`ros-pppoe-dial.md`、`scripts/git-sync.ps1`、`.gitignore`。

## 4. 依据的规范文件

`docs/.workspace-rules.md`（由治理模板写入后增补 §7 / §7.1）

本机当时没有可用的 `python` 解释器，标准九段目录由 `scripts/bootstrap-course.ps1` 按规范树创建，未跑通 `init_workspace.py` 的自动归类。

## 5. 文件迁移记录（目录）

| 原路径 | 新路径 | 原因 |
| --- | --- | --- |
| `ros-pppoe-dial.md` | `RouterOS入门与精通/cookbook/home/pppoe-dial.md` | 对外课文进入唯一 GitHub 课程仓 |
| `images/pppoe-dial-*.jpg` | `RouterOS入门与精通/cookbook/home/images/` | 随课文进入课程仓 |

## 6. 命名对照（§4，预览或已执行）

课程仓内 Markdown 使用英文短文件名（课程体系），不属于九段研发成果命名范围。本报告按正式成果命名。

| 旧路径 | 旧文件名 | 族 | 建议新路径 | 建议新文件名 | 状态 |
| --- | --- | --- | --- | --- | --- |
| （无） | | | | | 无批量重命名 |

## 7. 重复文件 / 禁止名

无。

## 8. 待确认文件

无。治理脚本日后扫描须跳过根目录 `RouterOS入门与精通/`（规范 §7.1）。

## 9. 删除建议（含 iCenter 临时产物）

无。

## 10. 治理结果

- 九段 `docs/` 已建。
- 唯一 GitHub 发布目录 `RouterOS入门与精通/` 已按课程闭环搭好骨架。
- `scripts/git-sync.ps1` 对 GitHub 改为 `subtree split` 只推课程前缀。
