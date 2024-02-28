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
# 入力補完/输入补全/input
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-history-substring-search
# コマンド強調表示（きょうちょうひょうじ）/代码高亮/syntax highlight 
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

# man zh
alias cman="man -M /usr/local/share/man/zh_CN"

# zh-CN
export LANG=zh_CN.UTF-8
# path
export PATH="/usr/local/sbin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# =====================
# ENV/环境变量/環境変数
# ---------------------
# nodejs / ノード
# export PATH="/usr/local/opt/node@18/bin:$PATH"
# ---------------------
# Golang / ゴラン
# ---------------------
# export GOROOT=/usr/local/opt/go/libexec
# export GOPATH="$HOME/Sites/Golang"
# export PATH="$GOPATH/bin:$PATH"
# ---------------------
# JAVA / ジャワ
# ---------------------
# JAVA_HOME_17=/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home
# JAVA_HOME=$JAVA_HOME_17
# export JAVA_HOME
# ---------------------
# Python
# ---------------------
# Controls the version of Python
# パイソンのバージョンに制御する
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# ---------------------
# postgreSQL
# ---------------------
# export PATH="/usr/local/opt/postgresql@16/bin:$PATH"
# ---------------------
#======================
