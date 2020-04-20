#!/bin/bash
#  _           _        _ _       _     
# (_)_ __  ___| |_ __ _| | |  ___| |__  
# | | '_ \/ __| __/ _` | | | / __| '_ \ 
# | | | | \__ \ || (_| | | |_\__ \ | | |
# |_|_| |_|___/\__\__,_|_|_(_)___/_| |_|
#                            by Andy3153
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
        ;;


      '--version' | '-v' )
        echo
        echo " install.sh by Andy3153"
        echo "   version 1.1"
        echo
        echo " Github repository: https://github.com/Andy3153/andy3153-zshrc"
        echo
        exit
        ;;


      '--install' | '-i' )
        echo " Starting the installation..."

        echo " Making a backup of your current configs... (it will be stored in $HOME/.zsh-backup)."
        mkdir $HOME/.zsh-backup

        if [ -e $HOME/.zsh ]
        then cp -r $HOME/.zsh $HOME/.zsh-backup/
        fi

        if [ -e $HOME/.zshrc ]
        then cp -r $HOME/.zshrc $HOME/.zsh-backup/
        fi

        echo " Copying the new configs..."

        mkdir $HOME/.zsh

        yes | cp -rf ./plugins $HOME/.zsh/
        yes | cp -rf ./programs $HOME/.zsh/
        yes | cp -rf ./scripts $HOME/.zsh/
        yes | cp -rf ./zshrc $HOME/
        mv $HOME/zshrc $HOME/.zshrc

        echo
        echo " Done! Installation completed succesfully."
        echo " To apply it, close the terminal and re-open it, or type:"
        echo
        echo "    source ~/.zshrc"
        echo
        echo " Enjoy your new zshrc! :)"
        echo
        exit
        ;;

      '--install-with-symlinks' | '-I' )
        echo " Starting the installation..."

        echo " Making a backup of your current configs... (it will be stored in $HOME/.zsh-backup)."
        mkdir $HOME/.zsh-backup

        if [ -e $HOME/.zsh ]
        then cp -r $HOME/.zsh $HOME/.zsh-backup/
        fi

        if [ -e $HOME/.zshrc ]
        then cp -r $HOME/.zshrc $HOME/.zsh-backup/
        fi

        rm -rf $HOME/.zsh $HOME/.zshrc

        echo " Linking the new configs..."
        mkdir $HOME/.zsh

        ln -s $(pwd)/plugins/ $HOME/.zsh/
        ln -s $(pwd)/programs/ $HOME/.zsh/
        ln -s $(pwd)/scripts/ $HOME/.zsh/
        ln -s $(pwd)/zshrc $HOME/
        mv $HOME/zshrc $HOME/.zshrc

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
        ;;

      '--uninstall' | '-u' )
        echo " Starting the uninstallation..."

        echo " Deleting the configs..."
        rm -rf $HOME/.zsh $HOME/.zshrc

        echo " Restoring your old configs..."
        cp -r $HOME/.zsh-backup/.zsh $HOME/
        cp -r $HOME/.zsh-backup/.zshrc $HOME/

        echo
        echo " Done! Uninstallation completed succesfully."
        echo " To re-apply your old configs, close the terminal and"
        echo " re-open it, or type:"
        echo
        echo "    source ~/.zshrc"
        echo
        echo " Goodbye!"
        exit
        ;;

# End of all arguments
    esac
    shift
  done

# If script is run with no arguments, it says this
  echo " No option. Use -h or --help to see the options"
  echo
  echo " Also, please note it's recommended to run the script from"
  echo " the folder it is in."

# End of file
