## vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}} ft=zsh:
##
## zshenv by Andy3153
## created 26/10/20 ~ 13:03:22
## remade 11/03/24 ~ 01:34:23
##

# {{{ Fix double slash in vars containing $HOME
##
## Some environments, OSes etc., from what I've noticed, can either store $HOME
## as `/home/$USER` or as `/home/$USER/`. This just removes the slash at the
## end if present as it can lead to some issues (if we pretend the slash isn't
## there, in some environments that leads to no longer having a path separator,
## and if we leave it there and then add it it can mess up some LaTeX stuff
## (double slash in a path means something different))
##

if [ $(printf "%s" $HOME | tail -c 1) = "/" ]
then HOME=${HOME%?}
fi
# }}}

# {{{ NixOS/Home Manager stuff
# Source Home Manager session variables
if [ -e "${HOME}/.nix-profile/etc/profile.d/hm-session-vars.sh" ]
then source "${HOME}/.nix-profile/etc/profile.d/hm-session-vars.sh"
elif [ -e "/etc/profiles/per-user/${USER}/etc/profile.d/hm-session-vars.sh" ]
then source "/etc/profiles/per-user/${USER}/etc/profile.d/hm-session-vars.sh"
fi
# }}}

# {{{ Environment variables
# {{{ XDG Base Directories
[ -z "${XDG_CACHE_HOME// }" ]  || export XDG_CACHE_HOME="${HOME}/.cache"
[ -z "${XDG_CONFIG_HOME// }" ] || export XDG_CONFIG_HOME="${HOME}/.config"
[ -z "${XDG_DATA_HOME// }" ]   || export XDG_DATA_HOME="${HOME}/.local/share"
[ -z "${XDG_STATE_HOME// }" ]  || export XDG_STATE_HOME="${HOME}/.local/state"
# }}}

# {{{ Zsh folders
ZDOTDIR="${XDG_CONFIG_HOME}/zsh"  # Config location
ZDATADIR="${XDG_DATA_HOME}/zsh"   # Data location
ZCACHEDIR="${XDG_CACHE_HOME}/zsh" # Cache location
ZPLUGINDIR="${ZDATADIR}/plugins"  # Plugins location
ZPROGDIR="${ZDATADIR}/progs"      # Programs location

# Create the Zsh folders
mkdir -p "${ZDOTDIR}" "${ZDATADIR}" "${ZCACHEDIR}" "${ZPLUGINDIR}" "${ZPROGDIR}"
# }}}

# {{{ $PATH
declare -a oldpath=("${path[@]}")
unset path

path+=( "${XDG_DATA_HOME}/../bin" )
path+=( ${ZPROGDIR}/*(N/) )
path+=("${oldpath[@]}")

unset oldpath
# }}}

# {{{ History file
HISTFILE="${ZDATADIR}/zsh-history"
HISTSIZE=1000000
SAVEHIST=1000000
# }}}

# {{{ $EDITOR vars
export EDITOR="nvim"
export VISUAL="${EDITOR}"
export SUDO_EDITOR="${EDITOR}"
export GIT_EDITOR="${EDITOR}"
export DIFFPROG="${EDITOR} -d"
# }}}

# {{{ Internal mailserver
export MAILCHECK=10
export MAILPATH=$MAIL
# }}}

# {{{ Telemetry optouts
export DOTNET_CLI_TELEMETRY_OPTOUT="1"
# }}}

# {{{ ~/ cleanup
export ANDROID_HOME="${XDG_DATA_HOME}/android"
export CUDA_CACHE_PATH="${XDG_CACHE_HOME}/nv"
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
export GRADLE_USER_HOME="${XDG_DATA_HOME}/gradle"
export GTK2_RC_FILES="${XDG_CONFIG_HOME}/gtk-2.0/gtkrc"
export KDEHOME="${XDG_CONFIG_HOME}/kde"
export JAVA_OPTIONS=-Djava.util.prefs.userRoot="${XDG_CONFIG_HOME}/java"
export KERAS_HOME="${XDG_STATE_HOME}/keras"
export TEXMFHOME="${XDG_DATA_HOME}/texmf/"
export TEXMFVAR="${XDG_CACHE_HOME}/texlive/texmf-var"
export TEXMFCONFIG="${XDG_CONFIG_HOME}/texlive/texmf-config"
export VARTEXFONTS="${XDG_CACHE_HOME}/texlive/2011/texmf-var/fonts"
export WINEPREFIX="${XDG_DATA_HOME}/wine"
# }}}

# {{{ Prompt options
elapsedTimeThreshold=2
# }}}
# }}}

# {{{ Sourcing XDG user directories if available
if [ -e $XDG_CONFIG_HOME/user-dirs.dirs ]
  then source $XDG_CONFIG_HOME/user-dirs.dirs
fi
# }}}
