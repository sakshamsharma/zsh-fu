# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export GOROOT=/usr/local/go

fpath+=("${ZSH}/functions")

path=(
  $HOME/bins
  /usr/local/{bin,sbin}
  /usr/{bin,sbin,games}
  /{bin,sbin}
  /opt/bin
  $HOME/.stack/programs/x86_64-linux/ghc-7.10.3/bin
  $HOME/.local/bin
  $HOME/.cabal/bin
  $HOME/go/bin
  $GOROOT/bin
  $HOME/.myscripts
  $HOME/.stack/programs/x86_64-linux/ghc-7.10.3/bin
  $HOME/.stack/programs/x86_64-linux/ghc-tinfo6-8.0.1/bin
  $HOME/.gem/ruby/2.1.0/bin
  $HOME/kubernetes/cluster/ubuntu/binaries
)

export GHC_PACKAGE_PATH=$HOME/.stack/global-project/.stack-work/install/x86_64-linux-tinfo6/lts-7.15/8.0.1/pkgdb:$HOME/.stack/snapshots/x86_64-linux-tinfo6/lts-7.15/8.0.1/pkgdb:$HOME/.stack/programs/x86_64-linux/ghc-tinfo6-8.0.1/lib/ghc-8.0.1/package.conf.d

export WORKON_HOME=~/.envs
export PROJECT_HOME=~/code

export EDITOR=vim
export VISUAL=vim

# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

export GOPATH=$HOME/go
export ZSH=$HOME/.zsh

source $ZSH/alias.zsh
source $ZSH/functions.zsh
source $ZSH/bindkey.zsh
source $HOME/.zpyi/zpyi.zsh
source $HOME/.cookies
#source $ZSH/autojump.zsh

export TERM=xterm-256color

function play() {
EXT="mp3"
while getopts “ht:r:p:v” OPTION
do
    case $OPTION in
        t)
            EXT=$OPTARG
            echo "$EXT extension"
            shift 2
            ;;
        ?)
            usage
            ;;
    esac
done

setopt extendedglob
pat=$(echo -n "$@" | sed -E 's/\s+/\*/g')
list=((#i)**/*${~pat}*.${EXT})
mplayer $list
}

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

source <($HOME/code/kubernetes/cluster/kubectl.sh completion zsh)
gocd () { cd `go list -f '{{.Dir}}' $1` }

function dbash() {
    docker exec -it $1 bash
}

function ldock() {
    docker ps | sed -n 2p | awk '{print($1)}'
}

function lstop() {
    docker rm -f $(docker ps -a | sed -n 2p | awk '{print($1)}')
}

# 10 second wait if you do something that will delete everything.  I wish I'd had this before...
setopt RM_STAR_WAIT
