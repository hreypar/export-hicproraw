#!/bin/bash

# variables
directories_prefix="breast-cancer-MCF10"

# create results directory
#
mkdir results

# step 1 is move bed files from data to results
#
find -L data/ \
	-type f \
	-name "*.bed" \
	-exec \
		sh -c 'cp {} results/' \;

# step 2 is figure out the files resolutions
#
resolutions=$(ls results/ | cut -d"_" -f2 | sort -u)

# step 3 is creating the subdirectories using
# the desired prefix
#
for i in $resolutions
	do mkdir results/$directories_prefix-$i
done  

# step 4 is copying the matrix files that
# we didn't copy before because their names
# were a problem to step 2
#
find -L data/
	-type f \
	-name "*.matrix" \
	-not -name "*iced*" \
	-exec \
		sh -c 'cp {} results/' \;

# step 5 is movig the files to the corresponding
# directory according to resolution
#





