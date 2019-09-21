#!/bin/bash

# Script made to unlink all the configs and restore the original configs

 # Having messages pop up on the terminal is always neat
   echo "Starting the uninstallation..."
   sleep 2s

 # Deleting the files
   echo "Deleting the configs..."
   rm -rf $HOME/.zsh $HOME/.zshrc
   sleep 1s

 # Restoring the old configs from the backup folder
   echo "Restoring your old configs..."
   cp -r $HOME/.zsh-backup/.zsh $HOME/
   cp -r $HOME/.zsh-backup/.zshrc $HOME/
   sleep 3s

 # A finishing message
   echo "Done! Uninstallation completed succesfully."
   echo "To apply your old configs, close the terminal and re-open it"
   echo "Goodbye!"

# End of file
