#!/usr/bin/sh

HISTFILE=~/.zsh_history

HISTSIZE=1000
SAVEHIST=1000

cdpath=(.. ~)

#prompt="<$USER@%m%%%~> "
#prompt="<`whoami`@%m%%%~> "
prompt="%m$ "
#prompt="wailele$ "
RPROMPT='[%~ %T]'
export LC_ALL=ja_JP.UTF-8
export LANG=ja_JP.UTF-8

export PATH="/Users/miao/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export TERM="xterm-256color"

export  EDITOR=vim

export HISTFILE=~/.history/history.`date +%y%m%d%H%M`

export CVSEDITOR=vim

export LD_NOVERSION=true

export RTAILF_HOSTS="mgweb3 mgweb4 mgweb7 mgweb8 mgweb9 mgweb10 mgweb11 mgweb12 mgweb13 mgweb14 mgweb15 mgweb16 mgweb17 mgweb18 mgweb19 mgweb20 mgweb21 mgweb22 mgweb23 mgweb24"


# compile

export CC='cc'
export CFLAGS='-m64'
export CXX='c++'
export CXXFLAGS='-m64'
export CPPFLAGS="-I/usr/local/include \
        -I/usr/local/ssl/include/openssl"
export LD_LIBRARY_PATH='/usr/local/lib'
export LDFLAGS="-L/usr/local/lib -L/usr/lib"

# rails

alias  autotest_with_cucumber='AUTOFEATURE=true autotest'

# aliases

alias   sl='ls -Fa'
alias   ls='ls -Fa'
alias   la='ls -a'
alias   ll='ls -la'
alias   dir='dir -pa'
alias   rm='rm -i'
alias   cp='cp -i'
alias   mv='mv -i'
alias   vi='vim'
#alias   tar='gnutar'
alias   rdoc='rdoc -c UTF-8 -U'
alias   rcov='RAILS_ENV=test rake simplecov'

# key bind

bindkey -v

#if [ `ps -ef | grep ssh-agent | grep 501 | grep -v grep | wc -l` = 0 ]; then
#  if [ `hostname` = NedateMacNB-103.local ]; then
#    if [ ! -z $STY ]; then
#      ssh-agent -s | head -2 > /Users/miao/.ssh/ssh-agent
#      eval `cat /Users/miao/.ssh/ssh-agent`
#      ssh-add
#    fi
#  fi
#fi
#eval `cat /Users/miao/.ssh/ssh-agent`

#if [ -z $STY ]; then
#  if [ `hostname` = shiemobairu-no-MacBook-Pro.local ]; then
#    screen -U
#    exit
#  fi
#fi

preexec () {
  if [ $STY ]; then
    echo -ne "\ek${1[0,15]}\e\\"
  fi
}

precmd() {
  if [ $STY ]; then
    echo -ne "\ek$(basename $(pwd))\e\\"
  fi
}

function pcolor() {
  for ((f = 0; f <= 255; f++)); do
    printf "\e[38;5;%dm %3d*■\e[m" $f $f
    if [[ $f%8 -eq 7 ]] then
      printf "\n"
    fi
  done
  echo
}


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
