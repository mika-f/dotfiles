#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"
. "../../lib/helpers.sh"

"./$(get_os)/main.sh"

