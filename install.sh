#!/usr/bin/env bash
##
## install.sh by Andy3153
## created 27/08/20 ~ 15:47:22
## remade  26/10/20 ~ 17:11:27
##

# Variables
  # Prompt variables
    _installshPrompt="\033[1m[ \033[1;33minstall.sh\033[0m ]\033[0m : "
    _installshErrPrompt="\033[1m[ \033[1;33minstall.sh\033[0m ]\033[0m : "

  # Fallback variables
    _installshBackupInput="y"
    _installshInstallInput="4"
    _installshUninstallInput="n"

  # Environment variables
    XDG_CONFIG_HOME="$HOME/.config"

# Functions
  function _installshHelpScreen()
  {
      printf "\n"
      printf " install.sh by Andy3153\n"
      printf " Usage: ./install.sh [OPTIONS..]\n"
      printf "\n"
      printf "  Options:\n"
      printf "   [no option]                    Gives you a menu with all the choices.\n"
      printf "   --help                  , -h   Shows this help screen.\n"
      printf "   --install               , -i   Installs by copying the configs.\n"
      printf "   --install-with-symlinks , -I   Installs by linking the configs. You have to keep the folder this is in for this method.\n"
      printf "   --uninstall             , -u   Deletes the configs/symlinks, then restores your old configs.\n"
      printf "\n"
  }

  function _installshMsgInstallFinished()
  {
      printf "\n"
      printf "$_installshPrompt Done! Installation completed succesfully.\n"
      printf "$_installshPrompt To apply it, close the terminal and re-open it, or type:\n"
      printf "\n"
      printf "    source ~/.config/zsh/zshrc\n"
      printf "\n"
      printf "$_installshPrompt Please note that you have to keep the andy3153-zshrc folder if you used the symlink install method, since the current configs just link to those in it\n"
      printf "\n"
  }

  function _installshMsgUninstallFinished()
  {
      printf "\n"
      printf "$_installshPrompt Done! Uninstallation completed succesfully.\n"
      printf "$_installshPrompt To re-apply your old configs, close the terminal and re-open it, or type:\n"
      printf "\n"
      printf "    source ~/.config/zsh/zshrc\n"
      printf "\n"
      printf "$_installshPrompt Goodbye!\n"
  }

  function _installshMakeBackup()
  {
      printf "$_installshPrompt Making a backup of your current configs... (will be stored in $HOME/.zshbak)\n"
      if [ ! -e $HOME/.zshbak ]
        then mkdir -p $HOME/.zshbak
      fi


      if [ -e $HOME/.zsh ]
        then cp -r $HOME/.zsh $HOME/.zshbak/
      fi

      if [ -e $HOME/.zshrc ]
        then cp -r $HOME/.zshrc $HOME/.zshbak/
      fi

      if [ -e $HOME/.vim ]
        then cp -r $HOME/.vim $HOME/.zshbak/
      fi


      if [ -e $XDG_CONFIG_HOME/zsh ]
        then cp -r $XDG_CONFIG_HOME/zsh $HOME/.zshbak
      fi


      if [ -e $HOME/.zshenv ]
        then cp -r $HOME/.zshenv $HOME/.zshbak
      fi

      printf "$_installshPrompt Backup done!\n"
  }

  function _installshInstallByCopying()
  {
      printf "$_installshPrompt Copying the new configs...\n"
      if [ ! -e $XDG_CONFIG_HOME/zsh ]
        then mkdir -p $XDG_CONFIG_HOME/zsh
      fi

      yes | cp -rf ./plugins $XDG_CONFIG_HOME/zsh/
      yes | cp -rf ./scripts $XDG_CONFIG_HOME/zsh/

      yes | cp -rf ./zshenv $HOME/.zshenv
      yes | cp -rf ./*rc $XDG_CONFIG_HOME/zsh/

      ln -s $XDG_CONFIG_HOME/zsh/zshrc $XDG_CONFIG_HOME/zsh/.zshrc

      #yes | cp -rf ./etc/.vim $HOME/
      yes | cp -rf ./etc/nvim $XDG_CONFIG_HOME/
  }

  function _installshInstallBySymlink()
  {
      printf "$_installshPrompt Linking the new configs...\n"
      if [ ! -e $XDG_CONFIG_HOME/zsh ]
        then mkdir -p $XDG_CONFIG_HOME/zsh
      fi
      ln -s $(pwd)/plugins/ $XDG_CONFIG_HOME/zsh/
      ln -s $(pwd)/scripts/ $XDG_CONFIG_HOME/zsh/

      ln -s $(pwd)/zshenv $HOME/.zshenv
      ln -s $(pwd)/*rc $XDG_CONFIG_HOME/zsh/

      ln -s $XDG_CONFIG_HOME/zsh/zshrc $XDG_CONFIG_HOME/zsh/.zshrc

      #ln -s $(pwd)/etc/.vim $HOME/
      ln -s $(pwd)/etc/nvim $XDG_CONFIG_HOME/
  }

  function _installshUninstall()
  {
      printf "$_installshPrompt Uninstalling...\n"
      rm -rf $HOME/.zsh $HOME/.zshrc $HOME/.vim $XDG_CONFIG_HOME/zsh $HOME/.zshenv

      printf "$_installshPrompt Would you like to restore your old configs? (y/n): " ; read _installshUninstallInput
      if [ $_installshUninstallInput = 'y' -o 'Y' ]
        then
             printf "$_installshPrompt Restoring your old configs..."
             if [ -e $HOME/.zshbak ]
               then
                    if [ -e $HOME/.zsh ]
                      then cp -r $HOME/.zshbak/ $HOME/.zsh
                    fi

                    if [ -e $HOME/.zshrc ]
                      then cp -r $HOME/.zshbak/ $HOME/.zshrc
                    fi

                    if [ -e $HOME/.vim ]
                      then cp -r $HOME/.zshbak/ $HOME/.vim
                    fi


                    if [ -e $XDG_CONFIG_HOME/zsh ]
                      then cp -r $HOME/.zshbak $XDG_CONFIG_HOME/zsh
                    fi


                    if [ -e $HOME/.zshenv ]
                      then cp -r $HOME/.zshbak $HOME/.zshenv
                    fi

               else
                    printf "$_installshErrPrompt ERROR! Backup folder not found. Aborting."
             fi
      fi

  }

# Command-line arguments
  while [ $1 ]; do
    case $1 in
    '--help' | '-h' )
      _installshHelpScreen
      exit
      ;;

    '--install' | '-i' )
      _installshInstallByCopying
      _installshMsgInstallFinished
      exit
      ;;

    '--install-with-symlinks' | '-I' )
      _installshInstallBySymlink
      _installshMsgInstallFinished
      exit
      ;;

    '--uninstall' | '-u' )
     _installshUninstall
     _installshMsgUninstallFinished
     exit
     ;;

    esac
    shift
  done

# If no command-line arguments are given, use the second method of installation:
  # Start with the installation process
    # Taking a backup if wanted
      printf "$_installshPrompt Welcome to the installation process!\n"
      printf "$_installshPrompt Would you like to take a backup first? (y/n): " ; read _installshBackupInput

      if [ $_installshBackupInput = 'y' ]
        then _installshMakeBackup
        else
             if [ $_installshBackupInput = 'n' ]
               then printf "$_installshPrompt Will not make a backup. Continuing.\n"
             fi
      fi

    # Proceeding with the install
      printf "\n"
      printf "$_installshPrompt Choose what to do:\n"
      printf "   1) Install by copying\n"
      printf "   2) Install using symlinks (you need to keep this folder if you choose this)\n"
      printf "   3) Uninstall (remove everything and restore backup)\n"
      printf "   4) Cancel\n"
      printf "\n"
      printf "$_installshPrompt Enter a number (1-4): " ; read _installshInstallInput

      while [ $_installshInstallInput ]; do
        case $_installshInstallInput in
        '1' )
          _installshInstallByCopying
          _installshMsgInstallFinished
          exit
          ;;

        '2' )
         _installshInstallBySymlink
         _installshMsgInstallFinished
         exit
         ;;

        '3' )
         _installshUninstall
         _installshMsgUninstallFinished
         exit
         ;;

        '4' )
         printf "$_installshPrompt Cancelled.\n"
         exit
         ;;

      esac
      shift
    done


## End of file.
