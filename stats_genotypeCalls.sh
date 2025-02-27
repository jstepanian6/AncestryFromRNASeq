#!/bin/bash

#SBATCH --job-name=statsVCF
#SBATCH -p short
#SBATCH -N 1
#SBATCH -n 1 #Tasks paralelos, recomendado para MPI, Default=1
#SBATCH --cpus-per-task=1 #Cores requeridos por task, recomendado para multi-thread, Default=1
#SBATCH --time=4:00:00
#SBATCH --mem=10000
#SBATCH --mail-user=j.stepanian@uniandes.edu.co
#SBATCH --mail-type=FAIL
#SBATCH -o statsVCF.o%j

module load jdk

java -jar -Xmx8g ~/software/NGSEPcore_4.2.1.jar VCFSummaryStats -i genotypeCalls_chr${i}.vcf.gz -o statschr$i.txt
