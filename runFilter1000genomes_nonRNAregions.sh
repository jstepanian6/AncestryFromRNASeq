#!/bin/bash

#SBATCH --job-name=VCFFilter_nonRNAregions
#SBATCH -p medium
#SBATCH -N 1
#SBATCH -n 1 #Tasks paralelos, recomendado para MPI, Default=1
#SBATCH --cpus-per-task=16 #Cores requeridos por task, recomendado para multi-thread, Default=1
#SBATCH --time=48:00:00
#SBATCH --mem=32G
#SBATCH --mail-user=j.stepanian@uniandes.edu.co
#SBATCH --mail-type=FAIL

#SBATCH -o VCFFilter.o%j


module load jdk/11.0.14
i=/hpcfs/home/ing_sistemas/j.stepanian/remapeo/ancestria/step1.1_1000genomesprefiltered/1000g_${1}_snps.vcf
o=/hpcfs/home/ing_sistemas/j.stepanian/remapeo/ancestria/step9_filtering_nonRNAregions_1000genomes/${1}_nonRNAregions.vcf
stats=/hpcfs/home/ing_sistemas/j.stepanian/remapeo/ancestria/step9_filtering_nonRNAregions_1000genomes/stats/${1}_vcf_stats.txt


java -jar /hpcfs/home/ing_sistemas/j.stepanian/software/NGSEPcore_4.2.1.jar VCFFilter -i $i -o $o -frs /hpcfs/home/ing_sistemas/j.stepanian/remapeo/ancestria/mergedSamtools_regions.txt >& /hpcfs/home/ing_sistemas/j.stepanian/remapeo/ancestria/step9_filtering_nonRNAregions_1000genomes/logs/filterVCF$1.log

java -jar /hpcfs/home/ing_sistemas/j.stepanian/software/NGSEPcore_4.2.1.jar VCFSummaryStats -i $o -o $stats
