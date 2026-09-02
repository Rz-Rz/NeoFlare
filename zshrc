# powerlevel10k instant prompt, keep at the top
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git)
source "$ZSH/oh-my-zsh.sh"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh   # `p10k configure` to regenerate

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$HOME/.opencode/bin:$HOME/.local/bin:$PATH"
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"
[ -f ~/.cargo/env ] && . ~/.cargo/env

path=( ${path:#*usbipd-win*} )   # WSL: drop the usbipd-win entry Windows injects into PATH

badass() {   # 42 bgp lab
  VAGRANT_CWD=$HOME/project/42/bgp vagrant up || return
  virt-viewer --attach -c qemu:///system bgp_default >/dev/null 2>&1 & disown
}
