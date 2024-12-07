neofetch
 22
 21 # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh//.zshrc.
 20 if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
 19   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
 18 fi
 17
 16 typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
 15
 14 source $ZDOTDIR/plugins/powerlevel10k/powerlevel10k.zsh-theme
 13
 12 # Customize Prompt
 11 [[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
 10
  9 # load aliasrc if exist
  8 [ -f "${ZDOTDIR}/aliasrc" ] && source "${ZDOTDIR}/aliasrc"
  7
  6 # load optionrc if exist
  5 [ -f "${ZDOTDIR}/optionrc" ] && source "${ZDOTDIR}/optionrc"
  4
  3 # Plugins
  2 source "${ZDOTDIR}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
  1 source "${ZDOTDIR}/plugins/f-sy-h/F-Sy-H.plugin.zsh"
  0 source "${ZDOTDIR}/plugins/zsh-eza/eza.plugin.zsh"
  1 source "${ZDOTDIR}/plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh"
  2
  3 # Lines configured by zsh-newuser-install
  4 HISTFILE=~/.config/zsh/.histfile
  5 HISTSIZE=11000
  6 SAVEHIST=10000
  7
  8 # Completion
  9 fpath=($ZDOTDIR/zfunc $fpath)
 10 zstyle :compinstall filename "/home/b4nd1t/.config/zsh/.zshrc"
 11 autoload -Uz compinit
 12 compinit
 13
 14 # Zoxide
 15 eval "$(zoxide init zsh)"
 16
 17 # Fzf
 18 eval "$(fzf --zsh)"
 19
 20 zmodload zsh/terminfo
 21 bindkey "$terminfo[kcuu1]" history-substring-search-up
 22 bindkey "$terminfo[kcud1]" history-substring-search-down
 23 bindkey '^[[A' history-substring-search-up
 24 bindkey '^[OA' history-substring-search-up
 25 bindkey '^[[B' history-substring-search-down
 26 bindkey '^[OB' history-substring-search-down

# tab completion
 20 zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'           # Case                insensitive tab completion
 19 zstyle ':completion:*' list-colors "${(s.:.)--color=auto}"                                  # Colored             completion (different colors for dirs/files/etc)
 18 zstyle ':completion:*' rehash true                                                          # automatically       find new executables in path
 17 zstyle ':completion:*' menu select                                                          # Highlight menu      selection
 16
 15 # xdg homes
 14 export XDG_CONFIG_HOME="$HOME/.config"
 13 export XDG_DATA_HOME="$HOME/.local/share"
 12 export XDG_CACHE_HOME="$HOME/.cache"
 11
 10 EDITOR=vim
  9 PAGER=vim
  8
  7 export LIBVIRT_DEFAULT_URI="qemu:///system"
  6
  5 # git
  4 alias gcl='git clone --depth 1'
  3 alias gi='git init'
  2 alias ga='git add'
  1 alias gc='git commit -m'
  0 alias gp='git push origin master'
