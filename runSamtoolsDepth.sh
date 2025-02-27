#!/bin/bash

#SBATCH --job-name=samtoolsDepth
#SBATCH -p medium
#SBATCH -N 1
#SBATCH -n 1 #Tasks paralelos, recomendado para MPI, Default=1
#SBATCH --cpus-per-task=16 #Cores requeridos por task, recomendado para multi-thread, Default=1
#SBATCH --time=48:00:00
#SBATCH --mem=32G
#SBATCH --mail-user=j.stepanian@uniandes.edu.co
#SBATCH --mail-type=FAIL
#SBATCH -o samtoolsDepth.o%j

module load samtools/1.16.1
#Se corre con for i in $(cat listaPE.txt); do sbatch runHisatPEoldmode.sh $i; done
#listaPE.txt contiene solo los ID de las muestras 

p=$1;


 # input files 
f1=/hpcfs/home/ing_sistemas/j.stepanian/remapeo/outHisat/${p}_hisat2_sorted.bam;

samtools depth $f1 -o ${p}_outsamtools.txt

awk '{if($3>5){if(c!=$1 || $2>p+1){ if(s>0)print c "\t" s "\t" p; s=$2 } c=$1;p=$2}}END{print c "\t" s "\t" p;}' ${p}_outsamtools.txt > ${p}_outsamtools_regions.txt
 
#-a --> Saca todas las posiciones

