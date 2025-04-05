#!/bin/bash

#med figlet intro och allt

#1. läs in VCF file name automatiskt genom att letaefter den i rådatamappen
#2. convert VCF files in ./Data/Raw_data to pgen, psam och pvar files
#3. zst compress (zstd file_name) 
#4. discard uncompressed files
#med if-sats om SNP eller tandem repeats
	#* Iaa. .vcf containing <u>only SNPs</u>:
	#> * `$ ./plink2 --snps-only 'just-acgt' --vcf input_file_name.vcf --make-pgen --out output_file_name`

	#* Iab. .vcf containing <u>tandem repeats</u>:
	#> * `$ ./plink2 --vcf-half-call m --make-pgen 'pvar-cols=vcfheader,qual,filter,info' --vcf input_file_name.vcf --make-pgen --out output_file_name.pgen`
