# Check if this is an interactive shell.
if [[ $- != *i* ]]; then
    return
fi

# Determine the operating system.
case $(uname -s) in
    Linux)
        _machine=Linux
        ;;
    Darwin)
        _machine=Mac
        ;;
    *)
        _machine=Other
        ;;
esac

# Load the local pre-configuration.
[[ -f ~/.bashrc.pre ]] && source ~/.bashrc.pre

# Set the default pager.
PAGER=less

# Set the default editor.
EDITOR=vim
VISUAL=vim

# Use vi-style command line editing.
set -o vi

# Do not exit the shell with CTRL-D.
set -o ignoreeof

# Check the window size after each command and, if necessary, update the values
# of the LINES and COLUMNS shell variables.
shopt -s checkwinsize

# Fix errors in the spelling of a directory component in a cd command.
shopt -s cdspell

# Append to the history file upon exit instead of overwriting it.
shopt -s histappend

# Set up the command history settings.
HISTSIZE=5000
HISTFILESIZE=15000
HISTCONTROL=ignoreboth  # ignorespace & ignoredups

# Show the Git repository information in the prompt string.
GIT_PS1_SHOWUPSTREAM=auto
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true

# Set the prompt string.
PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[33m\]$(__git_ps1)\[\033[00m\]$ '

# Disable XON/XOFF flow control. This allows the use of CTRL-S to search forward
# in the command history.
stty -ixon

# Make less more friendly for non-text input files.
[[ -x /usr/bin/lesspipe ]] && eval "$(lesspipe)"

# Set up the ls aliases.
if [[ $_machine == Mac ]]; then
    alias ls='ls -GF'
    alias ll='ls -hl'
else
    alias ls='ls --color=auto -Fv'
    alias ll='ls -hl'
fi

# Use enhanced colors for ls if available.
if [[ -x /usr/bin/dircolors ]]; then
    if [[ -f ~/.dircolors ]]; then
        eval "$(dircolors -b ~/.dircolors)"
    else
        eval "$(dircolors -b)"
    fi
fi

# Colorize the output of grep.
export GREP_COLORS='mt=33:ms=33:mc=33:fn=35:ln=35:bn=35:se=37'
alias grep='grep --color=auto'

# Colorize the output of GCC.
export GCC_COLORS='error=31:warning=33:note=32:caret=01;37:locus=35:quote=01;37'
alias gcc='gcc -fdiagnostics-color=auto'

# Load the programmable completion functions.
if [[ -f /usr/share/bash-completion/bash_completion ]]; then
    source /usr/share/bash-completion/bash_completion
elif [[ -f /usr/local/etc/bash_completion ]]; then
    source /usr/local/etc/bash_completion
fi

# Load the base16 color profile.
BASE16_SHELL=~/.config/base16-shell
[[ -f $BASE16_SHELL/profile_helper.sh ]] && eval "$("$BASE16_SHELL/profile_helper.sh")"

# This function is used by various shell scripts to execute computationally
# intensive jobs. By default it runs everything locally, but, by overriding
# it in a shell session or in a script, the jobs can be offloaded to an HPC
# cluster (e.g. Slurm).
execute_job()
{
    "$@"
}

export -f execute_job

# Load the local post-configuration.
[[ -f ~/.bashrc.post ]] && source ~/.bashrc.post

unset _machine
