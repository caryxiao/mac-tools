# 工具库

## VIM工具

Vim使用 [vim-plug](https://github.com/junegunn/vim-plug) 来管理插件



1. git clone https://github.com/caryxiao/mac-tools.git
2. 执行vim目录中的install.sh文件, 安装文件会自动复制文件到你的HOME目录下面
3. 打开VIM，然后执行命令 `:PlugInstall`，然后插件管理器会自动为你安装插件



该配置提供了常用的一些配置, 具体的自己看配置文件...

## lnav

查看日志的工具 linux下也可以使用

请查看 lnav目录下的README.md文件

## 更新记录

2020-09-15
由于php安装zookeeper只能使用比较老版本的, 但是homebrew是最新的,我们这里提取了一个历史版本`zookeeper.rb`
在根目录下使用`brew install ./Formula/zookeeper.rb安装`


2019-02-19

添加zsh配置, 使用antigen来管理zsh模板和插件

2019-01-30

添加lnav安装，使用，配置

2018-11-24

添加使用brew安装sshpass的方法

2018-11-22

解决linux下 VIM的nerdtree插件 显示文件夹名称和文件名称不全的问题

2018-11-19

添加Dockerfile 文件支持
