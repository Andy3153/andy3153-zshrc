#!/bin/bash

# Script made to copy all the zsh configs in the home folder

 # Having messages pop up on the terminal is always neat
   echo "Starting the installation..."
   sleep 2s

 # Setting a variable
   andy3153zshrcfolder="$(pwd)" 

 # Making a backup, just for safety
   echo "Making a backup of your current configs... (it will be stored in $HOME/.zsh-backup)."
   mkdir $HOME/.zsh-backup
   cp -r $HOME/.zsh $HOME/.zsh-backup
   cp -r $HOME/.zshrc $HOME/.zsh-backup
   sleep 3s

 # Then, copying all of the configs in their place
   echo "Copying the new configs..."
   echo
   yes | cp -rf ./.zsh $HOME/
   yes | cp -rf ./.zshrc $HOME/
   sleep 2s

 # A finishing message
   echo "To apply it, close the terminal and re-open it, or type:"
   echo
   echo "   source ~/.zshrc"
   echo
   echo "Enjoy your new zshrc! :)"

# End of file
