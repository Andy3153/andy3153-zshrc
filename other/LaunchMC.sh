#!/bin/bash
#
#  _                           _     __  __  ____       _     
# | |    __ _ _   _ _ __   ___| |__ |  \/  |/ ___|  ___| |__  
# | |   / _` | | | | '_ \ / __| '_ \| |\/| | |     / __| '_ \ 
# | |__| (_| | |_| | | | | (__| | | | |  | | |___ _\__ \ | | |
# |_____\__,_|\__,_|_| |_|\___|_| |_|_|  |_|\____(_)___/_| |_|
#                                                  by Andy3153
#
#
# A small shell script made to start Minecraft
#

# Setting variables
  # Variable to the root directory
    root_dir="$(dirname $0)/.."
    #root_dir="$(pwd)/.."

  # Variable to the Java path
    java_path="$root_dir/Java/jre1.8.0_211/"

  # Vaiable to the Java executable
    JAVA=${java_path}bin/java

# Exports LD_LIBRARY_PATH
  export LD_LIBRARY_PATH=${java_path}lib/amd64/:${java_path}lib/i386/:$LD_LIBRARY_PATH

# Starts Minecraft
  "$root_dir/Launchers/MC_Official/minecraft-launcher" --workDir="$root_dir/Data Folder"


# Other examples:
  # If your launcher is a jar file, not an actual executable
    #$JAVA -jar "$root_dir/Launchers/MC_Shiginima/MC_Jar.jar --workDir="$root_dir/Data Folder"

# End of file
