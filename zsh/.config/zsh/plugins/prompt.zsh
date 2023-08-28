# https://github.com/jackharrisonsherlock/common

# Prompt symbol
COMMON_PROMPT_SYMBOL="❯"

# Colors
COMMON_COLORS_HOST_ME=green
COMMON_COLORS_CURRENT_DIR=blue
COMMON_COLORS_RETURN_STATUS_TRUE=magenta
COMMON_COLORS_RETURN_STATUS_FALSE=yellow
COMMON_COLORS_GIT_STATUS_DEFAULT=green
COMMON_COLORS_GIT_STATUS_UNSTAGED=red
COMMON_COLORS_GIT_STATUS_STAGED=yellow
COMMON_COLORS_GIT_PROMPT_SHA=green
COMMON_COLORS_BG_JOBS=yellow

# Left Prompt
PROMPT='$(current_time)$(common_host)$(common_current_dir)$(common_bg_jobs)%B%F{white}on $(common_git_status)$(common_return_status)'

# Enable redrawing of prompt variables
 setopt promptsubst

# Current time
current_time() {
    echo -n "%F{yellow}[%T] "
}

# Host
common_host() {
  if [[ -n $SSH_CONNECTION ]]; then
    me="%n@%m"
  elif [[ $LOGNAME != $USER ]]; then
    me="%n"
  fi
  if [[ -n $me ]]; then
    echo "%{$fg[$COMMON_COLORS_HOST_ME]%}$me%{$reset_color%}:"
  fi
  if [[ $AWS_VAULT ]]; then
    echo "%{$fg[$COMMON_COLORS_HOST_AWS_VAULT]%}$AWS_VAULT%{$reset_color%} "
  fi
}

# Current directory
common_current_dir() {
  echo -n "$ZSH_THEME_GIT_PROMPT_PREFIX%F{$COMMON_COLORS_CURRENT_DIR}%~ "
}

# Prompt symbol
common_return_status() {
  echo -n "\n%(?.%F{$COMMON_COLORS_RETURN_STATUS_TRUE}.%F{$COMMON_COLORS_RETURN_STATUS_FALSE})$COMMON_PROMPT_SYMBOL%f%b "
}

# Git status
common_git_status() {
    local message=""
    local message_color="%F{$COMMON_COLORS_GIT_STATUS_DEFAULT}"

    # https://git-scm.com/docs/git-status#_short_format
    local staged=$(git status --porcelain 2>/dev/null | grep -e "^[MADRCU]")
    local unstaged=$(git status --porcelain 2>/dev/null | grep -e "^[MADRCU? ][MADRCU?]")

    if [[ -n ${staged} ]]; then
        message_color="%F{$COMMON_COLORS_GIT_STATUS_STAGED}"
    elif [[ -n ${unstaged} ]]; then
        message_color="%F{$COMMON_COLORS_GIT_STATUS_UNSTAGED}"
    fi

    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [[ -n ${branch} ]]; then
        message+="%b%F{green}λ%F{white}: %B${message_color}${branch}%b%f"
    fi

    echo -n "${message} "
}

# Background Jobs
common_bg_jobs() {
  bg_status="%{$fg[$COMMON_COLORS_BG_JOBS]%}%(1j.↓%j .)"
  echo -n $bg_status
}
