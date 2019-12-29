#!/bin/zsh
#          _              
#  _______| |__  _ __ ___ 
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__ 
# /___|___/_| |_|_|  \___|
#              by Andy3153
#                       
# This is my .zshrc that I use everyday
# I kept any old modification that I made too, but they are
# commented away if they don't help with anything
#
# I made everything into simple functions that you can
# enable, switch with others, or disable
#


# Setopt
  function zshrc_setopts ()
  {
    setopt AUTO_CD
    setopt APPEND_HISTORY
    setopt EXTENDED_HISTORY
    setopt prompt_subst
  }
   
# Setting variables
  function zshrc_setvars () 
  {
    # History file configurations
      HISTFILE=$HOME/.zsh/zsh-history
      HISTSIZE=100000
      SAVEHIST=100000
 
    # For the folders
      zshrc_programs=$HOME/.zsh/programs/
      zshrc_plugins=$HOME/.zsh/plugins/
      zshrc_scripts=$HOME/.zsh/scripts/

    # The prompt color, the value here will act as a fallback
      zshrc_promptcolor=yellow

    # Opts out of dotnet telemetry
      DOTNET_CLI_TELEMETRY_OPTOUT=1
  }


# Exporting things
  function zshrc_exporting ()
  {
    export EDITOR=vim
    export BROWSER=firefox
    export FILE_MANAGER=nautilus
    export TERMINAL=xfce4-terminal
    export QT_QPA_PLATFORMTHEME=qt5ct
  } 
   
# Bindkey mode
  function zshrc_bindkeys ()
  {
    # Emacs mode
      bindkey -e

    # Vi mode
      # bindkey -v
  }


