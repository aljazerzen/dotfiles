
ZSH_THEME=robbyrussell

# load zgen
source "${HOME}/.zgen/zgen.zsh"

zgen oh-my-zsh
zgen oh-my-zsh plugins/tmux
zgen oh-my-zsh plugins/sudo
zgen oh-my-zsh plugins/fzf

## Path options

export PATH=$HOME/.local/bin:$PATH

export EDITOR=nvim

source $HOME/.profile
source $HOME/.aliases
