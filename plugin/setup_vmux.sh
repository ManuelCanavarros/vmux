#!/usr/bin/env bash
export PATH="$PATH:$(dirname "$BASH_SOURCE")"
VMUX_PATH="$(dirname "$BASH_SOURCE")"
export VMUXCLI_WORKDIR=$VMUX_PATH/vmuxcli
  VMUX_EDITOR="$1"
else
VMUX_EDITOR="nvim"
export VMUX_EDITOR

[ -z "$VMUX_SERVER_FILE" ] && return
# specific stuff to vmux session
export EDITOR=vmux-editor
cd() {  
  builtin cd "$@";
  vmux_send :cd "$PWD"
  echo "$PWD" > ~/.cwd;
}
