# Keybindings and Shortcuts

This document summarizes the keybindings, aliases, and shortcuts configured in these dotfiles.

## Zsh (Aliases)

| Alias | Command | Description |
| :--- | :--- | :--- |
| `l` | `eza` | List files using `eza` |
| `ls` | `eza --icons ...` | List files with icons and group directories first |
| `ll` | `eza -l --icons --git ...` | Long list with icons and Git status |
| `la` | `eza -a --icons ...` | List all files including hidden ones |
| `lla` | `eza -la --icons ...` | Long list of all files |
| `tree` | `eza --tree --icons ...` | Directory tree view |
| `..` | `cd ..` | Go up one directory |
| `...` | `cd ../..` | Go up two directories |
| `....` | `cd ../../..` | Go up three directories |
| `~` | `cd ~` | Go to home directory |
| `cat` | `bat` | Enhanced `cat` with syntax highlighting |
| `rg` | `rg --color=auto` | Search text using Ripgrep |
| `v`, `vim` | `nvim` | Open Neovim |
| `rm` | `rm -iv` | Interactive remove (prompts before delete) |
| `mv` | `mv -iv` | Interactive move |
| `cp` | `cp -iv` | Interactive copy |
| `mkdir` | `mkdir -p` | Create directory and parents if needed |

## Tmux

**Prefix Key:** `Ctrl + a` (replaces default `Ctrl + b`)

| Keybinding | Action |
| :--- | :--- |
| `Prefix + r` | Reload Tmux configuration |
| `Prefix + \|` | Split pane vertically (current path) |
| `Prefix + -` | Split pane horizontally (current path) |
| `Prefix + h` | Move to pane on the left |
| `Prefix + j` | Move to pane below |
| `Prefix + k` | Move to pane above |
| `Prefix + l` | Move to pane on the right |
| `Shift + Arrows` | Resize current pane |
| `Prefix + [` | Enter copy mode (Vim-style navigation) |
| `v` (in copy mode) | Begin selection |
| `y` (in copy mode) | Copy selection to system clipboard |
| `Prefix + Ctrl-s` | Save current Tmux session |
| `Prefix + Ctrl-r` | Restore saved Tmux session |

## Neovim

**Leader Key:** `,`

| Keybinding | Mode | Action | Description |
| :--- | :--- | :--- | :--- |
| `,n` | Normal | `:Neotree toggle` | Toggle file explorer |
| `,w` | Normal | | Format code and save file |
| `Tab` | Normal | `:BufferLineCycleNext` | Go to next buffer |
| `Shift + Tab` | Normal | `:BufferLineCyclePrev` | Go to previous buffer |
| `, ]` | Normal | `:BufferLineMoveNext` | Move buffer to the right |
| `, [` | Normal | `:BufferLineMovePrev` | Move buffer to the left |
| `,c` | Normal | `:bdelete` | Close current buffer |
| `,C` | Normal | `:bdelete!` | Force close current buffer |
| `Ctrl + p` | Normal | `:Telescope find_files` | Find files by name |
| `,f` | Normal | `:Telescope live_grep` | Search text in files |
| `, *` | Normal | `:Telescope grep_string` | Search word under cursor |
| `,b` | Normal | `:Telescope buffers` | List open buffers |
| `,c` | Normal | `gcc` | Toggle line comment |
| `,c` | Visual | `gc` | Toggle block comment |
| `gd` | Normal | `LSP definition` | Go to definition |
| `K` | Normal | `LSP hover` | Show documentation |
| `,rn` | Normal | `LSP rename` | Rename symbol |
| `,ca` | Normal | `LSP code action` | Show available code actions |
| `gr` | Normal | `LSP references` | Show symbol references |
| `,fm` | Normal | `LSP format` | Format current buffer |

## Git (Aliases)

| Alias | Command | Description |
| :--- | :--- | :--- |
| `st` | `status -sb` | Short status with branch info |
| `aa` | `add .` | Add all changes to staging |
| `ci` | `commit` | Commit changes |
| `cia` | `commit --amend` | Amend the last commit |
| `co` | | Checkout branch (with auto-stashing) |
| `df` | `diff` | Show changes |
| `lg` | `log --graph ...` | Formatted graph log |
| `lga` | `log --graph --all ...` | Graph log for all branches |
| `up` | | Pull with rebase and auto-stashing |
| `in` | | Show incoming commits from remote |
| `out` | | Show outgoing commits to remote |
| `pp` | | Pull then Push |
| `br` | `branch` | List branches |
| `bra` | `branch -a` | List all branches (including remote) |
