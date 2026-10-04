# 开启 HTTPS

> 适用版本：RouterOS 7.x



## 目的

给 WebFig 开 www-ssl（TCP 443），用本机证书。

## 网络

- LAN：`192.168.88.0/24`，网关 `192.168.88.1`，接口 `bridge`（改成你的口）
- WAN：`pppoe-out1` 或 `ether1`
- 公网示例用 TEST-NET：`203.0.113.10`；密码只写 `********`
- 身份示例：`R1`
- 有公网域名时可用 ACME/Let's Encrypt（要放行 TCP 80）

## 第1步：签一张 www 证书

WinBox：`System → Certificates → + / Sign`

动作：Name=www-cert，common-name=R1 或你的域名，Sign（可用自签）。

![图(1) 签一张www证书](images/01-证书.png)

```routeros
/certificate/add name=www-cert common-name=R1 key-usage=tls-server
/certificate/sign www-cert
```

## 第2步：启用 www-ssl

WinBox：`IP → Services → www-ssl`

动作：Certificate 选 www-cert，Disabled=no，Port=443。

![图(2) 启用www-ssl](images/02-wwwssl.png)

```routeros
/ip/service/set www-ssl certificate=www-cert disabled=no port=443
/ip/service/print where name=www-ssl
```

## 第3步：关掉明文 www（可选）

WinBox：`IP → Services → www`

动作：不用 HTTP 就 Disable www。

![图(3) 关掉明文www（可选）](images/03-关http.png)

```routeros
/ip/service/set www disabled=yes
```

## 第4步：限制来源

WinBox：`IP → Services → www-ssl`

动作：Available From=192.168.88.0/24。

![图(4) 限制来源](images/04-限制.png)

```routeros
/ip/service/set www-ssl address=192.168.88.0/24
```

## 检查

WinBox：浏览器 https://192.168.88.1 能打开（自签会警告）

```routeros
/ip/service/print where name~"www"
```

## 常见问题

容易忽略：443 已被 SSTP 占用时改 www-ssl 端口。ACME 需要域名解析到路由器且 80 可达。
