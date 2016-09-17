#####
# ~/.bash_profile -- startup file for bash (interactive login)
#
#	@author		Pat Gaffney <pat@hypepat.com>
#	@created	2016-09-17
#	@modified	2016-09-17
#
#	This file is loaded immediately after /etc/profile when invoking
#	bash as an interactive login shell (or as a non-interactive
#	login shell with the --login option).
#
#	Mostly, all of the bash settings are actually located in 
#	~/.bashrc -- as it is the *only* file read and executed when
#	bash is invoked as an interactive, non-login shell.
#####################################################################

##
# if .bashrc exists, load it
#####################################################################
if [ -f ~/.bashrc ]; then
	. ~/.bashrc;
fi

