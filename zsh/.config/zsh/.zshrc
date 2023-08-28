#!/usr/bin/env zsh

# enable completion
autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files
source $ZDOTDIR/plugins/completion.zsh

# cutomize prompt
source $ZDOTDIR/plugins/prompt.zsh
