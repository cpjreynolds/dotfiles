export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="cpjr"

export UPDATE_ZSH_DAYS=1

COMPLETION_WAITING_DOTS="true"

plugins=(git)

DEFAULT_USER=`whoami`

export EDITOR=vim
#export TERM=xterm-256color

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

# personal development help
function mkhera() {
    make -j -C $HOME/hera/build $@
}
function runhera() {
    make -j -C $HOME/hera/build run
}
function runherab() {
    make -j -C $HOME/hera/build runbundle
}

function mkmed() {
    make -j -C $HOME/medit/build $@
}

function mknc() {
    make -j -C $HOME/ncpp/build $@
}

function runnc() {
    make -j -C $HOME/ncpp/build run
}

#because apple clang blows
export CC=/opt/homebrew/opt/llvm/bin/clang
export CXX=/opt/homebrew/opt/llvm/bin/clang++

export LDFLAGS="-L/opt/homebrew/opt/llvm/lib -L/opt/homebrew/opt/llvm/lib/c++"
#export LDFLAGS="-Wl,-rpath,/opt/homebrew/opt/llvm/lib/c++":$LDFLAGS
export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/llvm/lib/unwind -lunwind"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
#export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export SDKROOT=$(xcrun --show-sdk-path)

# ncurses from homebrew
LDFLAGS+=" -L/opt/homebrew/opt/ncurses/lib"
CPPFLAGS+=" -I/opt/homebrew/opt/ncurses/include"

export CLICOLOR=1
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/homebrew/lib
export FPATH=$FPATH:$HOME/zpath
export PATH=/opt/homebrew/bin:$PATH
#export PATH=$PATH:$HOME/.local/bin
export PATH="/opt/homebrew/opt/llvm/bin":$PATH
export XML_CATALOG_FILES="$HOMEBREW_PREFIX/etc/xml/catalog"

default=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)
purple=$(tput setaf 5)
orange=$(tput setaf 9)

export MANPAGER=less
# Less colors for man pages
export PAGER=less
# Begin blinking
export LESS_TERMCAP_mb=$red
# Begin bold
export LESS_TERMCAP_md=$orange
# End mode
export LESS_TERMCAP_me=$default
# End standout-mode
export LESS_TERMCAP_se=$default
# Begin standout-mode - info box
export LESS_TERMCAP_so=$purple
# End underline
export LESS_TERMCAP_ue=$default
# Begin underline
export LESS_TERMCAP_us=$green

#compdef pio
_pio() {
  eval $(env COMMANDLINE="${words[1,$CURRENT]}" _PIO_COMPLETE=complete-zsh pio)
}
if [[ "$(basename -- ${(%):-%x})" != "_pio" ]]; then
  compdef _pio pio
fi

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/cpjreynolds/.cache/lm-studio/bin"
# End of LM Studio CLI section

