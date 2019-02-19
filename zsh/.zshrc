source /usr/local/share/antigen/antigen.zsh
antigen use oh-my-zsh

# 加载原版oh-my-zsh中的功能(robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# 语法高亮功能
antigen bundle zsh-users/zsh-syntax-highlighting

# 代码提示功能
antigen bundle zsh-users/zsh-autosuggestions

# 自动补全功能
antigen bundle zsh-users/zsh-completions

#代理
# antigen bundle sukkaw/zsh-proxy

# 加载主题
antigen theme robbyrussell


# 保存更改
antigen apply

# https://github.com/athityakumar/colorls
# source $(dirname $(gem which colorls))/tab_complete.sh

# http://stackoverflow.com/questions/4975973/gem-update-unable-to-convert-xe7-to-utf-8-in-conversion-from-ascii-8bit-to-u
export LC_CTYPE=en_US.UTF-8

if [ -x /usr/local/opt/coreutils/libexec/gnubin/dircolors ] ; then
    #eval `gdircolors -b $HOME/.dircolors`
    eval $(gdircolors -b $HOME/.dircolors)
    if [ -n "$LS_COLORS" ]; then
        zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
    fi
#    alias ls='ls -F --show-control-chars --color=auto'
#    alias dir='dir --color=auto'
#    alias vdir='vdir --color=auto'
#    alias grep='grep --color=auto'
#    alias fgrep='fgrep --color=auto'
#    alias egrep='egrep --color=auto'
#    alias tree='tree -C'
fi

alias lc='colorls -lA --sd'

source /Users/Cary/.bash_profile
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/opt/php@7.2/bin:$PATH"
export PATH="/usr/local/opt/php@7.2/sbin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# proxy
alias proxy='export socks5_proxy=socks5://127.0.0.1:1086;export http_proxy=http://127.0.0.1:1087;export https_proxy=http://127.0.0.1:1087;'
alias unproxy='unset socks5_proxy http_proxy https_proxy'

# 查询自己的IP
myip() {
    echo "========================================"
    echo "Check what your IP is"
    echo "----------------------------------------"
    echo -n "IPIP.NET: "
    curl https://myip.ipip.net
    echo "----------------------------------------"
    echo -n "IP.CN: "
    curl https://ip.cn
    echo "----------------------------------------"
    echo "IP.GS: "
    curl https://ip.gs
    echo "========================================"
}