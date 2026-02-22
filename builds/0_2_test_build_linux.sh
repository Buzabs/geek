#!/bin/sh
printf '\033c\033]0;%s\a' geek
base_path="$(dirname "$(realpath "$0")")"
"$base_path/0_2_test_build_linux.x86_64" "$@"
