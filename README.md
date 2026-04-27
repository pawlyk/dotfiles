# My dotfiles

This repo contains my personal settings files for vim, zsh, git, tmux and other tools.

See [KEYBINDINGS.md](./KEYBINDINGS.md) for a full list of shortcuts and aliases.

## Installation

1. Install packages and requarements:
    - install main packages and tools `brew install neovim tmux starship pyenv uv zsh-completions`;
    - install tools for the fast searching and code navigation `brew install ripgrep fd`;
    - install LSP server and all needed pluging for it `uv tool install "python-lsp-server[all]" --with pylsp-mypy --with python-lsp-ruff`;
    - install font `curl -L https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Meslo.zip -o /tmp/Meslo.zip && unzip -qo /tmp/Meslo.zip -d ~/Library/Fonts/ && rm /tmp/Meslo.zip`;
    - install plugin manager for the tmux `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`;
2. Backup your dot files.
3. Clone repository `$ git clone https://github.com/pawlyk/dotfiles.git ~/dotfiles` or other location.
4. Create directories and simliks to the files in `~` dir:
```sh
# Create necessary directories if they don't exist
mkdir -p ~/.config/nvim
mkdir -p ~/.config

# Create symlinks for configs (replace ~/dotfiles with the path to your repository)
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/starship.toml ~/.config/starship.toml
ln -sf ~/dotfiles/init.lua ~/.config/nvim/init.lua
```
5. Final initialization:
    - Zsh initialization
    ```sh
    source ~/.zshrc
    ```
    - Neovim initialization
    ```sh
    vim
    ```
    - Tmux initialization
    ```sh
    tmux
    ```
    and press `Ctrl+a` then `I` to install plugins.
6. Enjoy.

