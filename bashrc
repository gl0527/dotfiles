# allow programs dump cores of any size
ulimit -c unlimited

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

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
