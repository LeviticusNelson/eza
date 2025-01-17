#!/bin/sh

# Exit if the 'eza' command could not be found
if ! (( $+commands[eza] )); then
    echo "ERROR: 'eza' command not found"
    return
fi

# Create alias override commands using 'eza'
alias ls='eza --group-directories-first --icons'

# Use the --git flag if the installed version of eza supports git
if eza --version | grep -q '+git';
then
	alias ll='ls -lh --git'
else
	alias ll='ls -lh'
fi

alias la='ll -a'
alias tree='ll --tree --level=2'
