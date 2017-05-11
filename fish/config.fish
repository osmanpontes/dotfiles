alias vim="nvim"

# Use neovim as default editor
set -xg VISUAL nvim
set -xg EDITOR $VISUAL

# Show hidden files in 'ag', except .git
set -xg FZF_DEFAULT_COMMAND 'ag --hidden --ignore .git -g ""'

