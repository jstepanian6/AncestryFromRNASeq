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
i=allchr_noXYchr_nonRNAregions_1000g.vcf
o=allchr_noXYchr_nonRNAregions_1000g_onlyWomen.vcf
saf=../samples_1000g_Mujeres.txt

#java -jar /hpcfs/home/ing_sistemas/j.stepanian/software/NGSEPcore_4.2.1.jar VCFFilter -i $i -o $o -saf $saf >& filterVCF_women$1.log
java -jar ~/software/NGSEPcore_4.2.1.jar VCFSummaryStats -i allchr_noXYchr_nonRNAregions_1000g_onlyWomen.vcf.gz -o allchr_noXYchr_nonRNAregions_1000g_onlyWomen_stats.txt

