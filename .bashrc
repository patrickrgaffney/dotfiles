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
# @section Shell Options
#
#   Change the values of shell options and set the positional
#   parameters, or display the names of shell variables.
#
#   If any option has both a single character flag (`-x`) *and* a
#   option name (`-o option-name`), the option-name is chosen for
#   general readability.
#
#   Any options that are turned on by *default* are also listed here
#   so that they could be easily turned off in the future if needed.
#####################################################################

# Allow the shell to perform brace expansion - on by default.
set -o braceexpand

# Locate and remember hash commands as they are 
# looked up for execution -- on by default.
set -o hashall

# Enable history substitution -- on by default.
set -o histexpand

# Enable command history -- on by default.
set -o history

# Do not exit an interactive shell upon reading EOF.
set -o ignoreeof

# Report the status of terminated background jobs immediately, 
# rather than before printing the next primary prompt.
set -o notify


#####################################################################
# @section Aliases
#
#   Set up simple aliases to enable default options for commands.
#   For almost every purpose, shell functions are preferred over
#   aliases, so some care has been taken to ensure that the alises
#   defined here would *not* work better as functions.
#####################################################################

# Clear the screen.
alias k="clear"

# List {a}ll files with {h}uman-{s}ize output long.
alias lsl="ls -AghsG"

# List files.
alias ll="ls -lhGF"

# Go back x director(y|ies).
alias ..="cd ../"
alias ...="cd ../../"

# Open current directory in Finder.app.
alias finder="open -a Finder ./"

# Set trash (verbose) to override rm.
alias rm="trash -v"