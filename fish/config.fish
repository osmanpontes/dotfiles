if test -e "$HOME/.dotfiles/fish/private.fish";
    source ~/.config/fish/private.fish
end

alias vim="nvim"

# Use neovim as default editor
set -xg VISUAL nvim
set -xg EDITOR $VISUAL

# Show hidden files in 'ag', except .git
set -xg FZF_DEFAULT_COMMAND 'ag --hidden --ignore .git -g ""'

# awscli and others
set -gx PATH ~/.local/bin $PATH

