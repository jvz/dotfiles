#
# User configuration sourced by interactive shells
#

# path settings
insert_path() {
    [[ -d $1 ]] && export PATH=$1:$PATH
}
insert_path ~/bin
insert_path ~/go/bin
insert_path ~/Library/Python/2.7/bin
insert_path /usr/local/sbin

# Anchore development settings
export ANCHORE_SRC_HOME=$HOME/code/anchore

# Change default zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

if [ $commands[kubectl] ]; then
    alias kc=kubectl
    source <(kubectl completion zsh)
fi
[ $commands[jx] ] && source <(jx completion zsh)
[ $commands[helm] ] && source <(helm completion zsh)
