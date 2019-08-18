#!/usr/bin/env bash

#####
# defaults.sh -- overwrite some macos defaults
#
#   author:     Pat Gaffney <pat@hypepat.com>
#
#   Overwrite some of the macOS defaults.
#
#####################################################################

# Move the location for screenshots to ~/Downloads.
defaults write com.apple.screencapture location "/Users/$USER/Downloads"

# Restart UI server.
killall SystemUIServer