# andy3153-zshrc ![GitHub release (latest by date)](https://img.shields.io/github/v/release/Andy3153/andy3153-zshrc)
This is my .zshrc and all the plugins and little scripts that I use with it.

I saw this idea of posting my shell rc config here on [The Art of Command Line](https://github.com/jlevy/the-art-of-command-line) and thought it might be cool to try.

I made this mostly because I wanted an easy solution to backup my configs, but also because I wanted to play around with git and it made me organise my configs and other scripts I made.

## Installation
Inside this repo there is a shell script that automatically handles 'installing' these configs. There are two ways you can go about it:

### Symlinks (you need to keep the cloned folder)
```bash
cd /path/to/clone/folder/
git clone https://github.com/Andy3153/andy3153-zshrc/
cd andy3153-zshrc/
bash install.sh --install-with-symlinks
```

### Copying (you can feel free to delete the folder)
```bash
cd /path/to/clone/folder/
git clone https://github.com/Andy3153/andy3153-zshrc/
cd andy3153-zshrc/
bash install.sh --install
cd ..
rm -rf andy3153-zshrc/
```

Replace `/path/to/clone/folder/` with the folder you want to clone the Git repo inside. Your choice, could be your Home directory.

## Themes
I've made many themes whenever I felt like shaking things up a little. You can easily apply them.

## Plugins included:
  1. [fast-syntax-highlighting](https://github.com/zdharma/fast-syntax-highlighting)
  2. [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

## Programs included:
  1. [ddate.sh](https://github.com/bake/ddate.sh)

## Other programs recommended to install are:
  1. Any lolcat implementation you prefer [lolcat](https://github.com/busyloop/lolcat), [jaseg/lolcat](https://github.com/jaseg/lolcat), [tehmaze/lolcat](https://github.com/tehmaze/lolcat)
  2. [LSD](https://github.com/Peltoche/lsd)

## About the other scripts
They are located in zsh/scripts. I made them because they're useful to me.

## About the etc folder
I keep in there configs for other shell and terminal-related things.

## Other dotfiles of mine
- [Neovim config](https://github.com/Andy3153/andy3153-init.lua)
- [Sway rice](https://github.com/Andy3153/sway-rice)

## Contributing
Feel free to give me advice on this, or even help me with it!
