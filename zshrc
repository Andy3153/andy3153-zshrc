#!/bin/zsh
#          _
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|
#              by Andy3153
#
# This is my .zshrc that I use everyday
# Cleared it up a bit as well
#

# Setopt & autoload
  setopt AUTO_CD APPEND_HISTORY EXTENDED_HISTORY prompt_subst interactive_comments COMPLETE_ALIASES correctall
  autoload -U compinit colors && colors && compinit


# Bindkey mode
  bindkey -e #-v #for Vi mode


# Setting variables
  # History file configurations
    HISTFILE=$HOME/.zsh/zsh-history
    HISTSIZE=100000
    SAVEHIST=100000

  # For the folders
    _progs=$HOME/.zsh/progs/
    _plugins=$HOME/.zsh/plugins/
    _scripts=$HOME/.zsh/scripts/

  # The prompt color, the value here will act as a fallback
    _promptcolor=yellow

  # Opts out of dotnet telemetry
    DOTNET_CLI_TELEMETRY_OPTOUT=1


# Exporting things
  export SUDO_PROMPT=$'\033[1m\033[0;31m[sudo]\033[0m password for \033[1m%p\033[0m: '
  export\
         EDITOR="vim" #kak\
         BROWSER=vivaldi-stable\
         FILE_MANAGER=dolphin\
         TERMINAL=konsole\
         QT_QPA_PLATFORMTHEME=qt5ct\
         PATH=$_scripts:$PATH


# Vim indicators (enable if you want it)
  function _vimprompt()
  {
    function zle-line-init zle-keymap-select
    {
      VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
      RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
      zle reset-prompt
    }

    zle -N zle-line-init
    zle -N zle-keymap-select
    export KEYTIMEOUT=1

    # Normal / Insert mode indicator enabler
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
  }


# Startup script
  # brc.sh
    #$_scripts/brc.sh | $lolcat

  # Neofetch
    #$neofetch

  # ddate.sh
    $_scripts/ddate.sh

  # Change terminal tab name as well
    #echo -ne "\033]30;Welcome back, $USER.\007"


# Aliases
  alias\
        clear="clear && $_scripts/ddate.sh"\
       \
        p="sudo pacman"\
        y="yay"\
       \
        ls="ls --color=always -F --group-directories-first"\
        lss="ls -alh"\
        cd..="cd .."\
        E="exit"\
        :q="exit"\
        755="chmod 755"\
        vi="vim"\
        vim="vim"\
        svim="sudo vim"\
        skak="sudo kak"\
        S="sudo systemctl"\
        r="ranger"\
        catt="less -FX"\
        ytop="ytop -apsm"\
        windowpid="xprop _NET_WM_PID"\
       \
        g="git"\
        gs="git status"\
        gc="git clone"\
        gp="git pull"\
        gA="git add"\
        gA.="git add ."\
        gC="git commit"\
        gP="git push"\
       \
        cfz="$EDITOR $HOME/.zshrc"\
        cfv="$EDITOR $HOME/.vim/vimrc"\
        cfr="$EDITOR $HOME/.config/ranger/rc.conf"\
        cfstab="sudo $EDITOR /etc/fstab"\
       \
        thispc="echo && $_programs/neofetch/neofetch | $_programs/lolcat/bin/lolcat -t"\
        parrotgif="curl parrot.live"\
        weather="curl wttr.in"\
       \
        cmatrix="cmatrix -abC cyan"\
        tty-clock="tty-clock -sBcC 4"\
       \
        rldzsh="source $HOME/.zshrc"\
       \
        \$=''

         
# Colored terminal programs
  # man
    function man()
    {
      LESS_TERMCAP_md=$'\e[01;31m' \
      LESS_TERMCAP_me=$'\e[0m' \
      LESS_TERMCAP_se=$'\e[0m' \
      LESS_TERMCAP_so=$'\e[01;44;33m' \
      LESS_TERMCAP_ue=$'\e[0m' \
      LESS_TERMCAP_us=$'\e[01;32m' \
      command man "$@"
    }

  # Others
    alias\
          diff="colordiff"\
          grep="grep --color=auto"


