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

i=/hpcfs/home/ing_sistemas/j.stepanian/remapeo/ancestria/filtrados_step4/1000g/$1_filtradoPorRegion_1000g.vcf
o=/hpcfs/home/ing_sistemas/j.stepanian/remapeo/ancestria/filtrados_step4/1000g/stats/$1_filtrado_1000g_stats.txt


module load jdk
java -jar /hpcfs/home/ing_sistemas/j.stepanian/software/NGSEPcore_4.2.1.jar VCFSummaryStats -i $i -o $o

