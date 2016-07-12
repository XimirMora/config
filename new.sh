#!/bin/bash

# Install all the main stuff

function err {
  ERROR="\033[1;31m[MRY-ERROR]\033[0m\t"
  echo -e $ERROR $1
}
function warn {
  WARN="\033[1;35m[MRY-WARN]\033[0m\t"
  echo -e $WARN $1
} 
function node {
  NODE="\033[1;34m[MRY]Now: "
  echo $NODE $1
}


if [[ $(uname -s) == "Darwin" ]]; then
  node "Installing HomeBrew"
  ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"
fi


node "Getting package manager"
if [[ ! -z $(which yum) ]]; then
  GET="yum install"
elif [[ ! -z $(which apt_get) ]]; then
  GET="apt-get install"
elif [[ ! -z $(which brew) ]]; then
  GET="brew install"
elif [[ ! -z $(which eopkg) ]]; then
  GET="eopkg install"
elif [[ ! -z $(which pacman) ]]; then
  GET="pacman -S"
else
  echo -e $ERROR"Package Manager not detected or unknown"
  exit 1;
fi     


node "Installing git"
$GET git
read -p "Insert git username: " git_name
git config --global user.name $git_name
read -p "Insert git email: " git_email
git config --global user.email $git_email
read -p "Select git editor: " git_editor
git config --global core.editor $git_editor


node "Installing vim"
$GET vim
mkdir -p ~/.vim
mkdir -p ~/.vim/colors
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle


node "Installing vim:Pathogen"
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim


node "Installing vim:airline"
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline


node "Installing R lang"
$GET r



#node "Installing various"
#echo "Do you wish to install this program?"
#select yn in "y" "n"; do
#    case $yn in
#        Yes ) $GET zsh;l
#        No ) echo -e "\n"echo
#    esac
#done




 

