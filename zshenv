#!/usr/bin/env zsh
##
## zshenv by Andy3153
## created 26/10/20 ~ 13:03:22
##
## This is a secondary Zsh configuration file responsible for setting custom environment variables.

# Exporting environment variables
  export\
         PATH=$HOME/.local/bin:$PATH\
        \
         XDG_CONFIG_HOME="$HOME/.config"\
         XDG_DATA_HOME="$HOME/.local/share"\
         XDG_CACHE_HOME="$HOME/.cache"\
        \
         EDITOR="nvim"\
	 VISUAL="nvim"\
         BROWSER="firefox"\
         FILE_MANAGER="dolphin"\
         TERMINAL="konsole"\
        \
         QT_QPA_PLATFORMTHEME="qt5ct"\
         DOTNET_CLI_TELEMETRY_OPTOUT="1"

  export SUDO_PROMPT=$'\033[1m\033[0;31m[sudo]\033[0m password for \033[1m%p\033[0m: '\
         ZDOTDIR="$XDG_CONFIG_HOME/zsh"\


## End of file.
