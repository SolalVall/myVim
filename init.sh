#!/bin/bash
###### FOR RED-HAT AND DEBIAN BASED ONLY ######
###### INIT SCRIPT FOR PATHOGEN AND OTHER PLUGIN ########
other_os=$1
package_manager=""
vim_folder="$HOME/.vim"
pathogen="$vim_folder/autoload/pathogen.vim"
jedi_vim="$vim_folder/bundle/jedi-vim"

#Check OS
if [ $(which yum) ]
then
	echo -e "Detect Red-Hat based OS\n"
	package_manager=$(which yum)
	#Excute vim Installation Script with yum as package manager
	./vim.sh "$package_manager"
elif [ $(which apt-get) ]
then
	echo -e "Detect Debian based OS\n"
	package_manager=$(which apt-get)	
	#Excute vim Installation Script with apt-get as package manager
	./vim.sh "$package_manager"
elif [ $(which brew) ]
then
	echo -e "Detect Mac based OS\n"
	package_manager=$(which brew)	
	#Excute vim Installation Script with brew as package manager
	./vim.sh "$package_manager"
else
	if [ -z $1 ];
	then 
		echo -e "Your OS is not a Debian, RedHat or MacOs"
		echo -e "Please Run the script with your package manager as argument"
		echo -e "For exemple if you have a Arch Linux base OS run: ./init.sh pacman"
		echo -e "\nNote if you are on MacOS please Install Brew and rerun init script"
	else
		echo -e "OK you use $other_os, let's GO !!"
		./vim.sh "$other_os"
	fi
fi
 
