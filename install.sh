#!/bin/sh
##
## install.sh by Andy3153
## created  27/08/20 ~ 15:47:22
## remade   26/10/20 ~ 17:11:27
## modified 19/11/21 ~ 22:09:47
##

# Variables
  # Root folder variable
    _installshRootFolder=$(dirname "$(readlink -f "$0")")

  # Prompt variables
    _installshPrompt="\033[1m[ \033[1;33minstall.sh\033[0m ]\033[0m : "
    _installshErrPrompt="\033[1m[ \033[1;33minstall.sh\033[0m ]\033[0m : "

  # Fallback variables
    _installshBackupInput="y"
    _installshInstallInput="4"
    _installshUninstallInput="n"
    _installshIsOnline="false"

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

  function _installshCheckOnline()
  {
      printf "\n"
      ping -q -w1 -c1 8.8.8.8 > /dev/null 2>&1
      _installshCheckOnline=$?
      if [ $_installshCheckOnline -eq 0 ]
        then
	      _installshIsOnline="true"
	      printf "$_installshPrompt Connected to internet!\n"
        else
	      _installshIsOnline="false"
	      printf "$_installshErrPrompt Not connected to internet! Some things will not work as intended since plugins and programs couldn't get downloaded\n"
      fi
  }

  function _installshDownloadPlugins()
  {
      if [ $_installshIsOnline = true ]
        then
	      if [ ! -e $XDG_CONFIG_HOME/plugins ]
	        then mkdir $XDG_CONFIG_HOME/zsh/plugins
	      fi

	      printf "$_installshPrompt Downloading plugins...\n"
              git clone https://github.com/zdharma-continuum/fast-syntax-highlighting $XDG_CONFIG_HOME/zsh/plugins/fast-syntax-highlighting
	      git clone https://github.com/zsh-users/zsh-autosuggestions $XDG_CONFIG_HOME/zsh/plugins/zsh-autosuggestions
	else
	      printf "$_installshErrPrompt Downloadng plugins failed.\n"
      fi

      printf "\n"
  }

  function _installshDownloadPrograms()
  {
      if [ $_installshIsOnline = true ]
        then
	      if [ ! -e $XDG_CONFIG_HOME/progs ]
	        then mkdir $XDG_CONFIG_HOME/zsh/progs
	      fi

	      printf "$_installshPrompt Downloading programs...\n"
              git clone https://github.com/bake/ddate.sh $XDG_CONFIG_HOME/zsh/progs/ddate.sh
	else
	      printf "$_installshErrPrompt Downloading programs failed.\n"
      fi

      printf "\n"
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

      if [ -e $XDG_CONFIG_HOME/zsh ]
	then cp -r $XDG_CONFIG_HOME/zsh $HOME/.zshbak/
      fi

      if [ -e $HOME/.zshrc ]
        then cp -r $HOME/.zshrc $HOME/.zshbak/
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

      _installshCheckOnline
      _installshDownloadPlugins
      _installshDownloadPrograms

      yes | cp -rf $_installshRootFolder/scripts $XDG_CONFIG_HOME/zsh/

      yes | cp -rf $_installshRootFolder/zshenv $HOME/.zshenv
      yes | cp -rf $_installshRootFolder/*rc $XDG_CONFIG_HOME/zsh/

      ln -s $XDG_CONFIG_HOME/zsh/zshrc $XDG_CONFIG_HOME/zsh/.zshrc
  }

  function _installshInstallBySymlink()
  {
      printf "$_installshPrompt Linking the new configs...\n"
      if [ ! -e $XDG_CONFIG_HOME/zsh ]
        then mkdir -p $XDG_CONFIG_HOME/zsh
      fi

      _installshCheckOnline
      _installshDownloadPlugins
      _installshDownloadPrograms

      ln -s $_installshRootFolder/scripts/ $XDG_CONFIG_HOME/zsh/

      ln -s $_installshRootFolder/zshenv $HOME/.zshenv
      ln -s $_installshRootFolder/*rc $XDG_CONFIG_HOME/zsh/

      ln -s $XDG_CONFIG_HOME/zsh/zshrc $XDG_CONFIG_HOME/zsh/.zshrc
  }

  function _installshUninstall()
  {
      printf "$_installshPrompt Uninstalling...\n"
      rm -rf $HOME/.zsh $HOME/.zshrc $XDG_CONFIG_HOME/zsh $HOME/.zshenv

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

# Command-line options
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
