#!/usr/bin/env zsh

# This script searches for directories in specified paths.
# If only one argument is passed, it assigns it to 'selected'.
# Otherwise, it displays a list of directories found by 'find' command and allows user to select one using 'fzf'.
# If no directory is selected, it exits.

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/repos ~/projects ~/Desktop -mindepth 1 -maxdepth 1 -type d | fzf)
fi

# Exit if no directory is selected.
if [[ -z $selected ]]; then
    exit 0
fi

# Replace all dots in directory name with underscores.
selected_name=$(basename "$selected" | tr . _)

# Check if tmux is running.
tmux_running=$(pgrep tmux)

# Create new tmux session if none exists.
if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

# Create new tmux session if none exists with same name as selected directory.
if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

# Switch to newly created or existing tmux session.
tmux switch-client -t $selected_name.

