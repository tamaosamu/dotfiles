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

zinit ice depth"1"
zinit light romkatv/powerlevel10k

# load zsh


# 快速目录跳转
zinit ice lucid wait='1'
zinit light rupa/z
#zinit light skywind3000/z.lua

# 补全
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-history-substring-search
# Command Highlight
# 命令高亮
# コマンド強調表示（きょうちょうひょうじ）
# zinit light zsh-users/zsh-syntax-highlighting
zinit light zdharma-continuum/fast-syntax-highlighting
# URL: https://github.com/peterhurford/up.zsh
zinit light peterhurford/up.zsh
# URL: https://github.com/djui/alias-tips
zinit light djui/alias-tips

# =====================
# ENV
# 环境变量
# 環境変数
# ---------------------
# nodejs
# ノード
export PATH="/usr/local/opt/node@18/bin:$PATH"
# ---------------------
# Golang
# ゴラン
# ---------------------
export GOROOT=/usr/local/opt/go/libexec
export GOPATH="$HOME/Sites/Golang"
export PATH="$GOPATH/bin:$PATH"
# ---------------------
# JAVA
# ジャワ
# ---------------------
JAVA_HOME_17=/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home
JAVA_HOME=$JAVA_HOME_17
export JAVA_HOME
#======================
# postgreSQL
export PATH="/usr/local/opt/postgresql@16/bin:$PATH"
# Load Angular CLI autocompletion.
#source <(ng completion script)


# =====================
# alias
# 别名
# エイリアス
# ---------------------
alias j="z"
alias ls='ls --color=tty'
alias ll='ls -l'
alias la='ls -a'
alias lt='ls --tree'
# Python ==============
alias py="python3"
alias pip="pip3"
alias da="django-admin"
alias java17="export JAVA_HOME=$JAVA_HOME_17"
# =====================


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
