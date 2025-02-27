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

i=/hpcfs/home/ing_sistemas/j.stepanian/remapeo/ancestria/step7_singleVCF/mergedSamples.vcf
o=/hpcfs/home/ing_sistemas/j.stepanian/remapeo/ancestria/step7_singleVCF/mergedSamples_filtered_minMAF0.01_m1850_saf10000SNPs+.vcf
saf=/hpcfs/home/ing_sistemas/j.stepanian/remapeo/ancestria/step7_singleVCF/samples10000SNPs+.txt

java -jar /hpcfs/home/ing_sistemas/j.stepanian/software/NGSEPcore_4.2.1.jar VCFFilter -i $i -o $o -m 1850 -minMAF 0.01 -saf $saf >& filterVCFmergedSamples_10000+.log
