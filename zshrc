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
  $HOME/.local/bin
  $HOME/.stack/programs/x86_64-linux/ghc-7.10.3
  $HOME/.cabal/bin
  $HOME/arcanist/bin
  $HOME/kubernetes/cluster/ubuntu/binaries
  $HOME/.myscripts
  $HOME/.stack/programs/x86_64-linux/ghc-7.10.3/bin
)


export GHC_PACKAGE_PATH=$HOME/.stack/global-project/.stack-work/install/x86_64-linux/lts-5.17/7.10.3/pkgdb:$HOME/.stack/snapshots/x86_64-linux/lts-5.17/7.10.3/pkgdb:$HOME/.stack/programs/x86_64-linux/ghc-7.10.3/lib/ghc-7.10.3/package.conf.d

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
source $HOME/.cookies
#source $ZSH/autojump.zsh

# added by travis gem
# [ -f /home/saksham/.travis/travis.sh ] && source /home/saksham/.travis/travis.sh
