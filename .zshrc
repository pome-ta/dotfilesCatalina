autoload -Uz colors
colors
autoload -Uz compinit && compinit

export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx
export LS_COLORS='di=01;36:ln=01;35:ex=01;32'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=32'

export EDITOR=vim
setopt auto_pushd
setopt pushd_ignore_dups
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt mark_dirs
zstyle ':completion::complete:*' use-cache true

autoload -U colors ; colors ; zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

alias ll="ls -GFa"
function chpwd() { ll }

PROMPT="
%T%{${fg[cyan]}%}[%n]%{${reset_color}%}%d
%# %{${fg[cyan]}%}>%{${reset_color}%}"

export PATH=/usr/local/bin:$PATH
export PATH="/usr/local/opt/ruby/bin:$PATH"
eval "$(pyenv init -)"




fpath=(~/.zsh/completion $fpath)
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
autoload -Uz compinit && compinit -i
export PATH="/usr/local/opt/ruby/bin:$PATH"

