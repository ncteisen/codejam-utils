#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "usage: ./grab [s|l]"
	exit 1
fi

if [ "$1" != "s" ] && [ "$1" != "l" ]; then
	echo "usage: ./grab [s|l]"
	exit 1
fi

# grab last downloaded file
input=$(ls -t ~/Downloads/ | head -n1)

echo $input

if [ "$1" == "s" ]; then
	if [[ "$input" != *"small"* ]]; then
		echo "failed sanity test, no small in name. proceed? (y/n)"
		read resp
		if [ "$resp" != "y" ]; then
			exit 1
		fi
	fi
	mv "/Users/ncteisen/Downloads/$input" "small.in"
fi

if [ "$1" == "l" ]; then
	if [[ "$input" != *"large"* ]]; then
		echo "failed sanity test, no large in name. proceed? (y/n)"
		read resp
		if [ "$resp" != "y" ]; then
			exit 1
		fi
	fi
	mv "/Users/ncteisen/Downloads/$input" "large.in"
fi