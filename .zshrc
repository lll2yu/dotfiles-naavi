# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=~/.local/bin:$PATH
#shell styling and autocomplete
HISTFILE=~/.config/histfile
HISTSIZE=1000
SAVEHIST=4000
autoload -Uz compinit promptinit 
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit;promptinit
prompt spaceship

#load a few plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
#source /usr/share/zsh/plugins/zsh-notify/notify.plugin.zsh
#source /usr/share/zsh/site-functions/lfcd.sh
#compdef _gnu_generic gallery-dl

setopt autocd appendhistory 

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

##export environment variables
export EDITOR=nvim
export BROWSER=librewolf

##ytdl audio search
function mm() {
    vidTitle=${@// /"\ "}
	mpv --ytdl-format=bestaudio ytdl://ytsearch:"$vidTitle"
}

##mediafire download
function mfdl() {
url=$(curl -Lqs "$1"|grep "href.*download.*media.*"|tail -1|cut -d '"' -f 2)
#aria2c -x 6 "$url"
wget "$url"
}

##filemanager
bindkey -s '^o' 'lfcd\n'

##command edit
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

##zsh history search settings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

##aliases

#alias vim='nvim'
alias mkdir='mkdir -pv'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
#pacman aliases(taken from https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/archlinux/archlinux.plugin.zsh)
alias pacupg='doas pacman -Syu'
alias pacin='doas pacman -S'
alias pacins='doas pacman -U'
alias pacre='doas pacman -R'
alias pacrem='doas pacman -Rns'
alias pacrep='pacman -Si'
alias pacreps='pacman -Ss'
alias pacloc='pacman -Qi'
alias paclocs='pacman -Qs'
alias pacinsd='doas pacman -S --asdeps'
alias pacmir='doas pacman -Syy'
alias paclsorphans='doas pacman -Qdt'
alias pacrmorphans='doas pacman -Rs $(pacman -Qtdq)'
alias pacfileupg='doas pacman -Fy'
alias pacfiles='pacman -Fs'
alias pacls='pacman -Ql'
alias pacown='pacman -Qo'
