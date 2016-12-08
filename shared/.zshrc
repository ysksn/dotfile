# for nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# for rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# for rbenv plugins
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

# default editor is vim
export EDITOR="vim"

# LC
export LANG=ja_JP.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_IDENTIFICATION=ja_JP.UTF-8
export LC_COLLATE=ja_JP.UTF-8
export LANG=ja_JP.UTF-8
export LC_MEASUREMENT=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export LC_TIME=ja_JP.UTF-8
export LC_NAME=ja_JP.UTF-8

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# aliases
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

alias ll='ls -alF --group-directories-first'
alias mkdir='mkdir -p'
alias rz='exec zsh -l'
alias vi='vim'
alias be='bundle exec'

alias ga='git add'
alias gb='git branch'
alias gc='git commit -m'
alias gch='git checkout'
alias gd='git diff'
alias gds='git diff --staged'
alias gf='git fetch'
alias gl='git log --graph'
alias gld='git log --diff-filter=D --summary'
alias gm='git merge --no-ff'
alias gp='git pull --rebase'
alias gr='git reset'
alias gs='git status'
alias gsl='git stash list'

bindkey -e
