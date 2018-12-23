#!/bin/bash
#Received the good pakage manager based on OS from init.sh script
package_manager=$1

#Vim useful variables
vim_folder="$HOME/.vim"
pathogen="$vim_folder/autoload/pathogen.vim"
jedi_vim="$vim_folder/bundle/jedi-vim"
lightline_vim="$vim_folder/bundle/lightline.vim"
delimitMate_vim="$vim_folder/bundle/delimitMate.vim"
syntastic_vim="$vim_folder/bundle/syntastic.vim"

#Start vim configuration
if [ -z $(which vim) ];
then
        $package_manager install vim
fi

#Check if vim directories structure exist
if [ ! -d $vim_folder ];
then
        echo -e "Vim structure doesn't exist, let's install it....\n"
        mkdir -p ~/.vim/autoload ~/.vim/bundle
fi

#Check for pathogen
if [ ! -f $pathogen ];
then
        echo -e "Pathogen is not installed, start install....\n"
        curl -LSso $vim_folder/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

#Check for plugins
if [ ! -d $jedi_vim ];
then
        echo -e "Jedi-vim is not installed, start install....\n"
        git clone --recursive https://github.com/davidhalter/jedi-vim.git $vim_folder/bundle/jedi-vim
fi

if [ ! -d $lightline_vim ];
then
        echo -e "lightline is not installed, start install....\n"
				git clone https://github.com/itchyny/lightline.vim $vim_folder/bundle/lightline.vim
fi

if [ ! -d $delimitMate_vim ];
then
        echo -e "delimitMate is not installed, start install....\n"
				git clone https://github.com/Raimondi/delimitMate $vim_folder/bundle/delimitMate.vim
fi

if [ ! -d $syntastic_vim ];
then
        echo -e "lightline is not installed, start install....\n"
				git clone --depth=1 https://github.com/vim-syntastic/syntastic.git $vim_folder/bundle/syntastic.vim
fi



#Copy vimrc, color theme and indention for Yaml
cp .vimrc $HOME/.vimrc
cp -R .vim/* $HOME/.vim
 
echo -e "Your Vim Configuration is OK !\n"
