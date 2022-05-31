OS=`uname`

if [ $OS = 'Linux' ]; then
fi

# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}"  ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh"  ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Stripe
fpath=(~/.stripe $fpath)
autoload -Uz compinit && compinit -i

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# terraform
export PATH="$PATH:$HOME/.terraform.d"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# rbenv plugins
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

bindkey -e

#################### START oh-my-zsh setting ####################
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="suvash"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  autojump
  aws
  brew
  bundler
  capistrano
  docker
  docker-compose
  gem
  git
  npm
  rails
  rake
  rbenv
  redis-cli
  ruby
  rust
  tmux
  yarn
  zsh-completions
)

if [ $OS = 'Linux' ]; then
  autoload -U compinit && compinit
fi

if [ $OS = 'Darwin' ]; then
  # vimがpython3.10.2に依存しており
  # deopleteが正しく起動できないため
  export PATH="/opt/homebrew/Cellar/python@3.10/3.10.2/bin:$PATH"

  if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
  fi
fi

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#################### END oh-my-zsh setting ####################

if [ $OS = 'Linux' ]; then
  # Stack (this depends on oh-my-zsh)
  export PATH="$HOME/.local/bin:$PATH"
  # aliases
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi

alias ll='ls -alF'
alias mkdir='mkdir -p'
alias rz='exec zsh -l'
alias vi='vim'
alias be='noglob bundle exec'

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
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
