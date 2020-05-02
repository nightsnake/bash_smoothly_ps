# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;36m\]\u\[\033[00m\]@\[\033[01;32m\]$(hostname -f)\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='\u@$(hostname -f):\w\$ '
fi
unset color_prompt force_color_prompt

function __git__branch {
	git branch 2> /dev/null| sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

if [[ ${EUID} == 0 ]] ; then
        PS1='\[\033[0;31m\]┌[ \[\033[1;31m\]\H\[\033[1;34m\]: \w \[\033[0;31m\]]\[\033[0m\]\n\[\033[0;31m\]└[ \[\033[1;34m\](\t)\[\033[0m\]\[\033[1;31m\]$(__git__branch)\[\033[0;31m\] \[\033[0m\]\[\033[1;31m\]\u\[\033[0;31m\] ]-> \[\033[0m\]'
else
        PS1='\[\033[0;32m\]┌[ \[\033[1;32m\]\H\[\033[1;34m\]: \w \[\033[0;32m\]]\[\033[0m\]\n\[\033[0;32m\]└[ \[\033[1;34m\](\t)\[\033[0m\]\[\033[1;31m\]$(__git__branch)\[\033[0;31m\] \[\033[0m\]\[\033[1;32m\]\u\[\033[0;32m\] ]-> \[\033[0m\]';

fi

alias ls='ls -alF --color';
alias ll='ls -la';
alias rm='rm -i';
alias mv='mv -i';

unset use_color safe_term match_lhs
export HISTCONTROL=ignoreboth
HISTFILESIZE=2500
HISTSIZE=1000
HISTTIMEFORMAT="%Y/%m/%d %T "
PATH=$PATH:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