# Sourcing things
  eval $(dircolors $_plugins/nord_dircolors) # Nord colorscheme for ls

  if [ ! $(tty | grep tty) ]
  then source $_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
  fi

  source\
         $_plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh\
         $_plugins/zsh-you-should-use/you-should-use.plugin.zsh\
         $_plugins/zsh-notify/notify.plugin.zsh


#
# Theming
#
# We've first got the functions for every theme, and then
# the functions to set every theme
#

 # Every theme separated into functions
   # Agnoster's theme
     function _agnostertheme ()
     {
       source $_plugins/agnoster-zsh-theme/agnoster-$_promptcolor.zsh-theme
       RPROMPT='$(echo "%{%F{black}%}\ue0b2%{%K{black}%}%{%F{white}%} %D{%d/%m/%y ~ %T} ")'
     }

   # Colorful theme
     function _colorfultheme ()
     {
       export PS1="%B%F{$_promptcolor}[ %n@%m ]%f%b %F{white}:%f %F{yellow}%~%f %B%F{cyan}>%b%f "
       export RPS1="%B%F{cyan}<%b%f %D{%d/%m/%y ~ %T}"
     }
     
   # Blocks theme
     function _blockstheme ()
     {
       emojis=('☺' '☻' '🌜' '🐭' '🐮' '🐱' '🐵' '😀' '😁' '😂' '😃' '😄' '😅' '😆' '😇' '😈' '😉' '😊' '😋' '😌' '😍' '😎' '😏' '😗' '😘' '😙' '😚' '😛' '😜' '😝' '😴' '😵' '😶' '😷' '😸' '😹' '😺' '😻' '😼' '😽' '😾' '😿' '🙀' '🙃' '🤖')
       export PS1="%(?.%K{green}%F{black} √ %f%k.%K{red}%F{black} × %f%k)%K{black} ${emojis[$(($RANDOM%43))]} %n %k%K{$_promptcolor}%F{black} > %f%k "
       export RPS1="%K{$_promptcolor}%F{black} 🗁  %(5~|%-2~/…/%2~|%4~) %f%k%K{yellow}%F{black} 🗏 %h %f%k"
     }

   # Blocks Dark theme
     function _blocksdarktheme ()
     {
       export PS1="%(?.%K{black}%F{green} √ %f%k.%K{black}%F{red} × %f%k)%K{black}%F{$_promptcolor}| %n %k%K{black}| ⯈  %f%k "
       export RPS1="%K{black}%F{$_promptcolor} 🗁  %(5~|%-2~/…/%2~|%4~) |%f%k%K{black}%F{yellow} 🗏 %h %f%k"
     }
    
 
 # The actual theme setting
 
   # Full theme
     function _setagnostertheme () 
     {
       if [ $UID = 0 ]
       then _promptcolor=red
       else _promptcolor=blue
       fi
       
       if [ $(tty | grep tty) ]
       then _blockstheme
       else _agnostertheme
       fi
     }

   # Colorful theme
     function _setcolorfultheme ()
     {
       if [ $UID = 0 ]
       then _promptcolor=red
       else _promptcolor=blue
       fi
       
       _colorfultheme
     }

   # Blocks theme
     function _setblockstheme ()
     {
       if [ $UID = 0 ]
       then _promptcolor=red
       else _promptcolor=blue
       fi
       
       _blockstheme
     }

   # Blocks Dark theme
     function _setblocksdarktheme ()
     {
       if [ $UID = 0 ]
       then _promptcolor=red
       else _promptcolor=blue
       fi
       
       _blocksdarktheme
     }



#
# Calling the functions
#
# Here you call the functions for the theme you chose, plus the Vim prompt one
#

  #_vimprompt
  #_setagnostertheme
  #_setcolorfultheme
  #_setblockstheme
  _setblocksdarktheme



# End of file
