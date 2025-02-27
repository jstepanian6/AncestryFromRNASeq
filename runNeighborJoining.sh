#!/bin/bash
#SBATCH --job-name=NeighborJoining
#SBATCH -p short
#SBATCH -N 1
#SBATCH -n 1 #Tasks paralelos, recomendado para MPI, Default=1
#SBATCH --cpus-per-task=16 #Cores requeridos por task, recomendado para multi-thread, Default=1
#SBATCH --time=48:00:00
#SBATCH --mem=8G
#SBATCH --mail-user=j.stepanian@uniandes.edu.co
#SBATCH --mail-type=FAIL
#SBATCH -o step7_singleVCF/NeighborJoining_filtered.log


module load jdk/11.0.14
i=step7_singleVCF/mergedSamples_filtered_matrixDistance.txt
o=step7_singleVCF/NJmergedSamples_filtered.newick

java -jar /hpcfs/home/ing_sistemas/j.stepanian/software/NGSEPcore_4.2.1.jar NeighborJoining -i $i -o $o
