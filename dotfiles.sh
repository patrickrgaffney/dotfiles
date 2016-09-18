#####
# dotfiles.sh -- install dotfiles symlinks
#
#   @author     Pat Gaffney <pat@hypepat.com>
#   @created    2016-09-17
#   @modified   2016-09-17
#
#   This file creates symlinks for the dotfiles in the *current
#   directory* to $HOME.
#
#####################################################################

# Symlink all the dotfiles.
# ln -s :: create symbolic link
# ln -v :: verbose mode- print details

# Create a symlink for each file in this directory.
for file in $(ls -A)
do
    if [[ -d $file ]]; then 
        printf "dotfiles.sh: Skipping \'%s\' -- it is a directory\n" $file
        continue;
    elif [[ -x $file ]]; then
        printf "dotfiles.sh: Skipping \'%s\' -- it is an executable\n" $file
        continue;
    elif [[ $file == *.png ]]; then
        printf "dotfiles.sh: Skipping \'%s\' -- it is a picture\n" $file
        continue;
    elif [[ $file == *.md ]]; then
        printf "dotfiles.sh: Skipping \'%s\' -- it is a Markdown file\n" $file
        continue;
    else ln -sv "$PWD/$file" "$HOME";
    fi
done