ZPLUGINDIR=$HOME/.zsh/plugins

# if you want to use unplugged, you can copy/paste plugin-clone here, or just pull the repo
if [[ ! -d $ZPLUGINDIR/zsh_unplugged ]]; then
    echo "Cloning mattmc3/zsh_unplugged"
    git clone https://github.com/mattmc3/zsh_unplugged $ZPLUGINDIR/zsh_unplugged --quiet
fi
source $ZPLUGINDIR/zsh_unplugged/zsh_unplugged.zsh

export PATH="/usr/local/sbin:$PATH"

### Basic config

autoload -U compinit
compinit

plugins=(
    # plugins that you want loaded first theme
    sindresorhus/pure

    # use zsh-defer magic to load the remaining plugins at hypersonic speed!
    romkatv/zsh-defer

    # core plugins
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-history-substring-search
    zsh-users/zsh-completions

    # user plugins
    rupa/z
    #hlissner/zsh-autopair
    djui/alias-tips
    peterhurford/up.zsh

    # load this one last
    zsh-users/zsh-syntax-highlighting

)

# clone, source, and add to fpath
plugin-load $plugins

# Prettify ls
if (( $+commands[gls] )); then
    alias ls='gls --color=tty --group-directories-first'
else
    alias ls='ls --color=tty'
fi

alias ll='ls -l'
alias j="z"

# nodejs config
export PATH="/usr/local/opt/node@18/bin:$PATH"

# go config
export GOROOT=/usr/local/opt/go/libexec
export GOPATH="$HOME/Sites/Golang"
export PATH="$GOPATH/bin:$PATH"

# JAVA
JAVA_HOME_17=/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home
JAVA_HOME=$JAVA_HOME_17

alias java17="export JAVA_HOME=$JAVA_HOME_17"

# Python
alias py="python3"
alias pip="pip3"
alias da="django-admin"

# Load Angular CLI autocompletion.
source <(ng completion script)
export PATH="/usr/local/opt/postgresql@16/bin:$PATH"
