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
set -o braceexpand;

# Locate and remember hash commands as they are 
# looked up for execution -- on by default.
set -o hashall;

# Enable history substitution -- on by default.
set -o histexpand;

# Enable command history -- on by default.
set -o history;

# Do not exit an interactive shell upon reading EOF.
set -o ignoreeof;

# Report the status of terminated background jobs immediately, 
# rather than before printing the next primary prompt.
set -o notify;


#####################################################################
# @section Change Shell Behavior
#
#   Enable and disable various options via the shopt builtin. By
#   default *most* of these options are disabled (turned off).
#####################################################################

# Executed a directory name as if it were an argument to cd.
shopt -s autocd;

# Correct spelling errors in directory names given to cd.
shopt -s cdspell;

# Check the hash table for a command name before searching $PATH.
shopt -s checkhash;

# Check the window size (update $LINES and $COLUMNS) 
# after each command.
shopt -s checkwinsize;

# Save all lines of a multi-line command in the same history entry.
shopt -s cmdhist;

# Correct spelling errors on directory names during word completion
# if the directory name initially supplied does not exist.
shopt -s dirspell;

# Expand aliases -- on by default
shopt -s expand_aliases;

# Enable extended pattern matching features.
shopt -s extglob;

# Perform quoting within ${parameter} expansion -- on by default.
shopt -s extquote;

# Ignore suffixes specified by $FIGNORE when performing word
# completion -- on by default.
shopt -s force_fignore;

# Enable `**` pattern in filename expansion to match all files,
# directories and subdirectories.
shopt -s globstar;

# Append the history list to $HISTFILE instead of replacing it.
shopt -s histappend;

# Perform hostname completion -- on by default.
shopt -s hostcomplete;

# Allow comments in an interactive shell -- on by default.
shopt -s interactive_comments;

# Save multi-line commands to the history with embedded newlines
# instead of semicolons -- requries cmdhist to be on.
shopt -s lithist;

# Do not attempt completions on an empty line.
shopt -s no_empty_cmd_completion;

# Case-insensitive filename matching in filename expansion.
shopt -s nocaseglob;

# Enable programmable completion -- on by default.
shopt -s progcomp;

# Perform parameter expansion, command substitution, arithmetic
# expansion, and quote removal on prompt strings -- on by default.
shopt -s promptvars;

# Allow the source builtin to use $PATH -- on by default.
shopt -s sourcepath;

# Make echo builtin expand backslash-escape-sequence.
shopt -s xpg_echo;


#####################################################################
# @section Variables
#
#   Set variables used by bash.
#####################################################################

# Set the $PATH -- favor /usr/local/bin
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# Set TextMate to be the default editor
export EDITOR='mate';

# Ignore files with these suffixes when performing completion.
export FIGNORE='.o:.pyc'

# Ignore files that match these patterns when 
# performing filename expansion.
export GLOBIGNORE='.DS_Store:*.o:*.pyc'

# History file control:
#   - ignorespace = don't save lines that begin with a space
#   - ignoredups  = don't save duplicate lines
export HISTCONTROL='ignorespace:ignoredups'

# Maximum number of lines/commands to save in the history file.
export HISTFILESIZE=5000
export HISTSIZE=5000

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';


#####################################################################
# @section Prompt
#####################################################################

# The number of trailing directory components to retain when adding
# the directory names to the prompt.
export PROMPT_DIRTRIM=4


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