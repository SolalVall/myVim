#!/bin/bash
#Received the good pakage manager based on OS from init.sh script
package_manager=$1

#Vim useful variables
vim_folder="$HOME/.vim"
pathogen="$vim_folder/autoload/pathogen.vim"
jedi_vim="$vim_folder/bundle/jedi-vim"

#Start vim configuration
#Check if vim exist
if [ -z $(which vim) ];
then
        #Install Vim
        $package_manager install vim
fi

#Check if vim directories structure exist
if [ ! -d $vim_folder ];
then
        #Create structure for vim,pathogen and plugins (bundle)
        echo -e "Vim structure doesn't exist, let's install it....\n"
        mkdir -p ~/.vim/autoload ~/.vim/bundle
fi

#Check for pathogen
if [ ! -f $pathogen ];
then
        #Download/Install pahtogen
        echo -e "Pathogen is not installed, start install....\n"
        curl -LSso $vim_folder/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

#Check for plugins
if [ ! -d $jedi_vim ];
then
        #Download/Install Jedi-vim
        echo -e "Jedi-vim is not installed, start install....\n"
        git clone --recursive https://github.com/davidhalter/jedi-vim.git $vim_folder/bundle/jedi-vim
fi

#Copy vimrc, color theme and indention for Yaml
cp .vimrc $HOME/.vimrc
cp -R .vim/* $HOME/.vim
 
echo -e "Your Vim Configuration is OK !\n"
