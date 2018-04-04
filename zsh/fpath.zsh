#!/usr/bin/env zsh

# Add each topic folder to fpath so that they can add functions and
# completion scripts.
for topic_folder in "$ZSH"/*
do
	if test -d "$topic_folder"
	then
		fpath=("$topic_folder" $fpath)
	fi
done
