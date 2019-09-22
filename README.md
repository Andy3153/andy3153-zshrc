# andy3153-zshrc ![GitHub release (latest by date)](https://img.shields.io/github/v/release/Andy3153/andy3153-zshrc)
This is my .zshrc and all the plugins, programs and little
scripts that I use with it.

I saw this idea of posting my shell rc config here on
[The Art of Command Line](https://github.com/jlevy/the-art-of-command-line)
and thought it might be cool to try.

I made this mostly because I wanted an easy solution to
backup my configs, but also because I wanted to play around
with git and it made me organise my configs and other scripts
I made.

## How does it look like?

[![asciicast](https://asciinema.org/a/270231.svg)](https://asciinema.org/a/270231)

## Programs/plugins included:

  1. [agnoster-zsh-theme](https://github.com/agnoster/agnoster-zsh-theme)
  2. [ddate](https://github.com/bo0ts/ddate)
  3. [lolcat](https://github.com/busyloop/lolcat)
  4. [neofetch](https://github.com/dylanaraps/neofetch)
  5. [thefuck](https://github.com/nvbn/thefuck)
  6. [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
  7. [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)


## Installation

The install script uses command-line arguments to install
the scripts, install them using symlinks and also to
uninstall them and revert your original configs. Run the
install script from the folder it is in

```bash
./install.sh -i
```
to install it normally, it copies the configs in your home
folder

```bash
./install.sh -I
```
to install it using symlinks; this can be useful so you can
update it just by pulling the new configs in. You have to
keep the folder somewhere though

```bash
./install.sh -u
```
to uninstall everything and put your old configs back in

## About the other scripts
They are located in .zsh/scripts. You can just open them up
in a text editor and you'll see their story in there ;)

## Contributing
Feel free to give me advice on this, or even help me with
it! :)