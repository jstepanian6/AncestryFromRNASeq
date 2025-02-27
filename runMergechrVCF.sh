#!/bin/bash
#SBATCH --job-name=MergeSamtoolsRegions
#SBATCH -p short
#SBATCH -N 1
#SBATCH -n 1 #Tasks paralelos, recomendado para MPI, Default=1
#SBATCH --cpus-per-task=16 #Cores requeridos por task, recomendado para multi-thread, Default=1
#SBATCH --time=48:00:00
#SBATCH --mem=40G
#SBATCH --mail-user=j.stepanian@uniandes.edu.co
#SBATCH --mail-type=FAIL
#SBATCH -o mergeSamtools.o%j


#Nunca se ha corrido por job, se corrieron los pasos desde consola
cat singleVCF_step7/header.vcf > singleVCF_step7/mergedSamples.vcf
for i in {1..22}; do (awk '{if(substr($0,1,1)!="#") print $0}' mergeSamplesand1000g_step6/mergedSample1000gchr${i}.vcf); done >> singleVCF_step7/mergedSamples.vcf
awk '{if(substr($0,1,1)!="#") print $0}' mergeSamplesand1000g_step6/mergedSample1000gchrX.vcf >> singleVCF_step7/mergedSamples.vcf

