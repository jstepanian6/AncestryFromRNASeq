#!/bin/bash

#SBATCH --job-name=PreFilterVCF1000G
#SBATCH -p medium
#SBATCH -N 1
#SBATCH -n 1 #Tasks paralelos, recomendado para MPI, Default=1
#SBATCH --cpus-per-task=1 #Cores requeridos por task, recomendado para multi-thread, Default=1
#SBATCH --time=48:00:00
#SBATCH --mem=16G
#SBATCH --mail-user=j.stepanian@uniandes.edu.co
#SBATCH --mail-type=FAIL
#SBATCH -o VCFPreFilter.o%j


i=/hpcfs/home/ing_sistemas/j.stepanian/remapeo/ancestria/1000genomes_step1/20201028_CCDG_14151_B01_GRM_WGS_2020-08-05_$1.recalibrated_variants.vcf.gz

zcat $i | awk '{if(substr($1,1,1)=="#") print $0; else if (length($4)==1 && length ($5)==1) {printf("%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\tGT",$1,$2,$3,$4,$5,$6,$7,$8);for(i=10;i<=NF;i++)printf("\t%s",substr($i,1,3)); print "" }}' > 1000genomesprefiltered_step1.1/1000g_$1_snps.vcf

