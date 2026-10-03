# MPLS 排错

## 现象

（待写）

## 检查顺序

1. 接口状态 / 网线 / VLAN
2. 地址与路由
3. 防火墙与 NAT
4. 协议邻居（如有）
5. 日志与 Torch

## 常用命令

```
/interface print
/ip address print
/ip route print
/log print
```
