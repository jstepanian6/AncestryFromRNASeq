#!/bin/bash

#SBATCH --job-name=StatsVCF1000G
#SBATCH -p medium
#SBATCH -N 1
#SBATCH -n 1 #Tasks paralelos, recomendado para MPI, Default=1
#SBATCH --cpus-per-task=1 #Cores requeridos por task, recomendado para multi-thread, Default=1
#SBATCH --time=48:00:00
#SBATCH --mem=16G
#SBATCH --mail-user=j.stepanian@uniandes.edu.co
#SBATCH --mail-type=FAIL
#SBATCH -o VCFStats.o%j

i=/hpcfs/home/ing_sistemas/j.stepanian/remapeo/ancestria/mergeSamplesand1000g_step6/mergedSample1000g$1.vcf
o=/hpcfs/home/ing_sistemas/j.stepanian/remapeo/ancestria/mergeSamplesand1000g_step6/stats/$1_stats_mergedVCF.txt

module load jdk
java -jar /hpcfs/home/ing_sistemas/j.stepanian/software/NGSEPcore_4.2.1.jar VCFSummaryStats -i $i -o $o

