#!/usr/bin/env bash

#####
# dotfiles.sh -- install dotfiles symlinks
#
#   author:     Pat Gaffney <pat@hypepat.com>
#
#   This file creates symlinks for the dotfiles in the *current
#   directory* to $HOME.
#
#####################################################################

# Include dotfiles when looping.
shopt -s dotglob

# Symlink all the dotfiles.
# ln -s :: create symbolic link
# ln -v :: verbose mode- print details

echo $'\e[1;34mInstalling symlinks:\e[0m'

# Create a symlink for each appropriate file
# in this directory to $HOME.
for file in *; do
    if [[ -d $file ]]; then 
        printf "dotfiles.sh: Skipping \'%s\' -- it is a directory\n" "$file"
    elif [[ -x $file ]]; then
        printf "dotfiles.sh: Skipping \'%s\' -- it is an executable\n" "$file"
    elif [[ $file == *.png ]]; then
        printf "dotfiles.sh: Skipping \'%s\' -- it is a picture\n" "$file"
    elif [[ $file == .gitignore ]]; then
        printf "dotfiles.sh: Skipping \'%s\' -- it is a gitignore\n" "$file"
    elif [[ $file == *.md ]]; then
        printf "dotfiles.sh: Skipping \'%s\' -- it is a Markdown file\n" "$file"
    elif [[ $file == *.terminal ]]; then
        printf "dotfiles.sh: Skipping \'%s\' -- it is a Terminal settings file\n" "$file"
    elif [[ $file == *.itermcolors ]]; then
        printf "dotfiles.sh: Skipping \'%s\' -- it is an iTerm2 color file\n" "$file"
    elif [[ $file == *.json ]]; then
        printf "dotfiles.sh: Skipping \'%s\' -- it is a JSON file\n" "$file"
    else ln -sv "$PWD/$file" "$HOME";
    fi
done

# Create symlink for my iTerm2 profiles to AppSupport directory.
ln -sv "$PWD/iterm-profiles.json" "$HOME/Library/Application Support/iTerm2/DynamicProfiles"

# Create the symlink for the Sublime Text preferences.
ln -sv "$PWD/Preferences.sublime-settings" "$HOME/Library/Application Support/Sublime Text/Packages/User"
