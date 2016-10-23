#!/bin/bash

echo "TEST"

. "../lib/helpers.sh"

print_error "Error"
print_success "Success"
print_warning "Warning"
print_blue "Blue"
print_magenta "Magenta"
print_info "Information"
print_question "Question"
print ""

ask "Ask Question"
print_answer

