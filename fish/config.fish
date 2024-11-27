if test -e "$HOME/.dotfiles/fish/private.fish";
    source ~/.config/fish/private.fish
end

alias vim="nvim"

# Use neovim as default editor
set -xg VISUAL nvim
set -xg EDITOR $VISUAL

# Show hidden files in 'ag', except .git
# set -xg FZF_DEFAULT_COMMAND 'ag --hidden --ignore .git -g ""'
set -xg FZF_DEFAULT_COMMAND 'rg --files --hidden -g !.git/'

# This is needed to make bobthefish theme work well
# https://github.com/oh-my-fish/theme-bobthefish
set -g theme_nerd_fonts yes

# awscli and others
# set -gx PATH ~/.local/bin $PATH
