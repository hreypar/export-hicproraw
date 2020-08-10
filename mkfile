# DESCRIPTION:
# mk module establish a directory structure compatible
# with hicproraw-to-bedpe.
#
# USAGE:
# Single target execution: `mk <TARGET>` where TARGET is
# any line printed by the script `bin/mk-targets`
#
# Multiple target execution in tandem `bin/mk-targets | xargs mk`
#
# AUTHOR: HRG
#
# step 1 is move bed files from data to results
#
#copy_bed:V:	data/
#	mkdir -p results
#	find -L data/ \
#		-type f \
#		-name "*.bed" \
#		-exec \
#			sh -c 'mv {} results/' \;

