
ZSH_THEME=robbyrussell

# load zgen
source "${HOME}/.zgen/zgen.zsh"

zgen oh-my-zsh
zgen oh-my-zsh plugins/tmux
zgen oh-my-zsh plugins/sudo
zgen load unixorn/fzf-zsh-plugin . main

## Path options

export PATH=$HOME/.local/bin:$PATH

export EDITOR=nvim

source $HOME/.aliases
