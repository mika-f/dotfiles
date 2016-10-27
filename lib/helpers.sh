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

print_blue() {
    print_color "$1" "*" 4
}

print_header() {
    printf "  @ \033[36m%s\033[m\n" "$1"
}

print_subheader() {
    printf "    * \033[36m%s\033[m\n" "$1"
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
    if get_answer; then
        print "Yes"
    else
        print "No"
    fi
}

get_os() {
  local os=""
  local kernel="$(uname -s)"

  if [ "$kernel" == "Darwin" ]; then
    os="macos"
  elif [ "$kernel" == "Linux" ]; then
    if [ -e "/etc/lsb-release" ]; then
      os="ubuntu"
    elif [ -e "/etc/centos-release" ]; then
      os="centos"
    else
      os="$kernel"
    fi
  else
    os="$kernel"
  fi
  printf "%s" $os
}

# cmd_exists "yum"
cmd_exists() {
    command -v "$1" &> /dev/null
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

