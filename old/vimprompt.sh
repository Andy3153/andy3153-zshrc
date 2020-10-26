#!/usr/bin/env zsh
##
## vimprompt.sh by Andy3153
## created 26/10/20 ~ 14:55:26
##

function _vimprompt()
{
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
