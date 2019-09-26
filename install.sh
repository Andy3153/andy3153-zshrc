#!/bin/bash

#
# install.sh by Andy3153
#
# This script installs the configs in two ways, and it can
# also uninstall everything and restore the old configs.
# It's just the three old install.sh,
# install_with-symlinks.sh and uninstall.sh combined in
# one single script, using command-line arguments
#

# Adds the command-line arguments
  while [ $1 ]; do
    case $1 in

    # ################################################

    # Adds the argument "help", which shows info about
    # the installer.
      '--help' | '-h' )
        echo
        echo " install.sh by Andy3153"
        echo " Usage: ./install.sh [OPTIONS..]"
        echo
        echo "  Options:"
        echo "   --help                  , -h   Shows this help screen."
        echo "   --version               , -v   Shows the version of the installer."
        echo "   --install               , -i   Installs by backing up the original"
        echo "                                  configs and then copying the new ones."
        echo "   --install-with-symlinks , -I   Installs by backing up the original"
        echo "                                  configs and then linking the new ones."
        echo "                                  You have to keep the folder this is in"
        echo "                                  for this method."
        echo "   --uninstall             , -u   Deletes the configs/symlinks, then"
        echo "                                  restores your old configs."
        echo
        exit
        ;; # End of argument "help"

    # ################################################

    # Adds the argument "version", which shows the
    # version of the installer.
      '--version' | '-v' )
        echo
        echo " install.sh by Andy3153"
        echo "   version 1.0"
        echo
        echo " Github repository: https://github.com/Andy3153/andy3153-zshrc"
        echo
        exit
        ;; # End of argument "version"

    # ################################################

    # Adds the argument "install", which copies the
    # configs in your home directory.
      '--install' | '-i' )

      # Having messages pop up on the terminal is always neat
        echo " Starting the installation..."
        sleep 2s

      # Making a backup, just for safety
        echo " Making a backup of your current configs... (it will be stored in $HOME/.zsh-backup)."
           mkdir $HOME/.zsh-backup

        if [ -e $HOME/.zsh ]
           then cp -r $HOME/.zsh $HOME/.zsh-backup/
        fi

        if [ -e $HOME/.zshrc ]
           then cp -r $HOME/.zshrc $HOME/.zsh-backup/
        fi
        sleep 3s

      # Then, copying all of the configs in their place
        echo " Copying the new configs..."
        yes | cp -rf ./.zsh $HOME/
        yes | cp -rf ./.zshrc $HOME/
        sleep 2s

      # A finishing message
        echo
        echo " Done! Installation completed succesfully."
        echo " To apply it, close the terminal and re-open it, or type:"
        echo
        echo "    source ~/.zshrc"
        echo
        echo " Enjoy your new zshrc! :)"
        echo
        exit
        ;; # End of argument "install"

    # ################################################

    # Adds the argument "install-with-symlinks", which
    # links the configs in your home directory.
      '--install-with-symlinks' | '-I' )

      # Having messages pop up on the terminal is always neat
        echo " Starting the installation..."
        sleep 2s

      # Making a backup, just for safety
        echo " Making a backup of your current configs... (it will be stored in $HOME/.zsh-backup)."
           mkdir $HOME/.zsh-backup

        if [ -e $HOME/.zsh ]
           then cp -r $HOME/.zsh $HOME/.zsh-backup/
        fi

        if [ -e $HOME/.zshrc ]
           then cp -r $HOME/.zshrc $HOME/.zsh-backup/
        fi
        sleep 3s

      # Deleting the already-existing configs
      #
      # (I chose copying and then removing instead of
      # moving because moving might give errors, and you
      # can lose your files)
        rm -rf $HOME/.zsh $HOME/.zshrc

      # Then, linking all of the configs in their place
        echo " Linking the new configs..."
        ln -s $(pwd)/.zsh $HOME/
        ln -s $(pwd)/.zshrc $HOME/
        sleep 2s

      # A finishing message
        echo
        echo " Done! Installation completed succesfully."
        echo " To apply it, close the terminal and re-open it, or type:"
        echo
        echo "    source ~/.zshrc"
        echo
        echo " Please note that you have to keep the andy3153-zshrc"
        echo " folder, since the current configs just link to those in it"
        echo " Enjoy your new zshrc! :)"
        echo
        exit
        ;; # End of argument "install-with-symlinks"

    # ################################################

    # Adds the argument "uninstall", which deletes the
    # configs/symlinks, then restores the old ones, if any
    # are present.
      '--uninstall' | '-u' )


      # Having messages pop up on the terminal is always neat
        echo " Starting the uninstallation..."
        sleep 2s

      # Deleting the files
        echo " Deleting the configs..."
        rm -rf $HOME/.zsh $HOME/.zshrc
        sleep 1s

      # Restoring the old configs from the backup folder
        echo " Restoring your old configs..."
        cp -r $HOME/.zsh-backup/.zsh $HOME/
        cp -r $HOME/.zsh-backup/.zshrc $HOME/
        sleep 3s

      # A finishing message
        echo
        echo " Done! Uninstallation completed succesfully."
        echo " To re-apply your old configs, close the terminal and"
        echo " re-open it, or type:"
        echo
        echo "    source ~/.zshrc"
        echo
        echo " Goodbye!"
        exit
        ;; # End of argument "uninstall"

    # ################################################

# End of all arguments
    esac
    shift
  done

# If script is run with no arguments, it says this
  echo "No option. Use -h or --help to see the options"