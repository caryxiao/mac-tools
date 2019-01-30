# lnav 配置

## MAC 安装

```bash
brew install lnav
```

## 查看日志

直接使用如下命令+log文件地址

```bash
lnav /tmp/test.log
```

可以同时查看多个log文件

```bash
lnav /tmp/test1.log /tmp/test2.log
```

## analog 格式化显示

使用如下命令把analog.json加入到lnav的配置中

```bash

lnav -i analog.json

```

如何删除配置

需要进入`~/.lnav/formats/installed`目录下删除相关的文件

```bash
cd ~/.lnav/formats/installed && rm -rf analog.json
```




