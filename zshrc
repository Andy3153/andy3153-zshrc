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
#


 # History file
   HISTFILE=$HOME/.zsh/zsh-history
   HISTSIZE=100000
   SAVEHIST=1000


 # Bindkey mode
   # Emacs mode
     bindkey -e

   # Vi mode
     # bindkey -v


 # Normal / Insert mode indicator (uncomment if using Vi bindkey mode)
   
   #function zle-line-init zle-keymap-select {
       #VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
       #RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
       #zle reset-prompt
   #}
   #zle -N zle-line-init
   #zle -N zle-keymap-select
   #export KEYTIMEOUT=1
   

 # Normal / Insert mode indicator enabler (uncomment this too if using Vi bindkey mode)
   #RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"


 # Editor
   export EDITOR=vim


 # Make qt5ct work
   QT_QPA_PLATFORMTHEME=qt5ct

 # Set some variables
   # For the folders
     zshrc_programs=$HOME/.zsh/programs/
     zshrc_plugins=$HOME/.zsh/plugins/
     zshrc_scripts=$HOME/.zsh/scripts/


 # Startup script
   # brc.sh
     #$zshrc_scripts/brc.sh | $lolcat

   # Neofetch
     #$neofetch

   # ddate
     # With lolcat
       #$zshrc_programs/ddate/ddate | $zshrc_programs/lolcat/bin/lolcat
     # ddate.sh
       $zshrc_scripts/ddate.sh


 # Aliases
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
       alias v="vim"
       alias vi="vim"
       alias S="sudo systemctl"

     # Git
       alias g="git"
       alias gs="git status"
       alias gc="git clone"
       alias gp="git pull"
       alias gA="git add"
       alias gC="git commit"
       alias gP="git push"

     # idk this one is just neat
       alias thispc="echo && $zshrc_programs/neofetch/neofetch | $zshrc_programs/lolcat/bin/lolcat -t"

     # Reloads zshrc
       alias reloadzsh="source $HOME/.zshrc"
       alias rldzsh="source $HOME/.zshrc"

     # This one helps when you get a command off of the
     # internet which starts with a dollar sign. It just
     # runs it normally.
       alias \$=''


 # For making the 'fuck' command work
   eval $($zshrc_programs/thefuck/thefuck-bin --alias)
     
 
 # Colored terminal programs
   # man
     man() {
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


 # Stop dotnet telemetry
   DOTNET_CLI_TELEMETRY_OPTOUT=1


 # Add date to the end of the line
   RPS1="$PR_LIGHT_YELLOW(%D{%d.%m.%y, %H:%M:%S})$PR_NO_COLOR"


 # Sourcing plugins
   # Autosuggestions
     source $zshrc_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

   # Syntax highlighting
     source $zshrc_plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

   # Simple calculator
     source $zshrc_plugins/calc.plugin.zsh/calc.plugin.zsh

   # You should use alias ...
     source $zshrc_plugins/zsh-you-should-use/you-should-use.plugin.zsh

   # Notifications
     source $zshrc_plugins/zsh-notify/notify.plugin.zsh

   # Agnoster's theme
     source $zshrc_plugins/agnoster-zsh-theme/agnoster.zsh-theme
     setopt prompt_subst # you also need this to make it work


# End of file
