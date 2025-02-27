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

module load jdk/11.0.14

i=/hpcfs/home/ing_sistemas/j.stepanian/remapeo/ancestria/1000genomesprefiltered_step1.1/1000g_$1_snps.vcf

o=/hpcfs/home/ing_sistemas/j.stepanian/remapeo/ancestria/$1_filtradoPorRegion_1000g.vcf
#el archivo srs es el resultado del merged obtenido con samtools depth, es decir, output runMergeRegions.sh
srs=/hpcfs/home/ing_sistemas/j.stepanian/remapeo/ancestria/step4_filtrados/regiones_muestras/filtradoMuestras$1_nofilterMAF_regions.txt


java -jar /hpcfs/home/ing_sistemas/j.stepanian/software/NGSEPcore_4.2.1.jar VCFFilter -i $i -o $o -srs $srs >& filterVCF$1_1000g_1.log
