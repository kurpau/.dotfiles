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

# Make fzf ignor node modules on .git folders
export FZF_DEFAULT_COMMAND='find . -type d \( -path "*/.git" -o -path "*/node_modules" \) -prune -o -print | sed 1d'

alias python=/usr/local/bin/python3
alias pip=/usr/local/bin/pip3

