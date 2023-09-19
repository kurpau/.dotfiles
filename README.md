## Prerequisites

`git` and GNU `stow`

[ripgrep](https://github.com/BurntSushi/ripgrep) for Neovim telescope

## Installing

Clone into `$HOME` directory or `~`

```bash
git clone https://github.com/kurpau/.dotfiles.git ~
```

Run `stow` to symlink everything or select specific config

```bash
stow */ # Everything (the '/' ignores the README)
```

```bash
stow zsh 
```

## Notes

Nvim requires ripgrep for plugins to work properly
For plugins to function correctly in nvim, ripgrep is a necessary dependency
