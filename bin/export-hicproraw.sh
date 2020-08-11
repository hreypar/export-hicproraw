#!/bin/bash

# variables
#
directories_prefix="breast-cancer-MCF10"

# create results directory
#
mkdir -p results

#########################################################
# step 1 is move bed and matrix files from data to results
#
find -L data/ \
	\( -type f \
	-name "*.bed" \
	-or -name "*.matrix" \
	-and -not -name "*iced*" \) \
#	-exec mv -t results/ {} +
 	-exec cp -t results/ {} +

# step 2 is figure out the files resolutions
#
resolutions=$(ls results/ | grep bed | cut -d"_" -f2 | sort -u)

# step 3 is creating the subdirectories using the desired prefix
# and moving the bed a and matrix files to them
#
for r in $resolutions
do
	resolution_dir="results/$directories_prefix-$r"
	mkdir -p $resolution_dir
	
	mv -t $resolution_dir results/*_${r}.matrix
	mv -t $resolution_dir results/*_${r}_abs.bed
done

