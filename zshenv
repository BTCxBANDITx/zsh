# /etc/zsh/zshenv: system-wide .zshenv file for zsh(1)
#
# This file is surced on all invocations of the shell. 
# If the -f flag is present or if the NO_RCS option is 
# set within this file, all other initialization files
# are skipped.
#
# This file should contain commands to set the command 
# search path, plus other important enviroment variables.
# This file should not contain commands that produce 
# output or assume the shell is attached to a tty.
#
# Global Order: zsshenv, zprofile, zshrc, zlogin

if [[ -z "$PATH" || "$PATH" == "/bin:usr/bin" ]]
then 
        export PATH="/usr/local/bin:/usr/bin:/bin:/usr/games"
fi

if [[ -z "$XDG_CONFIG_HOME" ]] 
then
	export XDG_CONFIG_HOME="$HOME/.config"
fi

if [[ -d "$XDG_CONFIG_HOME/zsh" ]] 
then
	export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
fi