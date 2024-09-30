# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh//.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

source $ZDOTDIR/plugins/powerlevel10k/powerlevel10k.zsh-theme

neofetch

# load aliasrc if exist
[ -f "${ZDOTDIR}/aliasrc" ] && source "${ZDOTDIR}/aliasrc"

# load optionrc if exist
[ -f "${ZDOTDIR}/optionrc" ] && source "${ZDOTDIR}/optionrc"

# Plugins
source "${ZDOTDIR}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "${ZDOTDIR}/plugins/f-sy-h/F-Sy-H.plugin.zsh"
source "${ZDOTDIR}/plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh"
source "${ZDOTDIR}/plugins/zsh-pentest/zsh-pentest.plugin.zsh"


# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh//.histfile
HISTSIZE=110000
SAVEHIST=100000
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[OA' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[OB' history-substring-search-down

# colours
autoload -U colors && colors	      # colours
autoload -U compinit && compinit    # basic completion
autoload -U compinit colors zcalc   # theming

# tab completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)--color=auto}"                        # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                                                # automatically find new executables in path
zstyle ':completion:*' menu select                                                # Highlight menu selection

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-R


# Completion
zstyle :compinstall filename '/home/b4nd1t/.config/zsh//.zshrc'
autoload -Uz compinit
compinit

# Zoxide
eval "$(zoxide init zsh)"

# Fzf
eval "$(fzf --zsh)"

# Copilot
alias copilot='gh copilot'
alias gcs='gh copilot suggest'
alias gce='gh copilot explain'
eval "$(gh copilot alias -- zsh)"

# Customize Prompt 
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
