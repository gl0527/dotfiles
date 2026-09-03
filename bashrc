# allow programs dump cores of any size
ulimit -c unlimited

# Ensure Bash processes variables inside the prompt dynamically
shopt -s promptvars

# Detect OS information safely
if [ -f /etc/os-release ]; then
    . /etc/os-release
fi

# Fallback to ID if ID_LIKE does not exist (fixes root distros like Arch/Debian/Fedora)
OS_FAMILY="${ID_LIKE:-$ID}"

# Match against the consolidated OS family string
case "$OS_FAMILY" in
    *debian*)
        GIT_PS1_FILE='/usr/lib/git-core/git-sh-prompt'
        ;;
    *fedora*|*rhel*|*alpine*|*suse*)
        GIT_PS1_FILE='/usr/share/git-core/contrib/completion/git-prompt.sh'
        ;;
    *arch*)
        GIT_PS1_FILE='/usr/share/git/completion/git-prompt.sh'
        ;;
    *)
        GIT_PS1_FILE=''
        ;;
esac

PROMPT_COMMAND='__ec_color=$(( $? == 0 ? 32 : 31 ))'

# Check if the git prompt script actually exist
if [ -f "$GIT_PS1_FILE" ]; then
    # Config __git_ps1
    export GIT_PS1_SHOWUPSTREAM="auto"

    # Source the git prompt script
    . "$GIT_PS1_FILE"

    PS1='\[\033[36m\]\u@\h:\[\033[34m\]\w$(__git_ps1 " (\001\033[1;33m\002%s\001\033[0;34m\002)")\n\[\033[${__ec_color}m\]> \[\033[0m\]'
else
    PS1='\[\033[36m\]\u@\h:\[\033[34m\]\w\n\[\033[${__ec_color}m\]> \[\033[0m\]'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Infinite history size and ignore duplicates
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoreboth:erasedups

# Append to history instead of overwriting, and save after every command
shopt -s histappend

# some ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lt='ls -hal --time-style=full-iso'

# allow alias expansion with sudo - with the help of the trailing space
alias sudo='sudo '

# allow alias expansion with gdb - with the help of the trailing space
alias gdba='make -j && gdb --args '

# clear screen and empty buffer
alias c='clear; printf "\033[3J"'

export VISUAL=vim
export EDITOR="$VISUAL"
export PATH=$PATH:$HOME/.local/bin/

mcd() {
    mkdir -pv "$1"
    cd "$1"
}

wr() {
    for i in "$@"
    do
        curl wttr.in/"$i"
        echo -e "\n\n"
        printf '=%.0s' {1..120}
        echo -e "\n\n"
    done
}

tovim() {
    "$@" | view -
}

f() {
    find . -iname "*$1*"
}

F() {
    find . -name "*$1*"
}
