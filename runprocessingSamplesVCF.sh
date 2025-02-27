#!/bin/bash

#SBATCH --job-name=processingSamplesVCF
#SBATCH -p medium
#SBATCH -N 1
#SBATCH -n 1 #Tasks paralelos, recomendado para MPI, Default=1
#SBATCH --cpus-per-task=4 #Cores requeridos por task, recomendado para multi-thread, Default=1
#SBATCH --time=48:00:00
#SBATCH --mem=32G
#SBATCH --mail-user=j.stepanian@uniandes.edu.co
#SBATCH --mail-type=FAIL
#SBATCH -o processingSamplesVCF.o%j

#for i in $(cat listachr.txt); do sbatch rungzip.sh $i; done | la lista contiene solo los codigos de los cromosomas (Ej· chr1)


i=*$1*.vcf
gz=/hpcfs/home/ing_sistemas/j.stepanian/remapeo/ancestria/genotipadoMuestras_step3/genotypeCalls_$1.vcf.gz
o1=filtradoMuestras$1.vcf
o2=filtradoMuestras$1_nofilterMAF.vcf
st1=$1_statsVCF.txt
st2=$1_statsVCFnoMAF.vcf

module load jdk

gzip $i 
java -jar /hpcfs/home/ing_sistemas/j.stepanian/software/NGSEPcore_4.2.1.jar VCFFilter -i $gz -o $o1 -m 200 -minMAF 0.01 -q 40
java -jar /hpcfs/home/ing_sistemas/j.stepanian/software/NGSEPcore_4.2.1.jar VCFFilter -i $gz -o $o2 -m 200 -q 40
java -jar /hpcfs/home/ing_sistemas/j.stepanian/software/NGSEPcore_4.2.1.jar VCFSummaryStats -i $o1 -o $st1
java -jar /hpcfs/home/ing_sistemas/j.stepanian/software/NGSEPcore_4.2.1.jar VCFSummaryStats -i $o2 -o $st2



