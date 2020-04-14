#
# User configuration sourced by interactive shells
#

# path settings
insert_path() {
    [[ -d $1 ]] && export PATH=$1:$PATH
}
insert_path ~/bin
insert_path /usr/local/sbin

if [ $commands[gpg] ]; then
   export GPG_TTY=$(tty)
   export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
   gpgconf --launch gpg-agent
fi

# zim settings
zstyle ':zim:input' double-dot-expand yes
zstyle ':zim:git' aliases-prefix 'g'

# Change default zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

if [[ ${ZIM_HOME}/init.zsh -ot ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  # Update static initialization script if it's outdated, before sourcing it
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh

# Use hub(1) for git when available
[ $commands[hub] ] && alias git=hub
if [ $commands[kubectl] ]; then
    alias kc=kubectl
    source <(kubectl completion zsh)
fi
[ $commands[jx] ] && source <(jx completion zsh)
[ $commands[helm] ] && source <(helm completion zsh)

# Maven aliases
# TODO: move to jvzsh or own module
if [ $commands[mvn] ]; then
    alias mvnci='mvn clean install'
    alias mvncp='mvn clean package'
    alias mvncv='mvn clean verify'
    alias mvncr='mvn clean process-resources'
    alias mvnq='mvn clean install -DskipTests -Dfindbugs.skip -Dspotbugs.skip'
    alias mvnIi='mvn clean install -DskipTests -Dfindbugs.skip -Dspotbugs.skip -Dset.changelist'
    alias mvnIu='mvn incrementals:update'
    alias mvndeps='mvn dependency:tree'
    alias mvndepso='mvn dependency:tree -DoutputFile=deps.txt'

    function mvn8() {
       JAVA_HOME=$(/usr/libexec/java_home -v 1.8) mvn $@
    }

    function mvnjt() {
        mvn -f core -DskipTests -Dfindbugs.skip install && mvn -f test -Dtest=$1 surefire:test
    }
fi

# iTerm integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

