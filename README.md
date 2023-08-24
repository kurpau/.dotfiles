## Prerequisites

`git` and GNU `stow`

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
