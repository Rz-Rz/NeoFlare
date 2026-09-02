#!/usr/bin/env bash
# git clone git@github.com:Rz-Rz/NeoFlare.git ~/opt/NeoFlare && ~/opt/NeoFlare/install.sh
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd -P)"

link() { # link <src> <dst>; existing dst is moved to dst.bak.<timestamp>
  [ "$(readlink -f "$2" 2>/dev/null)" = "$1" ] && return
  if [ -e "$2" ] || [ -L "$2" ]; then mv -v "$2" "$2.bak.$(date +%s)"; fi
  mkdir -p "$(dirname "$2")"
  ln -sv "$1" "$2"
}

link "$here/nvim_v2"    "$HOME/.config/nvim"
link "$here/.tmux.conf" "$HOME/.tmux.conf"

[ -d ~/.tmux/plugins/tpm ] || git clone -q --depth 1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins
echo "done. run nvim once to let lazy.nvim pull plugins."
