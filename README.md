## Prerequisites

`git` and GNU `stow`

[ripgrep](https://github.com/BurntSushi/ripgrep) for Neovim telescope

[fzf](https://github.com/junegunn/fzf)

[Hack Nerd Font](https://www.nerdfonts.com/font-downloads) for WezTerm (can be changed in config)

C compiler in path for Treesitter

## Nice to have

[lazygit](https://github.com/jesseduffield/lazygit)

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
