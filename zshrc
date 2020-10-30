#!/usr/bin/env zsh
##
## zshrc by Andy3153
## created 30/07/19 ~ 10:45:48
## remade  26/10/20 ~ 12:53:21
##

# Zsh configuration
  setopt AUTO_CD APPEND_HISTORY EXTENDED_HISTORY prompt_subst interactive_comments COMPLETE_ALIASES correctall
  autoload -U compinit colors && colors && compinit

# Variables
  # For folders
    _plugins="$ZDOTDIR/plugins/"
    _scripts="$ZDOTDIR/scripts/"
  # History file configuration
    HISTFILE=$ZDOTDIR/zsh-history
    HISTSIZE=100000
    SAVEHIST=100000

# Bindkey mode
  bindkey -e #-v #for Vi mode

# Startup script
  $_scripts/ddate.sh

# Colored terminal programs
  # man
    function man() {LESS_TERMCAP_md=$'\e[01;31m' LESS_TERMCAP_me=$'\e[0m' LESS_TERMCAP_se=$'\e[0m' LESS_TERMCAP_so=$'\e[01;44;33m' LESS_TERMCAP_ue=$'\e[0m' LESS_TERMCAP_us=$'\e[01;32m' command man "$@"}

  # Others
    alias diff="colordiff"\
          grep="grep --color=auto"

# Sourcing
  # Integral parts of Zsh
    source $ZDOTDIR/aliasrc
    source $ZDOTDIR/themerc

  # Plugins
    eval $(dircolors $_plugins/nord_dircolors) # Nord colorscheme for ls

    if [ ! $(tty | grep tty) ]
    then source $_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    fi #source this one only when using a graphical interface, it looks weird in a TTY

    source\
           $_plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh\
           $_plugins/zsh-you-should-use/you-should-use.plugin.zsh\
           $_plugins/zsh-notify/notify.plugin.zsh

##
## Setting a theme
##
## To set a theme, you have to type the theme's function name from the themesrc file.
## Sorry in advance for the very descriptive names for them. *sarcasm*
## List of themes: _setColorful, _setBlocks, _setBlocksDark, _setBlocksv2, _setKeepItSimple, _setArrows
##
  _setArrows


## End of file.
