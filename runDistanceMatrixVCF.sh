#!/bin/bash
#SBATCH --job-name=DistanceMatrix
#SBATCH -p short
#SBATCH -N 1
#SBATCH -n 1 #Tasks paralelos, recomendado para MPI, Default=1
#SBATCH --cpus-per-task=16 #Cores requeridos por task, recomendado para multi-thread, Default=1
#SBATCH --time=48:00:00
#SBATCH --mem=40G
#SBATCH --mail-user=j.stepanian@uniandes.edu.co
#SBATCH --mail-type=FAIL
#SBATCH -o step7_singleVCF/DistanceMatrix_filtered.log


module load jdk/11.0.14




java -jar /hpcfs/home/ing_sistemas/j.stepanian/software/NGSEPcore_4.2.1.jar VCFDistanceMatrixCalculator -i step7_singleVCF/mergedSamples_filtered.vcf -o step7_singleVCF/mergedSamples_filtered_matrixDistance.txt -s 0 -f 0
