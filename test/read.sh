#!/bin/zsh
echo -n "\033[0;31m[y/n]:\033[0m "
read ans

if [ -n $ans ] && [ $ans = y ]
then echo sdf
else echo neata
fi

#[[ $ans == y ]] && echo "you answered yes"
#[[ $ans == n ]] && echo "you answered no"
