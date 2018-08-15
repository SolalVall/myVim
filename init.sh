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
	if brew ls --versions myformula > /dev/null;
	then
		echo -e "Detect Mac based OS\n"
		package_manager=$(which brew)	
		#Excute vim Installation Script with brew as package manager
		./vim.sh "$package_manager"
	fi
else
	if [ -z $1 ];
	then 
		echo -e "Your OS is not a Debian, RedHat or MacOs"
		echo -e "Please Run the script with your package manager as argument"
		echo -e "For exemple if you have a Arch Linux base OS run: ./init.sh pacman"
	else
		echo -e "OK you use $other_os, let's GO !!"
		./vim.sh "$other_os"
	fi
fi
 
#Check your vim configuration
#if [ -z $(which vim) ];
#then
#	#Install Vim
#	package_manager vim
#elif [ ! -d $vim_folder ];
#then
#	#Create structure for vim,pathogen and plugins (bundle)
#	echo -e "Vim structure doesn't exist, let's install it....\n"
#	mkdir -p ~/.vim/autoload ~/.vim/bundle
#elif [ ! -f $pathogen ];
#then
#	#Download/Install pahtogen
#	echo -e "Pathogen is not installed, start install....\n"
#	curl -LSso $vim_folder/autoload/pathogen.vim https://tpo.pe/pathogen.vim
#elif [ ! -d $jedi_vim ];
#then
#	#Download/Install Jedi-vim
#	echo -e "Jedi-vim is not installed, start install....\n"	
#	git clone --recursive https://github.com/davidhalter/jedi-vim.git $vim_folder/bundle/jedi-vim
#else
#	echo -e "Your Vim Configuration is OK !\n"
#fi
#
