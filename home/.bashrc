#
# ~/.bashrc
#

[[ $- != *i* ]] && return
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

xhost +local:root > /dev/null 2>&1

PS1="\e[32m\u@\h \w\n🍃» \e[0m"

shopt -s checkwinsize
shopt -s expand_aliases
shopt -s histappend
export HISTCONTROL=ignoredups

alias ls='ls --color=auto'
alias more=less
alias lock='env XSECURELOCK_NO_COMPOSITE=1 XSECURELOCK_PASSWORD_PROMPT=asterisks xsecurelock'
alias bat='bat --theme ansi'
if [ "$TERM" == "xterm-kitty" ]; then
  alias ssh="kitty +kitten ssh";
fi


ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

fetch () {
  clear
  if [ "$TERM" == "xterm-kitty" ]
    then fastfetch --logo '/home/leaf/pictures/fetch/4.png' --logo-width 32
    else fastfetch --logo none --logo-padding 1
  fi
}

fetch

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION