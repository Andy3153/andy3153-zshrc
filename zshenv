#!/usr/bin/env zsh
##
## zshenv by Andy3153
## created 26/10/20 ~ 13:03:22
##

# Exporting environment variables
  export\
         PATH=$HOME/.local/bin:$PATH\
        \
         XDG_CONFIG_HOME="$HOME/.config"\
         XDG_DATA_HOME="$HOME/.local/share"\
         XDG_CACHE_HOME="$HOME/.cache"\
        \
         EDITOR=vim\
         BROWSER=firefox\
         FILE_MANAGER=dolphin\
         TERMINAL=konsole\
         QT_QPA_PLATFORMTHEME=qt5ct\
         DOTNET_CLI_TELEMETRY_OPTOUT=1

  export SUDO_PROMPT=$'\033[1m\033[0;31m[sudo]\033[0m password for \033[1m%p\033[0m: '
  export ZDOTDIR="$XDG_CONFIG_HOME/zsh"


# Setting variables
  # History file configurations
    HISTFILE=$ZDOTDIR/zsh-history
    HISTSIZE=100000
    SAVEHIST=100000

  # For the folders
    _plugins=$ZDOTDIR/plugins/
    _scripts=$ZDOTDIR/scripts/


## End of file.
