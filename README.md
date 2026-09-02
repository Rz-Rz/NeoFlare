# NeoFlare

nvim (NvChad v2.5) + tmux (gruvbox, tpm) config.

    git clone git@github.com:Rz-Rz/NeoFlare.git ~/opt/NeoFlare
    ~/opt/NeoFlare/install.sh

Symlinks `~/.config/nvim -> nvim_v2` and `~/.tmux.conf -> .tmux.conf` (anything already there is moved to `*.bak.<timestamp>`), installs tpm and its plugins. Needs git, tmux >= 3.0, nvim >= 0.10. First `nvim` launch pulls plugins; then `:MasonInstallAll` for LSPs.

`nvim_v1/` is the old pre-NvChad config, kept for reference.
