# Enable colors and change prompt:
autoload -U colors && colors	# Load colors

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git*' formats "%{$fg[red]%}[%{$fg[yellow]%}%b%{$fg[red]%}]"
setopt prompt_subst
PS1='%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@\
%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]\
${vcs_info_msg_0_}%{$reset_color%}$%b '

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)     # Include hidden files.

export EDITOR='nvim'
export VISUAL='nvim'

# User configuration
export KEYTIMEOUT=1
bindkey -v

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history

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

export PATH=$PATH:/home/endi/julia-1.5.3/bin
export PATH=$PATH:/home/endi/.local/bin
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
export ipuhome="scp://endim@dnat.simula.no/~/"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


# Dotfiles git bare repository
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias ls='ls -CF --color=auto'
alias v="nvim"
alias n="nnn -d"
alias m="neomutt"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Taken from Luke Smith's dotfiles
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
