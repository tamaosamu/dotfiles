#  ______   ______     __    __     ______     ______     ______     ______     __    __     __  __    
# /\__  _\ /\  __ \   /\ "-./  \   /\  __ \   /\  __ \   /\  ___\   /\  __ \   /\ "-./  \   /\ \/\ \   
# \/_/\ \/ \ \  __ \  \ \ \-./\ \  \ \  __ \  \ \ \/\ \  \ \___  \  \ \  __ \  \ \ \-./\ \  \ \ \_\ \  
#    \ \_\  \ \_\ \_\  \ \_\ \ \_\  \ \_\ \_\  \ \_____\  \/\_____\  \ \_\ \_\  \ \_\ \ \_\  \ \_____\ 
#     \/_/   \/_/\/_/   \/_/  \/_/   \/_/\/_/   \/_____/   \/_____/   \/_/\/_/   \/_/  \/_/   \/_____/ 

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

## load powerlevel10k
zinit ice depth"1"
zinit light romkatv/powerlevel10k

## oh-my-zsh
zi snippet OMZL::git.zsh
zi snippet OMZP::z
zi snippet OMZP::git
zi snippet OMZP::vscode
zi snippet OMZP::colored-man-pages

## plugins
# 入力補完 / 输入补全 / input
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-history-substring-search
# コマンド強調表示（きょうちょうひょうじ） / 代码高亮 / syntax highlight 
zinit light zdharma-continuum/fast-syntax-highlighting
# コマンド履歴を検索/历史命令搜索/search command history
zinit light zdharma/history-search-multi-word

## alias / 别名 / エイリアス
alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"
alias zshrc-r="source ~/.zshrc"
# ls
alias ls="ls --color=tty"
alias ll="ls -l"
alias la="ll -a"
alias lt="ls --tree"
alias j="z"
## 卸载别名，与golang(g)多版本命令冲突
unalias g

# man zh
alias cman="man -M /usr/local/share/man/zh_CN"

# zh-CN
export LANG=zh_CN.UTF-8

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# =====================
# ENV/环境变量/環境変数
# ---------------------
# Homebrew
# ---------------------
# 关闭自动清理旧版本包（不建议使用）
# export HOMEBREW_NO_INSTALL_CLEANUP=true
# 隐藏提示（建议使用）
export HOMEBREW_NO_ENV_HINTS=true
# ---------------------
# PHP
# ---------------------
# PHPBrew
## --------------------
export PHPBREW_PATH="$HOME/.phpbrew"
if [ -f "${PHPBREW_PATH}/bashrc" ]; then
  # PHPBrew 会在你的 shell 提示符中显示当前使用的 PHP 版本。
  export PHPBREW_SET_PROMPT=1
  # PHPBrew 会在每个目录中查找并加载 .phpbrewrc 文件
  export PHPBREW_RC_ENABLE=1
  source "${PHPBREW_PATH}/bashrc"
fi
## --------------------
# brew php
## --------------------
export PHP_PATH="/usr/local/opt/php"
if [ -d "$PHP_PATH" ]; then
  export PATH="$PHP_PATH/bin:$PATH"
  export PATH="$PHP_PATH/sbin:$PATH"
  export LDFLAGS="-L$PHP_PATH/lib"
  export CPPFLAGS="-I$PHP_PATH/include"
fi
# ---------------------
# nodejs / ノード
# ---------------------
## NVM
## --------------------
export NVM_DIR="$HOME/.nvm"
# This loads nvm
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"
# This loads nvm bash_completion
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"
# ---------------------
# Golang / ゴラン
# ---------------------
export G_PATH="${HOME}/.g"
if [ -f "${G_PATH}/env" ]; then
  . "${G_PATH}/env"
fi  
# export GOROOT=/usr/local/opt/go/libexec
# export GOPATH="$HOME/Sites/Golang"
# export PATH="$GOPATH/bin:$PATH"
# ---------------------
# JAVA / ジャワ
# ---------------------
export JENV_PATH="$HOME/.jenv"
if [ -d "${JENV_PATH}" ]; then
  export PATH="$JENV_PATH/bin:$PATH"
  eval "$(jenv init -)"
fi
# ---------------------
# Python / バイソン
# ---------------------
# python版本控制器
# Controls the version of Python
# パイソンのバージョンに制御する
export PYENV_ROOT="$HOME/.pyenv"
if [ -d $PYENV_ROOT/bin ]; then 
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi
#======================
export PATH="/usr/local/sbin:$PATH"
# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/Users/tamaosamu/.micromamba/bin/micromamba';
export MAMBA_ROOT_PREFIX='/Users/tamaosamu/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/tamaosamu/micromamba/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/tamaosamu/micromamba/etc/profile.d/conda.sh" ]; then
        . "/Users/tamaosamu/micromamba/etc/profile.d/conda.sh"
    else
        export PATH="/Users/tamaosamu/micromamba/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

