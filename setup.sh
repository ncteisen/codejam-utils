#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo "usage: ./setup [c|p] <uniquename>"
	exit 1
fi

if [ "$1" != "p" ] && [ "$1" != "c" ]; then
	echo "usage: ./setup [c|p] <uniquename>"
	exit 1
fi

uniquename="$2"

mkdir $uniquename

touch $uniquename/name
echo $uniquename > $uniquename/name

if [ "$?" -ne 0 ]; then
	echo "uniquename not unique"
	exit 1
fi

if [ "$1" == "c" ]; then
	cp "common/template.cpp" "$uniquename/main.cpp"
	cp "common/Makefile" "$uniquename/Makefile"
	cp "common/run-c.sh" "$uniquename/run.sh"
fi

if [ "$1" == "p" ]; then
	cp "common/template.py" "$uniquename/main.py"
	cp "common/run-p.sh" "$uniquename/run.sh"
fi

touch "$uniquename/sample.in"
touch "$uniquename/sample.good"
cp "common/grab.sh" "$uniquename/grab.sh"