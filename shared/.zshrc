OS=`uname`
if [ $OS = 'Darwin' ]; then
  alias ctags='`brew --prefix`/bin/ctags'
  alias sed='gsed'
  # default PATH
  export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
  # zsh-syntax-highlighting.zsh
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  # zsh-completions
  fpath=(/usr/local/share/zsh-completions $fpath)

  # alias for OSX
  alias ssh='~/.shell/ssh-host-color'
fi

# for nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# for rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# for rbenv plugins
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

# 補完
# 補完機能を有効にする
fpath=($HOME/.zsh/plugins/zsh-completions/src $fpath)

# default editor is vim
export EDITOR="vim"

# for developing locari
export LOCAL_DB_HOST=127.0.0.1
export LOCAL_REDIS_HOST=127.0.0.1

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

# color zsh
autoload -Uz colors
colors
PROMPT="%(?.%{${fg[green]}%}.%{${fg[red]}%})[%n@%m]%{${reset_color}%} %# "

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
/usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob

########################################
# キーバインド

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

########################################
# エイリアス

if [ $OS = 'Linux' ]; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi

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

# for gvm
[[ -s "/home/y-kabuto/.gvm/scripts/gvm" ]] && source "/home/y-kabuto/.gvm/scripts/gvm"
