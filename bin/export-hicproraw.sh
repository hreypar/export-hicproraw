#!/bin/bash

# variables
directories_prefix="breast-cancer-MCF10"

# step 1 is move bed files from data to results
#
find -L data/
	-type f \
	-name "*.bed" \
	-exec \
		sh -c 'cp {} results' \

# step 2 is create the final directories
# with the desired prefix
#
find -L results/ \
	-type f \
	-name "*.bed" \
	-exec \
		sh -c 'cut {} -d"_" -f2 | sort	-u'


