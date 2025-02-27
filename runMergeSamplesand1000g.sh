#!/bin/bash

#SBATCH --job-name=MergeVCF
#SBATCH -p medium
#SBATCH -N 1
#SBATCH -n 1 #Tasks paralelos, recomendado para MPI, Default=1
#SBATCH --cpus-per-task=1 #Cores requeridos por task, recomendado para multi-thread, Default=1
#SBATCH --time=48:00:00
#SBATCH --mem=16G
#SBATCH --mail-user=j.stepanian@uniandes.edu.co
#SBATCH --mail-type=FAIL
#SBATCH -o VCFMerge.o%j

module load jdk/11.0.14

ref=/hpcfs/home/ing_sistemas/j.stepanian/remapeo/ancestria/1000genomes_women_step5/$1_filtradoPorRegion_1000g_women.vcf
samples=/hpcfs/home/ing_sistemas/j.stepanian/remapeo/ancestria/genotipadoMuestras_step3/filtradosm200MAF0.01q40/filtradoMuestras$1.vcf
s=/hpcfs/home/ing_sistemas/j.stepanian/remapeo/reference/hg38_v0_Homo_sapiens_assembly38.fasta.fai
o=/hpcfs/home/ing_sistemas/j.stepanian/remapeo/ancestria/mergeSamplesand1000g_step6/mergedSample1000g$1.vcf


java -jar -Xmx12g /hpcfs/home/ing_sistemas/j.stepanian/software/NGSEPcore_4.2.1.jar VCFMerge -s $s -o $o $ref $samples >& $1merge.log
