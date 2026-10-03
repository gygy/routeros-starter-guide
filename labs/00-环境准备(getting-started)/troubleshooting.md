# 环境准备 · 排错

## 现象：Neighbors 是空的

1. 网线是否插在 LAN 口（默认包下通常不是 ether1）。  
2. 电脑防火墙是否拦了 Neighbor Discovery。  
3. 直接在 Connect To 填 `192.168.88.1` 试一次。  
4. 电脑临时设 `192.168.88.10/24`，不填错网关。

## 现象：能发现设备但登录失败

- 口令不是空白（新版本强制改过）。  
- 用户名是 `admin`，不是 WinBox 本机 Windows 用户名。

## 现象：一登录 CPU / 接口异常多

不要导入来路不明配置。本实验只要求登录和观察，不要求 `/import`。

## 常用命令

```
/interface print
/ip address print
/user print
```
