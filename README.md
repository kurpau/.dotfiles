## Prerequisites

`git` and GNU `stow`

[ripgrep](https://github.com/BurntSushi/ripgrep) for Neovim telescope

C compiler in path for Treesitter

## Installing

Clone into `$HOME` directory or `~`

```bash
git clone https://github.com/kurpau/.dotfiles.git ~/.dotfiles
```

Run `stow` to symlink everything or select specific config

```bash
stow */ # Everything (the '/' ignores the README)
```

```bash
stow zsh 
```
