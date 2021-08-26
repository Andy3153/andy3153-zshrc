#!/usr/bin/env zsh
##
## zshrc by Andy3153
## created 30/07/19 ~ 10:45:48
## remade  26/10/20 ~ 12:53:21
##
## This is the main Zsh configuration file.
##
## Note: INSANELY useful for debugging is using the 'zsh -v' option to see in which order are things executed.
##

# Zsh configuration
  setopt AUTO_CD APPEND_HISTORY EXTENDED_HISTORY prompt_subst interactive_comments COMPLETE_ALIASES correctall
  autoload -U compinit colors && compinit ; colors 

# Variables
  # For folders
    _plugins="$ZDOTDIR/plugins/"
    _scripts="$ZDOTDIR/scripts/"
  # History file configuration
    HISTFILE=$ZDOTDIR/zsh-history
    HISTSIZE=100000
    SAVEHIST=100000

# Startup script
  $_scripts/ddate.sh

# Sourcing
  # Integral parts of Zsh
    source $HOME/.zshenv
    source $ZDOTDIR/aliasrc
    source $ZDOTDIR/keysrc
    source $ZDOTDIR/colorrc
    source $ZDOTDIR/themerc

  # Plugins
    if [ ! $(tty | grep tty) ]
    then source $_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    fi #source this one only when using a graphical interface, it looks weird in a TTY

    source $_plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

##
## Setting a theme
##
## To set a theme, you have to type the theme's function name from the themesrc file.
## Sorry in advance for the very descriptive names for them. *sarcasm*
## List of themes: _setColorful, _setBlocks, _setBlocksDark, _setBlocksv2, _setKeepItSimple, _setArrows _setArrowsGit
##
  #_setArrows
  _setArrowsGit


## End of file.
