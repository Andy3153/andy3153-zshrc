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

 # Setopt
   setopt AUTO_CD
   setopt APPEND_HISTORY
   setopt EXTENDED_HISTORY


 # History file
   HISTFILE=$HOME/.zsh/zsh-history
   HISTSIZE=100000
   SAVEHIST=100000


 # Exporting things
   export EDITOR=vim
   export BROWSER=firefox
   export FILE_MANAGER=nautilus
   export TERMINAL=xfce4-terminal
   export QT_QPA_PLATFORMTHEME=qt5ct
   
   
 # Bindkey mode
   # Emacs mode
     bindkey -e

   # Vi mode
     # bindkey -v


 # Functions
   # Vim indicators
     function vim_prompt () 
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
function aliases ()
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
       alias cfz="gvim -v $HOME/.zshrc"
       alias cfv="gvim -v $HOME/.vim/vimrc"
  
     # Scripts
       alias manpdf="$zshrc_scripts/manpdf.sh"
       
     # idk this one is just neat
       alias thispc="echo && $zshrc_programs/neofetch/neofetch | $zshrc_programs/lolcat/bin/lolcat -t"

     # Reloads zshrc
       alias reloadzsh="source $HOME/.zshrc"
       alias rldzsh="source $HOME/.zshrc"

     # This one helps when you get a command off of the
     # internet which starts with the dollar sign or
     # hashtag. It just runs the command normally
       alias \$=''
       alias \#=''
}

 # For making the 'fuck' command work
   eval $($zshrc_programs/thefuck/thefuck-bin --alias)
     
function colored_progs ()
{ 
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
}


 # Stop dotnet telemetry
   DOTNET_CLI_TELEMETRY_OPTOUT=1


 # Add date to the end of the line (the old way I did it,
 # without the segment from Agnoster's theme
   #RPS1="$PR_LIGHT_YELLOW(%D{%d.%m.%y, %H:%M:%S})$PR_NO_COLOR"

function source_plugins ()
{
 # Sourcing plugins
   # Autosuggestions
     # If we aren't in a tty, it loads it
     # I made this because it doesn't look good at all in tty's
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

function set_full_theme () 
{
 # Setting a theme
 #
 # The theme setting goes this way:
 # 1. If we are logged in as root, then it makes the prompt red.
 # Else it is blue. 
 # 2. If we are using a tty, then it uses a text-based theme.
 # Else it uses Agnoster's theme.
 # The two conditions can be applied at the same time
 #
 # This took 2 hours thx
 # 

   if [ $UID = 0 ]
   then
        if [ $(tty | grep tty) ]
        then
             export PS1="%B%F{red}[ %n@%m ]%f%b %F{white}:%f %F{yellow}%~%f %B%F{cyan}>%b%f "
             export RPS1="%B%F{cyan}<%b%f "$(date +"%d/%m/%y ~ %H:%M:%S")""
     
        else
             source $zshrc_plugins/agnoster-zsh-theme/agnoster-root.zsh-theme
             setopt prompt_subst
             prompt_time() {echo "%{%F{black}%}\ue0b2%{%K{black}%}%{%F{white}%} $(date +"%d/%m/%y ~ %H:%M:%S") "}
             build_right_prompt() {prompt_time}
             RPROMPT='$(build_right_prompt)' 
        fi

   else
        if [ $(tty | grep tty) ]
        then
              export PS1="%B%F{blue}[ %n@%m ]%f%b %F{white}:%f %F{yellow}%~%f %B%F{cyan}>%b%f "
              export RPS1="%B%F{cyan}<%b%f "$(date +"%d/%m/%y ~ %H:%M:%S")""

        else
             source $zshrc_plugins/agnoster-zsh-theme/agnoster.zsh-theme
             setopt prompt_subst
     	     prompt_time() {echo "%{%F{black}%}\ue0b2%{%K{black}%}%{%F{white}%} $(date +"%d/%m/%y ~ %H:%M:%S") "}
             build_right_prompt() {prompt_time}
             RPROMPT='$(build_right_prompt)'
        fi
   fi
}
  # Or, if you want a simple, text-only theme, uncomment these


function set_light_theme ()
{
    if [ $UID = 0 ]
    then
         export PS1="%B%F{red}[ %n@%m ]%f%b %F{white}:%f %F{yellow}%~%f %B%F{cyan}>%b%f "
         export RPS1="%B%F{cyan}<%b%f "$(date +"%d/%m/%y ~ %H:%M:%S")""
    else 
         export PS1="%B%F{blue}[ %n@%m ]%f%b %F{white}:%f %F{yellow}%~%f %B%F{cyan}>%b%f "
         export RPS1="%B%F{cyan}<%b%f "$(date +"%d/%m/%y ~ %H:%M:%S")""
    fi
}


# End of file

source funchzsh
