#!/usr/bin/env zsh
##
## zshenv by Andy3153
## created 26/10/20 ~ 13:03:22
##
## This is a secondary Zsh configuration file responsible for setting custom environment variables.

# Exporting environment variables
  export\
         PATH=$HOME/.local/bin:$HOME/.local/lib:$PATH\
        \
         XDG_CACHE_HOME="$HOME/.cache"\
         XDG_CONFIG_HOME="$HOME/.config"\
         XDG_DATA_HOME="$HOME/.local/share"\
         XDG_STATE_HOME="$HOME/.local/state"\
        \
         EDITOR="nvim"\
         VISUAL="nvim"\
         BROWSER="firefox"\
         FILE_MANAGER="dolphin"\
         TERMINAL="konsole"\
        \
         QT_QPA_PLATFORMTHEME="qt5ct"\
         DOTNET_CLI_TELEMETRY_OPTOUT="1"\
        \
  GAMEMODERUNEXEC="env __NV_PRIME_RENDER_OFFLOAD=1 env __GLX_VENDOR_LIBRARY_NAME=nvidia env __VK_LAYER_NV_optimus=NVIDIA_only mangohud"

  export SUDO_PROMPT=$' \033[0;31m\033[1msudo\033[0m: \033[1m%p\033[0m > '\
         ZDOTDIR="$XDG_CONFIG_HOME/zsh"\

# ~/ cleanup (xdg-ninja)
  export\
         ANDROID_HOME="$XDG_DATA_HOME/android"\
         CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"\
         GNUPGHOME="$XDG_DATA_HOME/gnupg"\
         GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"\
         GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"\
         KDEHOME="$XDG_CONFIG_HOME/kde"\
         JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"\
         KERAS_HOME="${XDG_STATE_HOME}/keras"\
         TEXMFVAR="$XDG_CACHE_HOME/texlive/texmf-var"\
         WINEPREFIX="$XDG_DATA_HOME/wine"

# Sourcing XDG Dirs
  if [ -e $XDG_CONFIG_HOME/user-dirs.dirs ]
    then source $XDG_CONFIG_HOME/user-dirs.dirs
  fi



## End of file.
