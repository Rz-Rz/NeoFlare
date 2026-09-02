# dotfiles

nvim (NvChad v2.5) + tmux (gruvbox, tpm).

    git clone git@github.com:Rz-Rz/dotfiles.git ~/opt/dotfiles && ~/opt/dotfiles/install.sh

`install.sh` (Debian/Ubuntu, idempotent):

- apt-installs git, curl, tmux, ripgrep, build-essential, unzip, node, npm, python3-venv if missing
- drops the latest neovim tarball in `~/opt` and links it to `~/.local/bin/nvim`
- symlinks `~/.config/nvim -> nvim/` and `~/.tmux.conf -> .tmux.conf` (existing files go to `*.bak.<timestamp>`)
- installs tpm + tmux plugins, and nvim plugins pinned to `lazy-lock.json`

Then open nvim and run `:MasonInstallAll` once for LSPs and formatters.

`nvim_v1/` is the old pre-NvChad config, kept for reference.
