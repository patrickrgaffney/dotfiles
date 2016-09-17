#####
# ~/.bashrc -- startup file for bash (interactive non-login)
#
#   @author     Pat Gaffney <pat@hypepat.com>
#   @created    2016-09-17
#   @modified   2016-09-17
#
#   This file is loaded when invoking bash as an interactive shell
#   that is *not* a login shell. Because of this behavior, this
#   file is loaded by ~./bash_profile -- effectively making it the
#   startup file for both login and non-login interactive shells.
#####################################################################

#####################################################################
# @section Aliases
#####################################################################

# Clear the screen.
alias k="clear"

# List {a}ll files with {h}uman-{s}ize output long
alias lsl="ls -AghsG"

# List files
alias ll="ls -lhGF"

# Go back x director(y|ies)
alias ..="cd ../"
alias ...="cd ../../"