#!/bin/bash


# Updating config files without inode change

SOURCE=$1
DEST=$2

FILES=$(find $SOURCE -type f -name '*')
for file in $FILES
do
	DIR=$(dirname "$DEST/$file")
	if [ ! -d "$DIR" ] 
	then
		echo "dir $DIR not existed - creating..."
		mkdir -p $DIR
	fi
	
	if [ -f "$DEST/$file" ]
	then
		echo "updating $DEST/$file"
		cat $file > $DEST/$file

	else
		echo "cp $DEST/$file"
		cp -f $file $DEST/$file
	fi
done