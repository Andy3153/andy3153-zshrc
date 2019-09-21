# andy3153-zshrc

This is my .zshrc and all the plugins, programs and little scripts that I use with it. 

I saw this idea of posting my shell rc config here on https://github.com/jlevy/the-art-of-command-line and thought it might be cool to try.

I made this mostly because I wanted an easy solution to backup my configs, but also because I wanted to play around with git and it made me organise my configs and other scripts I made.

# Programs/plugins included:
  1. agnoster-zsh-theme (https://github.com/agnoster/agnoster-zsh-theme)
  2. ddate (https://github.com/bo0ts/ddate)
  3. lolcat (https://github.com/busyloop/lolcat)
  4. neofetch (https://github.com/dylanaraps/neofetch)
  5. thefuck (https://github.com/nvbn/thefuck)
  6. zsh-autosuggestions (https://github.com/zsh-users/zsh-autosuggestions)
  7. zsh-syntax-highlighting (https://github.com/zsh-users/zsh-syntax-highlighting)


# How to install:
  The new install script has options that you can use for installing, installing using symlinks and uninstalling. Here's the output of ./install.sh -h :
  
  $ ./install.sh -h
  
   install.sh by Andy3153
   Usage: ./install.sh [OPTIONS..]

   Options:
    --help                  , -h   Shows this help screen.
    --version               , -v   Shows the version of the installer.
    --install               , -i   Installs by backing up the original
                                   configs and then copying the new ones.
    --install-with-symlinks , -I   Installs by backing up the original
                                   configs and then linking the new ones.
                                   You have to keep the folder this is in
                                   for this method.
    --uninstall             , -u   Deletes the configs/symlinks, then
                                   restores your old configs.
                                   
# About the other scripts:
They are located in .zsh/scripts
You can just open them up in a text editor and you'll see their story in there ;)

Feel free to give me advice on this! :)
