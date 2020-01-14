#!/bin/bash

TARGET=replaySetup

# Dubugging variable
# 	0 = Debugging disabled
#	1 = Debugging enabled

DEBUG=0

# :: Set static paths

BASE_PTH=$(pwd)
DISK_PTH=$BASE_PTH/adf/$TARGET.adf
BASE_DIR=base
FILE_PTH=$BASE_PTH/$BASE_DIR
TOOL_PTH=$BASE_PTH/bin/amitools/xdftool
DIR_LIST=$(find $BASE_DIR -type f | cut -d'/' -f2-)
DIR_NAME=$(find $BASE_DIR -type d | cut -d'/' -f2-)

# :: Create Amiga Disk File image

if [ -f $DISK_PTH ]; then
	rm -rf $DISK_PTH
fi

echo "Creating Amiga Disk File image (.adf)"

$TOOL_PTH $DISK_PTH format $TARGET ffs

# :: Create folder in the Amiga Disk File image

echo "Creating folders..."

for eachFolder in $DIR_NAME ; do
	if [ $eachFolder != $BASE_DIR ]; then
		$TOOL_PTH $DISK_PTH makedir $eachFolder

		if [ $DEBUG -eq 1 ]; then
			echo $TOOL_PTH $DISK_PTH makedir $eachFolder
		fi
	fi
done;	

cd $BASE_DIR

# :: Copy all files to the Amiga Disk File Image

echo "Copying file structure..."

for eachFile in $DIR_LIST ; do
	$TOOL_PTH $DISK_PTH write $eachFile $eachFile
	if [ $DEBUG -eq 1 ]; then
		echo $TOOL_PTH $DISK_PTH write $eachFile $eachFile
	fi
done;

# :: All done, do some cleanup!

cd $BASE_PTH

if [ $DEBUG -eq 1 ]; then
	$TOOL_PTH $DISK_PTH list
fi

echo "Done!"

