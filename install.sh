#!/usr/bin/env bash
# git clone git@github.com:Rz-Rz/dotfiles.git ~/opt/dotfiles && ~/opt/dotfiles/install.sh
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd -P)"
mkdir -p ~/opt ~/.local/bin ~/.config
export PATH="$HOME/.local/bin:$PATH"

# --- system packages (Debian/Ubuntu); only calls sudo if something is missing ---
if command -v apt-get >/dev/null; then
  need=()
  for pair in git:git curl:curl tmux:tmux ripgrep:rg build-essential:gcc unzip:unzip nodejs:node npm:npm python3-venv:python3; do
    command -v "${pair#*:}" >/dev/null || need+=("${pair%%:*}")
  done
  if [ ${#need[@]} -gt 0 ]; then
    echo "installing: ${need[*]}"
    sudo apt-get update -qq && sudo apt-get install -y -qq "${need[@]}"
  fi
fi

# --- neovim: apt's is too old for NvChad, use the official tarball ---
arch=$(uname -m | sed 's/aarch64/arm64/')
nv=~/opt/nvim-linux-$arch
[ -x "$nv/bin/nvim" ] || curl -fsSL "https://github.com/neovim/neovim/releases/latest/download/nvim-linux-$arch.tar.gz" | tar xz -C ~/opt
ln -sf "$nv/bin/nvim" ~/.local/bin/nvim

# --- configs: symlink into this repo; anything already there is moved to *.bak.<timestamp> ---
link() {
  [ "$(readlink -f "$2" 2>/dev/null)" = "$1" ] && return
  if [ -e "$2" ] || [ -L "$2" ]; then mv -v "$2" "$2.bak.$(date +%s)"; fi
  ln -sv "$1" "$2"
}
link "$here/nvim"       "$HOME/.config/nvim"
link "$here/.tmux.conf" "$HOME/.tmux.conf"

# --- plugins ---
[ -d ~/.tmux/plugins/tpm ] || git clone -q --depth 1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins
nvim --headless "+Lazy! restore" +qa

# --- windows terminal (only when running inside WSL) ---
for wt in /mnt/c/Users/*/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState; do
  [ -d "$wt" ] || continue
  [ -f "$wt/settings.json" ] && cp "$wt/settings.json" "$wt/settings.json.bak.$(date +%s)"
  cp "$here/windows-terminal/settings.json" "$wt/settings.json" && echo "windows terminal settings -> $wt (needs FiraCode Nerd Font installed on Windows)"
done

echo "done. open nvim and run :MasonInstallAll once for LSPs/formatters."
