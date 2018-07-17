#
# User configuration sourced by interactive shells
#

# path settings
[[ -d ~/bin ]] && export PATH=~/bin:$PATH
[[ -d ~/go/bin ]] && export PATH=~/go/bin:$PATH
[[ -d ~/Library/Python/2.7/bin ]] && export PATH=~/Library/Python/2.7/bin:$PATH

# Anchore development settings
export ANCHORE_SRC_HOME=$HOME/code/anchore

# Change default zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

[ $commands[kubectl] ] && source <(kubectl completion zsh)
[ $commands[jx] ] && source <(jx completion zsh)
