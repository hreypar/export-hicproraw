#!/bin/bash

# variables
directories_prefix="breast-cancer-MCF10"

# create results directory
#
mkdir results

# step 1 is move bed and matrix files 
# from data to results
#
find -L data/ \
	-type f \
	-name "*.bed" \
	-o -name "*.matrix" -not -name "*iced*" \
 	-exec \
		sh -c 'cp {} results/' \;

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
	
	mv results/*$r.matrix $resolution_dir
	#mv results/*$r_abs.bed
done

