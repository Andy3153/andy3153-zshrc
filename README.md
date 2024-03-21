<!-- vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}: -->
# andy3153-zshrc
This is my .zshrc and all the plugins and little scripts that I use with it.

I saw this idea of posting my shell config here on [The Art of Command Line](https://github.com/jlevy/the-art-of-command-line) and thought it might be cool to try.

I made this mostly because I wanted an easy solution to backup my configs, but also because I wanted to play around with git and it made me organise my configs and other scripts I made.

## Installation
This Git repo contains files from the `~/.config/zsh` folder. So, you can go two ways about 'installing' the configs:

### Symlinks (you need to keep the cloned folder)
```bash
cd /path/to/clone/folder/
git clone https://github.com/Andy3153/andy3153-zshrc/
ln -s /path/to/clone/folder/andy3153-zshrc ~/.config/zsh/

# Optionally, if you don't set $ZDOTDIR somewhere else to be at `~/.config/zsh`
ln -s ~/.config/zsh/zshenv ~/.zshenv
```

### Copying (you can feel free to delete the folder)
```bash
cd /path/to/clone/folder/
git clone https://github.com/Andy3153/andy3153-zshrc/
cp -r andy3153-zshrc ~/.config/zsh/
bash install.sh --install

# Optionally, if you don't set $ZDOTDIR somewhere else to be at `~/.config/zsh`
cp ~/.config/zsh/zshenv ~/.zshenv
```

Replace `/path/to/clone/folder/` with the folder you want to clone the Git repo inside. Your choice, could be your Home directory.

## Plugins included:
See [pluginrc](../../blob/master/pluginrc)

## Programs included:
  1. [ddate.sh](https://github.com/bake/ddate.sh)

## Other programs recommended to install are:
  1. Any lolcat implementation you prefer [lolcat](https://github.com/busyloop/lolcat), [jaseg/lolcat](https://github.com/jaseg/lolcat), [tehmaze/lolcat](https://github.com/tehmaze/lolcat)
  2. [LSD](https://github.com/Peltoche/lsd)

## Other dotfiles of mine
- [Neovim config](https://github.com/Andy3153/andy3153-init.lua)
- [Hyprland rice](https://github.com/Andy3153/hyprland-rice)
- [Sway rice](https://github.com/Andy3153/sway-rice)

## Contributing
Feel free to give me advice on this, or even help me with it!
