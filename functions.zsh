# Run `ls` on a return press if the input is empty for now
accept-line() {
  if [[ -z $BUFFER ]]; then
    zle -I
    ls
  else
    zle ".$WIDGET"
  fi
}
zle -N accept-line

# Close Vim with Ctrl+z and then reopen it with Ctrl+z
# Credit: sheerun.net
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z


# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

zstyle ':filter-select:highlight' matched fg=green
zstyle ':filter-select' max-lines 3
zstyle ':filter-select' case-insensitive yes # enable case-insensitive
zstyle ':filter-select' extended-search yes # see below

function run_disowned() {
  "$@" & disown
}

# run_disowned and silenced
# Usage: dos <command>
function dos() {
  run_disowned "$@" 1>/dev/null 2>/dev/null
}

function proxy() {
    export HTTP_PROXY=$1
    export HTTPS_PROXY=$1
    export http_proxy=$1
    export https_proxy=$1
}

function hcave() {
    http -v $1 "localhost:7771${2}" ${@:3} $COOKIE $XSRF
}

function tn() {
    tmux new -s "$1"
}

function ta() {
    tmux attach -t "$1"
}

function chat() {
    touch chat
    echo "[`whoami`]: $@" >> chat
}
