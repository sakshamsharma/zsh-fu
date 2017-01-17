# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

<<<<<<< HEAD
export GOROOT=/usr/local/go

path=(
  $HOME/arcanist/bin
  $HOME/bins/
=======
fpath+=("${ZSH}/functions")

path=(
  $HOME/bins
>>>>>>> Various usability hacks
  /usr/local/{bin,sbin}
  /usr/{bin,sbin,games}
  /{bin,sbin}
  /opt/bin
  $HOME/.stack/programs/x86_64-linux/ghc-7.10.3/bin
  $HOME/.local/bin
  $HOME/.cabal/bin
  $HOME/go/bin
  $GOROOT/bin
  $HOME/kubernetes/cluster/ubuntu/binaries
  $HOME/.myscripts
<<<<<<< HEAD
  $HOME/.stack/programs/x86_64-linux/ghc-7.10.3/bin
  $HOME/go/bin
)

export GHC_PACKAGE_PATH=$HOME/.stack/global-project/.stack-work/install/x86_64-linux/lts-5.17/7.10.3/pkgdb:$HOME/.stack/snapshots/x86_64-linux/lts-5.17/7.10.3/pkgdb:$HOME/.stack/programs/x86_64-linux/ghc-7.10.3/lib/ghc-7.10.3/package.conf.d
=======
  $HOME/.stack/programs/x86_64-linux/ghc-tinfo6-8.0.1/bin
  $HOME/.gem/ruby/2.1.0/bin
  $HOME/go/bin
)


export GHC_PACKAGE_PATH=$HOME/.stack/global-project/.stack-work/install/x86_64-linux-tinfo6/lts-7.15/8.0.1/pkgdb:$HOME/.stack/snapshots/x86_64-linux-tinfo6/lts-7.15/8.0.1/pkgdb:$HOME/.stack/programs/x86_64-linux/ghc-tinfo6-8.0.1/lib/ghc-8.0.1/package.conf.d

export GOPATH=$HOME/go
export WORKON_HOME=~/.envs
export PROJECT_HOME=~/code
>>>>>>> Various usability hacks

export EDITOR=vim
export VISUAL=vim

export GHC_PACKAGE_PATH=/home/ssharma/.stack/global-project/.stack-work/install/x86_64-linux/lts-5.17/7.10.3/pkgdb:/home/ssharma/.stack/snapshots/x86_64-linux/lts-5.17/7.10.3/pkgdb:/home/ssharma/.stack/programs/x86_64-linux/ghc-7.10.3/lib/ghc-7.10.3/package.conf.d:$GHC_PACKAGE_PATH

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
