# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

path=(
  $HOME/bins/
  /usr/local/{bin,sbin}
  /usr/{bin,sbin}
  /{bin,sbin}
  /opt/bin
  $HOME/.stack/programs/x86_64-linux/ghc-7.10.3
  $HOME/.cabal/bin
  $HOME/.local/bin
  $HOME/arcanist/bin
  $HOME/kubernetes/cluster/ubuntu/binaries
  $HOME/.myscripts
)

export EDITOR=vim
export VISUAL=vim

# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

export ZSH=$HOME/.zsh

source $ZSH/alias.zsh
source $ZSH/functions.zsh
source $ZSH/bindkey.zsh
source $HOME/.zpyi/zpyi.zsh
#source $ZSH/autojump.zsh
