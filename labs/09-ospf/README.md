# Lab 09 - OSPF

目标：

- 理解 OSPF Neighbor
- 理解 Area
- 理解 Router ID
- 理解 Cost
- 理解 DR/BDR
- 理解 OSPF Route
- 学会排查 Neighbor Down

Topology:

```
R1 -------- R2
 |           |
 +---- R3 ---+
```

实验环境：

RouterOS 7.x

学习内容：

1. 配置 Router ID
2. 创建 OSPF Instance
3. 创建 Area
4. 配置 Interface Template
5. 查看 Neighbor
6. 查看 LSDB
7. 查看 Route
8. 模拟链路故障
9. 故障排查

v7 使用 `/routing ospf` 的 instance、area、interface-template，不要套 v6 命令。排错见 [troubleshooting.md](troubleshooting.md)。
