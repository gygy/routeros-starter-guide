# PPPoE 排错

按 [家庭课文](<../../cookbook/home/pppoe-dial.md>) 逐步核对。摘要：

1. ether1 是否仍是 bridge port。  
2. 账号是否整串（含运营商后缀）。  
3. 默认路由是否指向 `pppoe-out1`。  
4. masquerade 的 out-interface 是否写成了 `ether1`。  
5. 能 ping IP 不能打开网页 → DNS。

```
/interface/pppoe-client/monitor pppoe-out1 once
/ip route print
/ip dns print
/ip firewall nat print
```

公网地址、MAC 不要出现在你保存的笔记截图里，用课文中的示例网段代替。
