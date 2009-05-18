############################################################
## This file is sourced by all *interactive* bash shells 
## on startup. This file *should generate no output* or it
## will break the scp and rcp commands.
############################################################

if [ -e /etc/bashrc ] ; then
  . /etc/bashrc
fi


############################################################
## PATH
############################################################

if [ -d ~/bin ] ; then
  PATH="~/bin:${PATH}"
fi

if [ -d /usr/local/bin ] ; then
  PATH="${PATH}:/usr/local/bin"
fi

if [ -d /usr/local/sbin ] ; then
  PATH="${PATH}:/usr/local/sbin"
fi

# MacPorts
if [ -d /opt/local/bin ] ; then
  PATH="${PATH}:/opt/local/bin"
fi
if [ -d /opt/local/sbin ] ; then
  PATH="${PATH}:/opt/local/sbin"
fi
if [ -d /opt/local/share/man ] ; then
  MANPATH="${MANPATH}:/opt/local/share/man"
fi

# MySql
if [ -d /usr/local/mysql/bin ] ; then
  PATH="${PATH}:/usr/local/mysql/bin"
fi
if [ -d /usr/local/mysql/man ] ; then
  MANPATH="${MANPATH}:/usr/local/mysql/man"
fi

# Dev Tools
if [ -d /usr/local/arm-apple-darwin/bin/ ] ; then
  PATH="${PATH}:/usr/local/arm-apple-darwin/bin/"
fi

# Setting PATH for MacPython 2.5
if [ -d /opt/local/share/man ] ; then
  PATH="${PATH}:/Library/Frameworks/Python.framework/Versions/Current/bin"
fi

PATH=.:${PATH}


############################################################
## Other paths
############################################################


############################################################
## Optional shell behavior
############################################################

source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/private_settings

export PAGER="less"
if [ -e /bin/mate -o /opt/local/bin/mate ] ; then
  export EDITOR="mate -w"
  export CVSEDITOR="mate -w"
  export SVN_EDITOR="mate -w"
  export GIT_EDITOR="mate -w"
else
  export EDITOR=vim
  export CVSEDITOR=vim
  export GIT_EDITOR=vim
  export SVN_EDITOR=vim
fi

export LC_CTYPE=en_US.UTF-8

export HISTCONTROL=erasedups
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTIGNORE="&:pwd:ls:ll:lal:[bf]g:exit:rm*:sudo rm*"
export HISTTIMEFORMAT='%b %d %H:%M:%S: '

shopt -s histappend
set cmdhist
shopt -s histverify
shopt -s histreedit


############################################################
## Other
############################################################

# MacPorts OpenSSL doesn't have a ca bundle, so piggy back on Curl's
if [ -f /opt/local/share/curl/curl-ca-bundle.crt ] ; then
  export SSL_CERT_FILE="/opt/local/share/curl/curl-ca-bundle.crt"
fi


############################################################
