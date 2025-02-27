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


module load jdk/11.0.14 

#Ejemplo java -Xmx4g -cp ../software/NGSEPcore_4.2.1.jar uniandes.algorithms.readsanalyzer.ReadsAnalyzerExample Kmers data/SRR13796411_1.fastq 100

java -Xmx35g -cp ../software/NGSEPcore_4.2.1.jar:../software GenomicRegionsMerge reference/hg38_v0_Homo_sapiens_assembly38.fasta.fai outSamtoolsDepth/*regions.txt > mergedSamtools_regions.txt 


