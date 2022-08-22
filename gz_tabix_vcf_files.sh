#!/bin/bash
for i in {3..20}; do
  echo "gz $i";
  bgzip -c /mnt/e/luchessi/OneTGenomes_30x_GRCh38/1kgp_chr${i}_filt.vcf > 1KGP_high_coverage.chr${i}.filt.vcf.gz;
  echo "tabix $i";
  tabix 1KGP_high_coverage.chr${i}.filt.vcf.gz;
done
