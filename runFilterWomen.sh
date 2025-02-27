#!/bin/bash

#SBATCH --job-name=FilterVCF1000G
#SBATCH -p medium
#SBATCH -N 1
#SBATCH -n 1 #Tasks paralelos, recomendado para MPI, Default=1
#SBATCH --cpus-per-task=1 #Cores requeridos por task, recomendado para multi-thread, Default=1
#SBATCH --time=48:00:00
#SBATCH --mem=16G
#SBATCH --mail-user=j.stepanian@uniandes.edu.co
#SBATCH --mail-type=FAIL

#SBATCH -o VCFFilter.o%j

#keeps women from 1000genomes 

module load jdk/11.0.14
i=/hpcfs/home/ing_sistemas/j.stepanian/remapeo/ancestria/filtrados_step4/1000g/$1_filtradoPorRegion_1000g.vcf
o=/hpcfs/home/ing_sistemas/j.stepanian/remapeo/ancestria/1000genomes_women_step5/$1_filtradoPorRegion_1000g_women.vcf
saf=/hpcfs/home/ing_sistemas/j.stepanian/remapeo/ancestria/samples_1000g_Mujeres.txt

java -jar -Xmx12g /hpcfs/home/ing_sistemas/j.stepanian/software/NGSEPcore_4.2.1.jar VCFFilter -i $i -o $o -saf $saf >& filterVCF$1_1000g_women.log

