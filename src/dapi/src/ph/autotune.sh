#/bin/bash -e

set -x

rm -f *_backup.txt *_res.txt

# Run autotune
set -m
for lang in fr gr la sp uk us; do
	(../../../../dist/tools/tunecheck_${lang} -t ../../../tools/tunecheck/shorttune_${lang}.txt) &
done
while fg; do true; done
pkill -P $$

# Recompile with tuned values
make -C ../../../ clean
make -j -C ../../../ all
