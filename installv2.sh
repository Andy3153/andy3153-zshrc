#!/bin/bash

#
# installv2.sh by Andy3153
#
# This script installs the configs in two ways, and it can
# also uninstall everything and restore the old configs.
# Still experimental, I'm just playing around with 
# command-line arguments right now
#
#

# Adds the command-line arguments
  while [ $1 ]; do
    case $1 in

    # Adds the argument "help"
      '--help' | '-h' )
        echo
        echo " installv2.sh by Andy3153"
        echo " Usage: ./installv2.sh [OPTIONS..]"
        echo
        echo "  Options:"
        echo "   --install               , -i   Installs by backing up the original configs and then copying the new ones"
        echo "   --install-with-symlinks , -I   Installs by backing up the original configs and then linking the new ones"
        echo "   --uninstall             , -u   Deletes the configs / symlinks, then restores your old configs"
        echo
        exit
        ;; # End of help argument

    # Adds the argument "install"
      '--install' | '-i' )
      # Having messages pop up on the terminal is always neat
        echo "Starting the installation..."
        sleep 2s

      # Making a backup, just for safety
        echo "Making a backup of your current configs... (it will be stored in $HOME/.zsh-backup)."
        mkdir $HOME/.zsh-backup
        cp -r $HOME/.zsh $HOME/.zsh-backup
        cp -r $HOME/.zshrc $HOME/.zsh-backup
        sleep 3s

# End of arguments
  esac
  shift
done

# If script is run with no arguments, it says this
  echo "No option. Use -h or --help to see the options"
