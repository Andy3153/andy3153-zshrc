#!/usr/bin/env zsh

for ((L=0 ; L < 1 ; L++))
  do 
     for ((C=30 ; C < 37 ; C++))
       do echo -e "\033[$L;$Cm\033[7m               "
     done
done
