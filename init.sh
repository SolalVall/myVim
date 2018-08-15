#!/bin/bash
###### INIT SCRIPT FOR PATHOGEN AND OTHER PLUGIN ########

vim_folder="$HOME/.vim"
pathogen="$vim_folder/autoload/pathogen.vim"
jedi_vim="$vim_folder/bundle/jedi-vim"

#Check your vim configuration
if [ ! -d $vim_folder ];
then
	#Create structure for vim,pathogen and plugins (bundle)
	echo -e "Vim structure doesn't exist, let's install it....\n"
	mkdir -p ~/.vim/autoload ~/.vim/bundle
elif [ ! -f $pathogen ];
then
	#Download/Install pahtogen
	echo -e "Pathogen is not installed, start install....\n"
	curl -LSso $vim_folder/autoload/pathogen.vim https://tpo.pe/pathogen.vim
elif [ ! -d $jedi_vim ];
then
	#Download/Install Jedi-vim
	echo -e "Jedi-vim is not installed, start install....\n"	
	git clone --recursive https://github.com/davidhalter/jedi-vim.git $vim_folder/bundle/jedi-vim
else
	echo -e "Your Vim Configuration is OK !\n"
fi

