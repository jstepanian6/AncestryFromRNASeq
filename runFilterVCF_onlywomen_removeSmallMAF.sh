#!/bin/bash

#SBATCH --job-name=VCFFilter
#SBATCH -p medium
#SBATCH -N 1
#SBATCH -n 1 #Tasks paralelos, recomendado para MPI, Default=1
#SBATCH --cpus-per-task=1 #Cores requeridos por task, recomendado para multi-thread, Default=1
#SBATCH --time=48:00:00
#SBATCH --mem=32G
#SBATCH --mail-user=j.stepanian@uniandes.edu.co
#SBATCH --mail-type=FAIL
#SBATCH -o VCFFilter.o%j


module load jdk/11.0.14
i=allchr_noXYchr_nonRNAregions_1000g_10000randSNPs_women.vcf
o=allchr_noXYchr_nonRNAregions_1000g_10000randSNPs_women_minMAF0_01.vcf


java -jar ~/software/NGSEPcore_4.2.1.jar VCFFilter -i $i -o $o -minMAF 0.01 >& filterVCF_women_removeSmallMAF.log

java -jar ~/software/NGSEPcore_4.2.1.jar VCFSummaryStats -i $o -o allchr_noXYchr_nonRNAregions_1000g_10000randSNPs_women_stats.txt

