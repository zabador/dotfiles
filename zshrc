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
#workaround for zsh in ubuntu 12.10
DEBIAN_PREVENT_KEYBOARD_CHANGES=yes

zstyle ':vcs_info:*:prompt:*' formats "$VCSPROMPT" "[%b]"

precmd() {
vcs_info 'prompt'

setopt CORRECT 

if [ -n vcs_info_msg_0_ ]; then
PROMPT="
${fg_lred}%n@%m${fg_pink}%~ $(git_super_status)
${fg_lred}1337ness--> ${at_normal}"
RPROMPT=
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
#alias java="/home/zabador/uportal/jdk1.7.0_13/bin/java"
alias java="/usr/bin/java"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset - %Cblue%cn%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev --date=relative"
alias :wq="echo You are not in Vim, idiot!"
alias ctags="/home/zabador/dotfiles/vim/tags"
alias fixmouse="sudo rmmod psmouse && sudo modprobe psmouse"
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
#bind UP and DOWN arrow keys
for keycode in '[' '0'; do
  bindkey "^[${keycode}A" history-substring-search-up
  bindkey "^[${keycode}B" history-substring-search-down
done
unset keycode


export AWT_TOOLKIT=MToolKit
export PATH=$PATH:/user/bin/jlint
export PATH=$PATH:/home/zabador/Downloads/make-3.75
export PKG_CONFIG_PATH=/home/zabador/.opencv
export ANDROID_SDK=/home/zabador/.android-sdks
export ANDROID_NDK=/home/zabador/.android-ndk
export PATH=$PATH:$ANDROID_NDK
export PATH=$PATH:$PKG_CONFIG_PATH
export PATH=$PATH:$ANDROID_SDK/tools
export PATH=$PATH:$ANDROID_SDK/platform-tools
export M2_HOME=/home/zabador/.apache-maven-3.1.1
export PATH=$PATH:$M2_HOME/bin
export TOMCAT_HOME=/home/zabador/uportal/apache-tomcat-7.0.39
export JAVA_OPTS="-server -XX:MaxPermSize=400m -Xms1024m -Xmx2048m"
export ANT_HOME=/home/zabador/uportal/apache-ant-1.8.2
export PATH=$PATH:$ANT_HOME/bin
export PATH=$PATH:/home/zabador/uportal/groovy-1.8.5/bin
#export JAVA_HOME=/home/zabador/uportal/jdk1.7.0_13
#export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:/opt/PostgreSQL/9.0/bin/
export PATH=$PATH:/home/zabador/.shellStuff/PySpotifyInfo
export PATH=$PATH:/home/zabador/dotfiles/vim/tags
export PATH=$PATH:/home/zabador/.google_appengine

fpath=(~/.shellStuff/zsh-completions $fpath)
fpath=($fpath ~/.zsh/func)
typeset -U fpath

source /home/zabador/.shellStuff/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/zabador/.shellStuff/zsh-history-substring-search/zsh-history-substring-search.zsh
source /home/zabador/.shellStuff/PySpotifyInfo/spot_info.zsh
source /home/zabador/.shellStuff/zsh-git-prompt/zshrc.sh


