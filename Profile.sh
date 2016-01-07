# quickly edit the bash_profile no matter wherever you are
#
alias bprofile='nano ~/.bash_profile'

# free to make an error when typing clear
# any other common mistakes will be added here
#
alias clera='clear'

alias dir='ls -al'
alias terminal='gnome-terminal'

# Make a directory and immediately change into it
# usage:
# user:~$ mkdircd folder_name
# user:~/folder_name$

function mkdircd() {
    command mkdir $1 && cd $1
}

# easier way to go up N levels when deep in a path
# usage:
# user:~/a/b/c/d/e/f/g/h/i$ up 2
# user:~/a/b/c/d/e/f/g$

function up() {
    LIMIT=$1
    P=$PWD
    for ((i=1; i <= LIMIT; i++))
    do
        P=$P/..
    done
    cd $P
    export MPWD=$P
}

# did you overshoot using up? Quickly correct your mistake
# usage:
# user:~/a/b/c/d/e/f/g$ back 1
# user:~/a/b/c/d/e/f/g/h$

function back() {
    LIMIT=$1
    P=$MPWD
    for ((i=1; i <= LIMIT; i++))
    do
        P=${P%/..}
    done
    cd $P
    export MPWD=$P
}
