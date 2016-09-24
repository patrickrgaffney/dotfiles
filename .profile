#####
# ~/.profile -- startup file for bash (invoked with sh)
#
#	@author		Pat Gaffney <pat@hypepat.com>
#	@created	2016-09-22
#	@modified	2016-09-22
#
#	This file is loaded when bash is invoked with the name `sh`
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