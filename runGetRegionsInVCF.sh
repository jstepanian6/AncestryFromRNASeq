#!/bin/bash

#SBATCH --job-name=GetRegionsInVCF
#SBATCH -p medium
#SBATCH -N 1
#SBATCH -n 1 #Tasks paralelos, recomendado para MPI, Default=1
#SBATCH --cpus-per-task=16 #Cores requeridos por task, recomendado para multi-thread, Default=1
#SBATCH --time=48:00:00
#SBATCH --mem=6G
#SBATCH --mail-user=j.stepanian@uniandes.edu.co
#SBATCH --mail-type=FAIL
#SBATCH -o runGetRegionsInVCF.o%j

#for i in $(cat listachr.txt); do sbatch runprocessingSamplesVCF.sh $i; done
#Genera el out del step 4

i=/hpcfs/home/ing_sistemas/j.stepanian/remapeo/ancestria/genotipadoMuestras_step3/filtradosm200q40NoMAF/filtradoMuestras$1_nofilterMAF.vcf
o=/hpcfs/home/ing_sistemas/j.stepanian/remapeo/ancestria/filtrados_step4/filtradoMuestras$1_nofilterMAF_regions.txt
 
awk '{if(length($4)==1 && length($5)==1) print $1 "\t" $2 "\t" $2}' $i > $o 
