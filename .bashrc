##
# ~/.bashrc -- startup file for bash (interactive non-login)
#
#   author:     Pat Gaffney <pat@hypepat.com>
#   created:    2016-09-17
#   modified:   2017-04-10
#
#   This file is loaded when invoking bash as an interactive shell
#   that is *not* a login shell. Because of this behavior, this
#   file is loaded by ~./bash_profile -- effectively making it the
#   startup file for both login and non-login interactive shells.
#
#####################################################################

##
# Shell Options
#
# If any option has both a single character flag (`-x`) *and* a
# option name (`-o option-name`), the option-name is chosen for
# general readability.
#
# Any options that are turned on by *default* are also listed here
# so that they could be easily turned off in the future if needed.
#####################################################################

# Do not exit an interactive shell upon reading EOF.
set -o ignoreeof;

# Report the status of terminated background jobs immediately, 
# rather than before printing the next primary prompt.
set -o notify;


##
# Shell Behavior
#####################################################################

# Executed a directory name as if it were an argument to cd.
shopt -s autocd

# Correct spelling errors in directory names given to cd.
shopt -s cdspell

# Check the hash table for a command name before searching $PATH.
shopt -s checkhash

# Check the window size (update $LINES and $COLUMNS) 
# after each command.
shopt -s checkwinsize

# Save all lines of a multi-line command in the same history entry.
shopt -s cmdhist

# Correct spelling errors on directory names during word completion
# if the directory name initially supplied does not exist.
shopt -s dirspell

# Enable extended pattern matching features.
shopt -s extglob

# Enable `**` pattern in filename expansion to match all files,
# directories and subdirectories.
shopt -s globstar

# Append the history list to $HISTFILE instead of replacing it.
shopt -s histappend

# Save multi-line commands to the history with embedded newlines
# instead of semicolons -- requries cmdhist to be on.
shopt -s lithist

# Do not attempt completions on an empty line.
shopt -s no_empty_cmd_completion

# Case-insensitive filename matching in filename expansion.
shopt -s nocaseglob

# Make echo builtin expand backslash-escape-sequence.
shopt -s xpg_echo


##
# Environment Variables
#####################################################################

# Set the $PATH -- favor /usr/local/bin
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/opt

# Set TextMate to be the default editor
export EDITOR='subl'

# Ignore files with these suffixes when performing completion.
export FIGNORE='.o:.pyc:.git'

# Ignore files that match these patterns when 
# performing filename expansion.
export GLOBIGNORE='.DS_Store:*.o:*.pyc:.git'

# History file control:
#   - ignorespace = don't save lines that begin with a space
#   - ignoredups  = don't save duplicate lines
export HISTCONTROL='ignorespace:ignoredups'

# Maximum number of lines/commands to save in the history file.
export HISTFILESIZE=150
export HISTSIZE=150

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# Set colors for ls command.
#   1.  directory: ex
#   2.  symbolic link: fx
#   3.  socket: gx
#   4.  pipe: bx
#   5.  executable: cx
#   6.  block special: aH
#   7.  character special: aA
#   8.  executable with setuid bit set: cA
#   9.  executable with setgid bit set: cH
#   10. directory writable to others, with sticky bit: eA
#   11. directory writable to others, without sticky bit: eH
export CLICOLOR=1
export LSCOLOR='exfxgxbxcxaHaAcAcHeAeH'

##
# Python
#####################################################################

# Don't let virtualenv modify the bash prompt -- I will do this.
export VIRTUAL_ENV_DISABLE_PROMPT=1

##
# Go
#####################################################################

export GOPATH="~/Code/go"

##
# Prompt
#####################################################################

function git_dirty {
    local status=$(git status 2> /dev/null)
    local clean='nothing to commit'
    local push='Your branch is ahead'
    local dirty='added to commit'
    local commit='Changes to be committed'
    
    # First check if the repo is dirty.
    if [[ $status =~ ${dirty} ]]; then echo $'\e[1;31m';
        
    # Next check if changes have been staged.
    elif [[ $status =~ ${commit} ]]; then echo $'\e[1;36m';
    
    # Check if its ahead of remote.
    elif [[ $status =~ ${push} ]]; then echo $'\e[1;33m';
    
    # Default to clean.
    else echo $'\e[1;32m';
    fi
}

function git_branch {
    IFS=$'\n'
    local branches=$(git branch --no-color 2> /dev/null)
    local prefix='\* '
    local string=''
    for branch in $branches; do
        if [[ ${branch} == ${prefix}* ]]; then 
            string+=':['
            string+=$(git_dirty)
            string+=${branch##$prefix}
            string+=$'\e[0m'
            string+=']'
            break
        fi
    done
    echo $string
    unset IFS
}

function virtual_env {
    local string=''
    if [[ ${VIRTUAL_ENV:+x} ]]; then 
        string+='('
        string+=$'\e[1;33m'
        string+=$(basename $VIRTUAL_ENV)
        string+=$'\e[0m'
        string+='):'
    fi
    echo $string
}

# Begin appending information to PS1
export PS1=''

# Add cyan command-number: '\#'
PS1+=$'\e[1;36m\#.\e[0m '

# Add bold username: '\u'
PS1+=$'\e[1m\u\e[0m'

# Add bold-blue hostname: '\h'
PS1+=$'\e[1;34m@\h\e[0m in '

# Add yellow virtualenv.
PS1+='$(virtual_env)'

# Add red working directory: '\w'
PS1+=$'\e[1;31m\w\e[0m'

# Add git information
PS1+='$(git_branch) '

# Add magenta time: '\A'
PS1+=$'at \e[1;35m\A\e[0m'

# Add dollar-sign `$`
PS1+=$'\n\e[1;34m$\e[0m '

# The number of trailing directory components to retain when adding
# the directory names to the prompt -- trailing directories are
# marked with an `...` ellipsis.
export PROMPT_DIRTRIM=3

##
# Aliases
#
# Set up simple aliases to enable default options for commands.
# For almost every purpose, shell functions are preferred over
# aliases, so some care has been taken to ensure that the alises
# defined here would *not* work better as functions.
#
#####################################################################

# Clear the screen.
alias k="clear"

# List {a}ll files with {h}uman-{s}ize output long.
#   -A = List all entries except for `.` and `..`.
#   -G = Enable colorized output.
#   -h = Use unit suffixes for file size.
#   -l = List in long format, omit group id.
#   -P = List symbolic link, not its reference.
#   -T = Display time information.
alias ll="ls -AGhlTP"

# Go back (1|2) director(y|ies).
alias ..="cd ../"
alias ...="cd ../../"

# Open current directory in Finder.app.
alias finder="open -a Finder ./"

##
# Private Configurations
#####################################################################

[[ -s ~/.private ]] && source ~/.private
