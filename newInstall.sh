#!/bin/bash
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# AUTHOR Michael Smalley
############################

########## Variables
sudo apt-get install zsh &&
sudo apt-get install vim &&
sudo add-apt-repository 'deb http://repository.spotify.com stable non-free' &&
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59 &&
sudo apt-get update &&
sudo apt-get install spotify-client &&
sudo apt-get install exuberant-ctags &&
wget http://dl.google.com/android/android-sdk_r21-linux.tgz &&
tar -xvf android-sdk_r21-linux.tgz &&
mv android-sdk-linux ~/.android-sdks &&
~/.android-sdks/tools/android &&
cd .. &&
#

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc vimrc dircolors-8 vim zshrc shellStuff"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
mkdir tmp &&
cd tmp &&
wget http://voxel.dl.sourceforge.net/project/ctags/ctags/5.8/ctags-5.8.tar.gz &&
tar -xvf ctags-5.8.tar.gz
cd ctags-5.8 &&
sudo ./configure &&
sudo make &&
sudo cp ctags /usr/local/bin/ctags && sudo chmod 755 /usr/local/bin/ctags &&
sudo cp ./ctags.1 /usr/local/share/man/man1/ctags.1 && sudo chmod 644 /usr/local/share/man/man1/ctags.1 &&
sudo make install &&
cd ~/.shellStuff/vim-android &&
sudo chmod +x android-install.sh &&
./android-install.sh &&
source ~/.zshrc
