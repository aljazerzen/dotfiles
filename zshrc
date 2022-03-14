
ZSH_THEME=robbyrussell

# load zgen
source "${HOME}/.zgen/zgen.zsh"

zstyle ':omz:update' mode disabled

zgen oh-my-zsh
zgen oh-my-zsh plugins/sudo
zgen oh-my-zsh plugins/fzf

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
