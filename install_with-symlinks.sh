#!/bin/bash

# Script made to link all the zsh configs in the home folder

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

 # Deleting the already-existing configs
 # (I chose copying and then removing instead of moving because moving might give errors, and you can lose your files)
   rm -rf $HOME/.zsh $HOME/.zshrc

 # Then, linking all of the configs in their place
   echo "Linking the new configs..."
   echo
   ln -s $andy3153zshrcfolder/.zsh $HOME/
   ln -s $andy3153zshrcfolder/.zshrc $HOME/
   sleep 2s

 # A finishing message
   echo "Done! Installation completed succesfully."
   echo "To apply it, close the terminal and re-open it, or type:"
   echo
   echo "   source ~/.zshrc"
   echo
   echo "Please note that you have to keep the andy3153-zshrc folder, since the current configs just link to those in it"
   echo "Enjoy your new zshrc! :)"

# End of file
