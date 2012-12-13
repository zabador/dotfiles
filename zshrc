fg_black=%{$'\e[0;30m'%}
fg_red=%{$'\e[0;31m'%}
fg_green=%{$'\e[0;32m'%}
fg_brown=%{$'\e[0;33m'%}
fg_blue=%{$'\e[0;34m'%}
fg_purple=%{$'\e[0;35m'%}
fg_cyan=%{$'\e[0;36m'%}
fg_lgray=%{$'\e[0;37m'%}
fg_dgray=%{$'\e[1;30m'%}
fg_lred=%{$'\e[1;31m'%}
fg_lgreen=%{$'\e[1;32m'%}
fg_yellow=%{$'\e[1;33m'%}
fg_lblue=%{$'\e[1;34m'%}
fg_pink=%{$'\e[1;35m'%}
fg_lcyan=%{$'\e[1;36m'%}
fg_white=%{$'\e[1;37m'%}
#Text Background Colors
bg_red=%{$'\e[0;41m'%}
bg_green=%{$'\e[0;42m'%}
bg_brown=%{$'\e[0;43m'%}
bg_blue=%{$'\e[0;44m'%}
bg_purple=%{$'\e[0;45m'%}
bg_cyan=%{$'\e[0;46m'%}
bg_gray=%{$'\e[0;47m'%}
#Attributes
at_normal=%{$'\e[0m'%}
at_bold=%{$'\e[1m'%}
at_italics=%{$'\e[3m'%}
at_underl=%{$'\e[4m'%}
at_blink=%{$'\e[5m'%}
at_outline=%{$'\e[6m'%}
at_reverse=%{$'\e[7m'%}
at_nondisp=%{$'\e[8m'%}
at_strike=%{$'\e[9m'%}
at_boldoff=%{$'\e[22m'%}
at_italicsoff=%{$'\e[23m'%}
at_underloff=%{$'\e[24m'%}
at_blinkoff=%{$'\e[25m'%}
at_reverseoff=%{$'\e[27m'%}
at_strikeoff=%{$'\e[29m'%}

autoload -Uz vcs_info

zstyle ':vcs_info:*:prompt:*' formats "$VCSPROMPT" "[%b]"

precmd() {
vcs_info 'prompt'

setopt CORRECT 

if [ -n vcs_info_msg_0_ ]; then
PROMPT="
${fg_lred}%n@%m${fg_pink}%~ ${fg_cyan}${vcs_info_msg_1_}
${fg_lred}1337ness--> ${at_normal}"
RPROMPT="${fg_green}$(spotify)"
else
PROMPT="
${fg_lred}%n@%m${fg_pink}%~
${fg_lred}1337ness--> ${at_normal}"
fi
}

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

# End of lines added by compinstall
#
autoload -Uz vcs_info

zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(git):*' branchformat '%b%F{1}:%F{3}%r'

alias update-new='sudo emerge --update --deep --ask --newuse world'
alias update='sudo emerge --update --deep --ask world'

dircolors=$HOME/.dircolors-$(tput colors)

if [[ -f $dircolors ]]; then
    eval $(dircolors -b $dircolors)
else
    eval $(dircolors)
fi
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'

cd(){

   builtin cd "$@";
   ls;
}

export PATH=$PATH:/user/bin/jlint
export PATH=$PATH:/home/skye/Downloads/make-3.75
export ANDROID_SDK=/home/skye/.android-sdks
export PATH=$PATH:$ANDROID_SDK/tools
export PATH=$PATH:$ANDROID_SDK/platform-tools
export M2_HOME=/home/skye/uportal/apache-maven-3.0.4
export PATH=$PATH:$M2_HOME/bin
export TOMCAT_HOME=/home/skye/uportal/apache-tomcat-6.0.35
export JAVA_OPTS="-server -XX:MaxPermSize=400m -Xms1024m -Xmx2048m"
export ANT_HOME=/home/skye/uportal/apache-ant-1.8.2
export PATH=$PATH:$ANT_HOME/bin
export PATH=$PATH:/home/skye/uportal/groovy-1.8.5/bin
export JAVA_HOME=/home/skye/uportal/jdk1.6.0_32
export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:/opt/PostgreSQL/9.0/bin/

fpath=(~/.shellStuff/zsh-completions $fpath)
fpath=($fpath ~/.zsh/func)
typeset -U fpath

source /home/skye/.shellStuff/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/skye/.shellStuff/zsh-history-substring-search/zsh-history-substring-search.zsh
source /home/skye/.shellStuff/spot_info.zsh
