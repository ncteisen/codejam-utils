#!/bin/bash

if [ ! -s "sample.in" ]; then
	echo "please add sample for regression test"
	exit 1
fi

if [ "$#" -ne 0 ]; then
	python main.py < sample.in
	exit 1
fi

python main.py < sample.in > sample.out
diff sample.out sample.good

if [ "$?" -ne 0 ]; then
	echo "failed regression test"
	exit 1
fi

if [ -f "small.in" ]; then
	echo "running small"
	python main.py < small.in > small.out
	cp small.out ../output-dump/$uniquename.small
fi

if [ -f "large.in" ]; then
	echo "running large"
	python main.py < large.in > large.out
	cp large.out ../output-dump/$uniquename.large
fi