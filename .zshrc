# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#shell styling and autocomplete
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=4000
autoload -Uz compinit promptinit 
compinit;promptinit
prompt spaceship

#load a few plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-notify/notify.plugin.zsh
#source /usr/share/zsh/plugins/zsh-vi-mode/vi-mode.zsh

setopt auto_cd
##pywal stuff
(cat ~/.cache/wal/sequences &)
##export environment variables
export EDITOR=nvim
export BROWSER=firefox
export SUDO_EDITOR=nvim
export GPG_TTY=$(tty)

##ytdl audio search
function mm() {
    vidTitle=${@// /"\ "}
	mpv --ytdl-format=bestaudio ytdl://ytsearch:"$vidTitle"
}

##zsh history search settings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

##aliases

alias vim='nvim'
alias sv='sudo -e '
alias fl='newgrp flutterusers'
alias mkdir='mkdir -pv'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias S='sudo systemctl'
#pacman aliases(taken from https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/archlinux/archlinux.plugin.zsh)
alias pacupg='sudo pacman -Syu'
alias pacin='sudo pacman -S'
alias pacins='sudo pacman -U'
alias pacre='sudo pacman -R'
alias pacrem='sudo pacman -Rns'
alias pacrep='pacman -Si'
alias pacreps='pacman -Ss'
alias pacloc='pacman -Qi'
alias paclocs='pacman -Qs'
alias pacinsd='sudo pacman -S --asdeps'
alias pacmir='sudo pacman -Syy'
alias paclsorphans='sudo pacman -Qdt'
alias pacrmorphans='sudo pacman -Rs $(pacman -Qtdq)'
alias pacfileupg='sudo pacman -Fy'
alias pacfiles='pacman -Fs'
alias pacls='pacman -Ql'
alias pacown='pacman -Qo'
