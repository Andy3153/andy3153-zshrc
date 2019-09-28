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

[![asciicast](https://asciinema.org/a/270233.svg)](https://asciinema.org/a/270233)

## Programs included:

  1. [ddate](https://github.com/bo0ts/ddate)
  2. [lolcat](https://github.com/busyloop/lolcat)
  3. [neofetch](https://github.com/dylanaraps/neofetch)
  4. [thefuck](https://github.com/nvbn/thefuck)

## Plugins included:

  1. [agnoster-zsh-theme](https://github.com/agnoster/agnoster-zsh-theme)
  2. [calc.plugin.zsh](https://github.com/arzzen/calc.plugin.zsh)
  3. [fast-syntax-highlighting](https://github.com/zdharma/fast-syntax-highlighting)
  4. [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
  5. [zsh-notify](https://github.com/marzocchi/zsh-notify)
  6. [zsh-you-should-use](https://github.com/MichaelAquilina/zsh-you-should-use)

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
