#!/bin/zsh

# .zshrc by Andy3153
# This is my .zshrc that I use everyday
# I kept any old modification that I made too, but they are commented away if they don't help with anything


 # History file
   HISTFILE=$HOME/.zsh-history
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


 # Startup script
   # brc.sh
     #$HOME/.zsh/scripts/brc.sh | lolcat
   
   # Neofetch
     #$HOME/.zsh/programs/neofetch/neofetch

   # ddate
     # ddate | lolcat
       $HOME/.zsh/scripts/ddate.sh
     

 # Aliases
   # "clear" aliases 
     #alias clear="clear && $HOME/.zsh/scripts/brc.sh | lolcat"
     #alias clear="clear && $HOME/.zsh/programs/neofetch/neofetch"
     #alias clear="clear && $HOME/.zsh/scripts/brc.sh"
     #alias clear="clear && ddate | lolcat && echo"
     alias clear="clear && $HOME/.zsh/scripts/ddate.sh"

   # Shortcut aliases
     alias vi="vim"
     #alias a="sudo apt"
     alias p="sudo pacman"
     alias l="ls"
     alias lss="ls -alh"
     alias s="sudo echo"
     alias y="yay"
     alias c="clear"
     alias v="vim"
     alias cd..="cd .."
     alias thispc="echo && neofetch | lolcat -t"
     alias reloadzsh="source $HOME/.zshrc"


 # For making the 'fuck' command work
   eval $($HOME/.zsh/programs/thefuck/thefuck-bin --alias)
     
 
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


 # Add date to the end of the line
   RPS1="$PR_LIGHT_YELLOW(%D{%d.%m.%y, %H:%M:%S})$PR_NO_COLOR"


 # Sourcing things
   # Syntax highlighting
     source $HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

   # Autosuggestions
     source $HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

   # Agnoster's theme
     source $HOME/.zsh/plugins/agnoster-zsh-theme/agnoster.zsh-theme
     setopt prompt_subst # you also need this to make it work

# #############################