# Vim indicators
  function zshrc_vimprompt () 
  {
    # Normal / Insert mode indicator (uncomment if using Vi bindkey mode)
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
  function zshrc_startscript ()
  {
    # brc.sh
      #$zshrc_scripts/brc.sh | $lolcat

    # Neofetch
      #$neofetch

    # ddate
      # With lolcat
        #$zshrc_programs/ddate/ddate | $zshrc_programs/lolcat/bin/lolcat
      # ddate.sh
        $zshrc_scripts/ddate.sh
  }


# Aliases
  function zshrc_aliases ()
  {
     # "clear" aliases
       #alias clear="clear && $zshrc_scripts/brc.sh | $zshrc_programs/lolcat/bin/lolcat"
       #alias clear="clear && $zshrc_programs/neofetch/neofetch"
       #alias clear="clear && $zshrc_scripts/brc.sh"
       #alias clear="clear && $zshrc_programs/ddate/ddate | $zshrc_programs/lolcat/bin/lolcat && echo"
       alias clear="clear && $zshrc_scripts/ddate.sh"

     # Shortcut aliases
       # Package managers
         #alias a="sudo apt"
         alias p="sudo pacman"
         alias y="yay"

       # Common commands
         alias lss="ls -alh"
         alias s="sudo"
         alias c="clear"
         alias cd..="cd .."
         alias cdd="cd .."
         alias 755="chmod 755"
         alias vi="vim"
         alias vim="gvim -v"
         alias v="vim"
         alias f="fuck"
         alias S="sudo systemctl"

       # Git
         alias g="git"
         alias gs="git status"
         alias gc="git clone"
         alias gp="git pull"
         alias gA="git add"
         alias gA.="git add ."
         alias gC="git commit"
         alias gP="git push"

       # Editing configs
         #alias cfz="gvim -v $HOME/.zshrc"
         #alias cfv="gvim -v $HOME/.vim/vimrc"
         alias cfz="kak $HOME/.zshrc"
  
       # Scripts
         alias manpdf="$zshrc_scripts/manpdf.sh"
       
       # idk this one is just neat
         alias thispc="echo && $zshrc_programs/neofetch/neofetch | $zshrc_programs/lolcat/bin/lolcat -t"

       # Reloads zshrc
         alias reloadzsh="source $HOME/.zshrc"
         alias rldzsh="source $HOME/.zshrc"

       #
       # This one helps when you get a command off of the
       # internet which starts with the dollar sign or
       # hashtag. It just runs the command normally
       #
         alias \$=''
         alias \#=''
}

# Colored terminal programs
  function zshrc_coloredprogs ()
  { 
    # man
      function man ()
      {
        LESS_TERMCAP_md=$'\e[01;31m' \
        LESS_TERMCAP_me=$'\e[0m' \
        LESS_TERMCAP_se=$'\e[0m' \
        LESS_TERMCAP_so=$'\e[01;44;33m' \
        LESS_TERMCAP_ue=$'\e[0m' \
        LESS_TERMCAP_us=$'\e[01;32m' \
        command man "$@"
      }

   # ls
     alias ls="ls --color=auto"

   # diff
     alias diff="colordiff"

   # grep
     alias grep="grep --color=auto"
  }


 # Add date to the end of the line (the old way I did it,
 # without the segment from Agnoster's theme
   #RPS1="$PR_LIGHT_YELLOW(%D{%d.%m.%y, %H:%M:%S})$PR_NO_COLOR"

# Sourcing things
  function zshrc_sourcing ()
  {
    # Tilix fix
      if [ $TILIX_ID ] || [ $VTE_VERSION ]
      then source /etc/profile.d/vte.sh
      fi

    # Autosuggestions
    #
    # If we aren't in a tty, it loads it
    # I made this because it doesn't look good at all in tty's
    #
      if [ ! $(tty | grep tty) ]
      then source $zshrc_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
      fi

    # Syntax highlighting
      source $zshrc_plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

    # Simple calculator
      source $zshrc_plugins/calc.plugin.zsh/calc.plugin.zsh

    # You should use alias ...
      source $zshrc_plugins/zsh-you-should-use/you-should-use.plugin.zsh

    # Notifications
      source $zshrc_plugins/zsh-notify/notify.plugin.zsh
  }


#
# Theming
#
# We've first got the functions for every theme, and then
# the functions to set every theme
#

 # Every theme separated into functions
   # Agnoster's theme
     function zshrc_agnostertheme ()
     {
       source $zshrc_plugins/agnoster-zsh-theme/agnoster-$zshrc_promptcolor.zsh-theme
       RPROMPT='$(echo "%{%F{black}%}\ue0b2%{%K{black}%}%{%F{white}%} %D{%d/%m/%y ~ %T} ")'
     }

   # Lightweight theme
     function zshrc_lighttheme ()
     {
       export PS1="%B%F{$zshrc_promptcolor}[ %n@%m ]%f%b %F{white}:%f %F{yellow}%~%f %B%F{cyan}>%b%f "
       export RPS1="%B%F{cyan}<%b%f %D{%d/%m/%y ~ %T}"
     }
    
 
 # The actual theme setting
 
   #
   # Full theme
   #
   # It goes this way:
   # 1. If we are logged in as root, then it makes the prompt red.
   # Else it is blue. 
   # 2. If we are using a tty, then it uses the lightweight theme.
   # Else it uses Agnoster's theme.
   # The two conditions are applied at the same time
   #

     function zshrc_setfulltheme () 
     {
       if [ $UID = 0 ]
       then zshrc_promptcolor=red
       else zshrc_promptcolor=blue
       fi
       
       if [ $(tty | grep tty) ]
       then zshrc_lighttheme
       else zshrc_agnostertheme
       fi
     }

   #
   # Lightweight theme
   #
   # I made this one by myself. Its main use would be either
   # to use it in a tty, like in the full theme setting, or
   # to use it on a slow computer. Or, just to shake things
   # up a little
   #
   # The logic on this one is way simpler:
   # If we are logged in as root, then it makes the prompt red.
   # Else it is blue.
   #
   # I am currently worrking on a git prompt addon for this.
   #
   
     function zshrc_setlighttheme ()
     {
       if [ $UID = 0 ]
       then zshrc_promptcolor=red
       else zshrc_promptcolor=blue
       fi
       
       zshrc_lighttheme
     }


#
# Calling all of the functions
#
# Here all the functions that make the options in the
# zshrc actually get called. This makes it simpler to
# disable what you don't want by just commenting it 
# away.
#

  zshrc_setopts
  zshrc_setvars
  zshrc_exporting
  zshrc_bindkeys
  #zshrc_vimprompt
  zshrc_startscript
  zshrc_aliases
  zshrc_coloredprogs
  zshrc_sourcing
  #zshrc_setfulltheme
  zshrc_setlighttheme


function gitprompt ()
{
if [ -d .git ]
then
     if [ $(git status --porcelain --ignore-submodules) ]
     then echo -e "$color_yellow$(git rev-parse --abbrev-ref HEAD)"
     else echo -e "$color_green$(git rev-parse --abbrev-ref HEAD)"
     fi
fi
}
#export PROMPT="git: $(gitprompt) "



# End of file

