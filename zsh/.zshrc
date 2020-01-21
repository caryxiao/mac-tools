source /usr/local/share/antigen/antigen.zsh
antigen use oh-my-zsh

# 加载原版oh-my-zsh中的功能(robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle git-flow-completion
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# 自动跳转目录
antigen bundle autojump
# 语法高亮功能
antigen bundle zsh-users/zsh-syntax-highlighting

# 代码提示功能
antigen bundle zsh-users/zsh-autosuggestions

# 自动补全功能
antigen bundle zsh-users/zsh-completions

#代理
# antigen bundle sukkaw/zsh-proxy

# 加载主题
# antigen theme robbyrussell
#antigen theme denysdovhan/spaceship-prompt
antigen theme Powerlevel9k/powerlevel9k
# 保存更改
antigen apply

SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_PREFIX="["
#SPACESHIP_TIME_SUFFIX="] "
#SPACESHIP_TIME_FORMAT="%D{%Y-%m-%d} %*"
SPACESHIP_DIR_TRUNC_REPO=false
SPACESHIP_DIR_PREFIX="["
SPACESHIP_DIR_SUFFIX="] "
SPACESHIP_PHP_SHOW=false


# ==== Theme Settings ====
# PowerLevel9k
# 左侧栏目显示的要素（指定的关键字参考官网）
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir vcs)
# 右侧栏目显示的要素
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time virtualenv)
#新起一行显示命令 (推荐！极其方便）
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#右侧状态栏与命令在同一行
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
#缩短目录层级
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
#缩短目录策略：隐藏上层目录中间的字
#POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
#添加连接上下连接箭头更方便查看
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="↱"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="↳ "
# 新的命令与上面的命令隔开一行
#POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
# Git仓库状态的色彩指定
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='blue'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='red'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'

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
    alias ls='ls -F --show-control-chars --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias tree='tree -C'
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
    #echo -n "IP.CN: "
    #curl https://ip.cn
    echo "----------------------------------------"
    echo "CIP.CC: "
    curl https://cip.cc
    echo "========================================"
}
export PATH="/usr/local/opt/e2fsprogs/bin:$PATH"
export PATH="/usr/local/opt/e2fsprogs/sbin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
