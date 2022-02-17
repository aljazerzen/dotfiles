
ZSH_THEME=robbyrussell

# load zgen
source "${HOME}/.zgen/zgen.zsh"

zgen oh-my-zsh
zgen oh-my-zsh plugins/tmux
zgen oh-my-zsh plugins/sudo
zgen oh-my-zsh plugins/fzf

zstyle ':omz:update' mode disabled

## Todoist completition
if [ -d $HOME/.config/todoist ]; then
	source $HOME/.config/todoist/todoist_functions_fzf.sh
	source $HOME/.config/todoist/zsh_autocomplete
fi

## Path options

export PATH=$HOME/.local/bin:$PATH

export EDITOR=nvim

source $HOME/.profile
source $HOME/.aliases
