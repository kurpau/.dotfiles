#!/usr/bin/env zsh

# Enable and improve completion
autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files
source $ZDOTDIR/plugins/completion.zsh

# Customized prompt
source $ZDOTDIR/plugins/prompt.zsh

# Vi mode
bindkey -v
export KEYTIMEOUT=1

# Cursor for Normal and Insert modes
source $ZDOTDIR/plugins/dynamic_cursor.zsh

# Zsh Directory Stack
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index
