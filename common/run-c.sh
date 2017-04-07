#!/bin/bash

if [ ! -s "sample.in" ]; then
	echo "please add sample for regression test"
	exit 1
fi

make

if [ "$#" -ne 0 ]; then
	./main < sample.in
	exit 1
fi

uniquename=`cat name`

./main < sample.in > sample.out
diff sample.out sample.good

if [ "$?" -ne 0 ]; then
	echo "failed regression test"
	exit 1
fi

if [ -f "small.in" ]; then
	echo "running small"
	./main < small.in > small.out
	cp small.out ../output-dump/$uniquename.small
fi

if [ -f "large.in" ]; then
	echo "running large"
	./main < large.in > large.out
	cp small.out ../output-dump/$uniquename.large
fi