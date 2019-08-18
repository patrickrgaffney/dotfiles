##
# ~/.bash_profile -- startup file for bash (interactive login)
#
#	author:		Pat Gaffney <pat@hypepat.com>
#
#	This file is loaded immediately after /etc/profile when invoking
#	bash as an interactive login shell (or as a non-interactive
#	login shell with the --login option).
#
#	Mostly, all of the bash settings are actually located in 
#	~/.bashrc -- as it is the *only* file read and executed when
#	bash is invoked as an interactive, non-login shell.
#
#####################################################################

##
# if .bashrc exists and has contents, load it
#####################################################################
[[ -s ~/.bashrc ]] && source ~/.bashrc
