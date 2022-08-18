#/bin/bash -e

set -x

rm -f *_backup.txt *_res.txt

# Restore baseline by creating empty adjustment tables
for lang in fr gr la sp uk us; do
	../../../../dist/tools/tunecheck_${lang} -e
done

# Recompile baseline
make -C ../../../ clean
make -j -C ../../../ all

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
