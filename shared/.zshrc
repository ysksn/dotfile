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
fi

# for rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# 補完
# 補完機能を有効にする
plugins+=(zsh-completions)
autoload -U compinit
compinit

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

alias ll='ls -al'
alias mkdir='mkdir -p'
alias rz='exec zsh -l'
alias ssh='~/.shell/ssh-host-color'
alias vi='vim'

alias ga='git add'
alias gb='git branch'
alias gc='git commit -m'
alias gch='git checkout'
alias gd='git diff'
alias gds='git diff --staged'
alias gf='git fetch'
alias gl='git log'
alias gm='git merge --no-ff'
alias gp='git pull --rebase'
alias gr='git reset'
alias gs='git status'

bindkey -e
