export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="cpjr"

export UPDATE_ZSH_DAYS=1

COMPLETION_WAITING_DOTS="true"

plugins=(git)

DEFAULT_USER=`whoami`

export EDITOR=vim

autoload -U compinit compdef
compinit

source $ZSH/oh-my-zsh.sh

bindkey -v

autoload -U colors
colors

setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

#osx necessity to get vim with python support.
alias python=python3

eval $(thefuck --alias)

#export TERM=rxvt-unicode

#because apple clang blows
#export CC=gcc-13
#export CXX=gcc-13

alias clang++17=/usr/local/opt/llvm/bin/clang++

#export CMAKE_GENERATOR=Ninja

export CLICOLOR=1
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export FPATH=$FPATH:$HOME/zpath
#export PATH=$PATH:$HOME/.local/bin:$HOME/.gem/ruby/2.7.0/bin
# Makes OpenJDK the default.
#export PATH=/usr/local/opt/openjdk/bin:$PATH
# folder for random development binaries I want on the $PATH
export PATH=$PATH:$HOME/DevBinaries

export PATH=$PATH:"/usr/local/opt/llvm/bin"

#compdef pio
_pio() {
  eval $(env COMMANDLINE="${words[1,$CURRENT]}" _PIO_COMPLETE=complete-zsh pio)
}
if [[ "$(basename -- ${(%):-%x})" != "_pio" ]]; then
  compdef _pio pio
fi
