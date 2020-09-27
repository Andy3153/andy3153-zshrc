PRMPT="\033[1m[ \033[1;33mJava Compiler\033[0m ]\033[0m :"
WORKINGDIR="\033[1m$PWD\033[0m"

echo -e $PRMPT Welcome!
cd ~/src/java/tutorials/
echo -e $PRMPT Working Directory is $WORKINGDIR
echo -e $PRMPT Output of program:
echo

javac HelloWorld
java HelloWorld

echo
echo -e $PRMPT Program finished!
echo -e $PRMPT Press any key to continue. && read -n 1
