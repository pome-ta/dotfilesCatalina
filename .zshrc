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



autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

# プロンプトカスタマイズ 今度ちゃんと書く
#PROMPT='
#[%B%F{red}%n@%m%f%b:%F{green}%~%f]%F{cyan}$vcs_info_msg_0_%f
#%F{yellow}$%f '

PROMPT="
%T%{${fg[cyan]}%}[%n]%{${reset_color}%}%d
%# %{${fg[cyan]}%}>%{${reset_color}%}"


export PATH=/usr/local/bin/git:$PATH
eval "$(anyenv init -)"
export PATH="$HOME/.anyenv/bin:$PATH"

alias brew="PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin brew"
