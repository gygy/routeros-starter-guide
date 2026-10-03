# configs

完整设备配置（可 `/import`）。不要把 Netwatch 小脚本放这里，那些属于 `scripts/`。

目录按家里常用程度编号：`00-baseline` → 防火墙 → VPN → QoS → VLAN，BGP/VRRP 在后。

**初学者：** 不要一上来导入 `02-enterprise-edge.rsc`。先做完 Lab 00–05，再打开 `00-baseline/`，导入前改接口名和网段。家里优先 `00-home-router.rsc`。
