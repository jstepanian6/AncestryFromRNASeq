#!/bin/bash

#SBATCH --job-name=VCFFilter
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

p=1000genomes/$1
i=1000genomes/$1.vcf
o=$1_filtrado.vcf


java -jar /hpcfs/home/ing_sistemas/j.stepanian/software/NGSEPcore_4.2.1.jar VCFFilter -i $i -o $o -srs mergedSamtools_regions.txt >& filterVCF$1.log
