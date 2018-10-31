#####
# dotfiles.sh -- install dotfiles symlinks
#
#   author:     Pat Gaffney <pat@hypepat.com>
#   created:    2016-09-17
#   modified:   2017-04-10
#
#   This file creates symlinks for the dotfiles in the *current
#   directory* to $HOME.
#
#####################################################################

# Symlink all the dotfiles.
# ln -s :: create symbolic link
# ln -v :: verbose mode- print details

echo $'\e[1;34mInstalling symlinks:\e[0m'

# Create a symlink for each appropriate file
# in this directory to $HOME.
for file in $(ls -A)
do
    if [[ -d $file ]]; then 
        printf "dotfiles.sh: Skipping \'%s\' -- it is a directory\n" $file
    elif [[ -x $file ]]; then
        printf "dotfiles.sh: Skipping \'%s\' -- it is an executable\n" $file
    elif [[ $file == *.png ]]; then
        printf "dotfiles.sh: Skipping \'%s\' -- it is a picture\n" $file
    elif [[ $file == .gitignore ]]; then
        printf "dotfiles.sh: Skipping \'%s\' -- it is a gitignore\n" $file
    elif [[ $file == *.md ]]; then
        printf "dotfiles.sh: Skipping \'%s\' -- it is a Markdown file\n" $file
    elif [[ $file == *.terminal ]]; then
        printf "dotfiles.sh: Skipping \'%s\' -- it is a Terminal settings file\n" $file
    elif [[ $file == *.itermcolors ]]; then
        printf "dotfiles.sh: Skipping \'%s\' -- it is an iTerm2 color file\n" $file
    elif [[ $file == *.json ]]; then
        printf "dotfiles.sh: Skipping \'%s\' -- it is a JSON file\n" $file
    else ln -sv "$PWD/$file" "$HOME";
    fi
done

# Create symlink for my iTerm2 profiles to AppSupport directory.
ln -sv "$PWD/iterm-profiles.json" "$HOME/Library/Application Support/iTerm2/DynamicProfiles"
