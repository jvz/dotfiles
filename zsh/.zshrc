# path settings
[[ -d ~/bin ]] && export PATH=~/bin:$PATH
[[ -d /usr/local/bin/go ]] && export PATH=$PATH:$(go env GOPATH)

#
# User configuration sourced by interactive shells
#

# Change default zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

#
# vi key mode settings
#

# Updates editor information when the keymap changes.
function zle-keymap-select() {
  zle reset-prompt
  zle -R
}

# Ensure that the prompt is redrawn when the terminal size changes.
TRAPWINCH() {
  zle &&  zle -R
}

if [[ -n $INSIDE_EMACS ]]; then

zle -N zle-keymap-select
zle -N edit-command-line

bindkey -v

# allow v to edit the command line (standard behaviour)
autoload -Uz edit-command-line
bindkey -M vicmd 'v' edit-command-line

# allow ctrl-r to perform backward search in history
bindkey '^r' history-incremental-search-backward

# allow ctrl-a and ctrl-e to move to beginning/end of line
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

## if mode indicator wasn't setup by theme, define default
#if [[ "$MODE_INDICATOR" == "" ]]; then
#  MODE_INDICATOR="%{$fg_bold[red]%}<%{$fg[red]%}<<%{$reset_color%}"
#fi
#
#function vi_mode_prompt_info() {
#  echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
#}
#
## define right prompt, if it wasn't defined by a theme
#if [[ "$RPS1" == "" && "$RPROMPT" == "" ]]; then
#  RPS1='$(vi_mode_prompt_info)'
#fi

fi
