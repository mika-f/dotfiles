#!/bin/bash

finish() {
    exit 0
}

die() {
    exit 1
}

print() {
    echo "$1"
}

print_color() {
    printf "  \033[3$3m[$2] %s\033[m\n" "$1"
}

print_error() {
    print_color "$*" "✖" 1
}

print_success() {
    print_color "$1" "✔" 2
}

print_warning() {
    print_color "$1" "!" 3
}

print_header() {
    print_color "$1" "*" 4
}

print_magenta() {
    print_color "$1" " " 5
}

print_info() {
    print_color "$1" "i" 6
}

print_question() {
    printf "  \033[37m[?] %s\033[m: " "$1"
}

ask() {
    print_question "$1 [yN]"
    read ANSWER
}

get_answer() {
    if [[ "$ANSWER" =~ ^[Yy]$ ]]; then
        return 0
    else
        return 1
    fi
}

print_answer() {
    if [[ "$ANSWER" =~ ^[Yy]$ ]]; then
        print "Yes"
    else
        print "No"
    fi
}

# cmd_exists "yum"
cmd_exists() {
    command -v "$1" &> /dev/null
}

# install "git"
# install "libyaml-devel" "libyaml-dev"
install() {
    if [ cmd_exists "yum" ]; then
        sodu yum install -y "$1"
    else
        if [ $# = 2 ]; then
            sudo apt-get install -y "$2"
        else
            sudo apt-get install -y "$1"
        fi
    fi
}

# link ".gitignore"
link() {
    if [ -f "$HOME/$1" ]; then
        ask "$1 is already exists, do you want to override it? [yn]"
        if get_answer; then
            ln -snvf "$DOTFILE_ROOT/$1" "$HOME/$1"
        fi
    else
        ln -snvf "$DOTFILE_ROOT/$1" "$HOME/$1"
    fi
}

