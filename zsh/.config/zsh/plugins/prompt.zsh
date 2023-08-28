# Colors
PROMPT_SYMBOL="❯"

# Color definitions for better readability
COLOR_GREEN="%F{green}"
COLOR_BLUE="%F{blue}"
COLOR_MAGENTA="%F{magenta}"
COLOR_YELLOW="%F{yellow}"
COLOR_RED="%F{red}"
COLOR_WHITE="%F{white}"
COLOR_GRAY="%F{gray}"

# Color assignments
COLOR_HOST_ME=$COLOR_GREEN
COLOR_CURRENT_DIR=$COLOR_BLUE
COLOR_RETURN_STATUS_SUCCESS=$COLOR_MAGENTA
COLOR_RETURN_STATUS_FAIL=$COLOR_RED
COLOR_GIT_STATUS_DEFAULT=$COLOR_GRAY
COLOR_GIT_STATUS_CLEAN=$COLOR_GREEN
COLOR_GIT_STATUS_UNSTAGED=$COLOR_RED
COLOR_GIT_STATUS_STAGED=$COLOR_YELLOW
COLOR_BG_JOBS=$COLOR_YELLOW

GIT_PROMPT_BEHIND="%B$COLOR_RED%f%b "
GIT_PROMPT_AHEAD="%B$COLOR_GREEN%f%b "

PROMPT='$(display_current_time)$(display_host)$(display_current_dir)$(display_bg_jobs)$(display_git_status)$(display_return_status)'

setopt promptsubst

display_current_time() {
    echo -n "${COLOR_GRAY}[%T] "
}

display_current_dir() {
  echo -n "$GIT_PROMPT_PREFIX$COLOR_CURRENT_DIR%~ "
}

display_return_status() {
  echo -n "\n%(?.${COLOR_RETURN_STATUS_SUCCESS}.${COLOR_RETURN_STATUS_FAIL})$PROMPT_SYMBOL%f%b "
}

display_git_status() {
    local git_index=$(git status --porcelain 2> /dev/null)
    local git_status="$COLOR_WHITE%Bon "
    local git_status_color=$COLOR_GIT_STATUS_DEFAULT

    if [[ -z $git_index ]]; then
        git_status_color=$COLOR_GIT_STATUS_CLEAN
    elif [[ $(echo "$git_index" | command grep -e "^[MADRCU]") ]]; then
        git_status_color=$COLOR_GIT_STATUS_STAGED
    elif [[ $(echo "$git_index" | command grep -e "^[MADRCU? ][MADRCU?]") ]]; then
        git_status_color=$COLOR_GIT_STATUS_UNSTAGED
    fi

    local branch_name=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [[ -n $branch_name ]]; then
        git_status+="$COLOR_WHITE ${git_status_color}%B${branch_name}%b%f"
    fi

    local branch_status=$(git status -sb 2>/dev/null | grep '^##' | sed 's/^## //')
    [[ $branch_status == *ahead* ]] && git_status+=" $GIT_PROMPT_AHEAD"
    [[ $branch_status == *behind* ]] && git_status+=" $GIT_PROMPT_BEHIND"

    echo -n "${git_status} "
}

display_host() {
    local user_host=""
    [[ -n $SSH_CONNECTION ]] && user_host="%n@%m"
    [[ $LOGNAME != $USER ]] && user_host="%n"
    [[ -n $user_host ]] && echo "${COLOR_HOST_ME}$user_host$reset_color:"
}

display_bg_jobs() {
  local jobs_status="${COLOR_BG_JOBS}%(1j.↓%j .)"
  echo -n $jobs_status
}

