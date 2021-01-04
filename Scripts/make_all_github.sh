#!/bin/bash
cd /Users/timvigers/GitHub/plink-ng/1.9
git pull
make

cd /Users/timvigers/GitHub/plink-ng/2.0/build_dynamic
git pull
make

cd /Users/timvigers/GitHub/htslib
git pull
make

cd /Users/timvigers/GitHub/samtools
git pull
make

cd /Users/timvigers/GitHub/bcftools
git pull
make

cd /Users/timvigers/GitHub/logseq
git pull
