#!/bin/bash

#SBATCH --job-name=NGSEP
#SBATCH -p medium
#SBATCH -N 1
#SBATCH -n 1 #Tasks paralelos, recomendado para MPI, Default=1
#SBATCH --cpus-per-task=4 #Cores requeridos por task, recomendado para multi-thread, Default=1
#SBATCH --time=120:00:00
#SBATCH --mem=24G
#SBATCH --mail-user=j.stepanian@uniandes.edu.co
#SBATCH --mail-type=FAIL
#SBATCH -o NGSEP_MSVD.o%j

module load jdk/11.0.14 

c=$1;
varsFile=/hpcfs/home/ing_sistemas/j.stepanian/remapeo/ancestria/step2_1000genomes_filtered/20201028_CCDG_14151_B01_GRM_WGS_2020-08-05_${c}.recalibrated_variants.annotated_filtrado.vcf
REFERENCE=/hpcfs/home/ing_sistemas/j.stepanian/remapeo/reference/hg38_v0_Homo_sapiens_assembly38.fasta;
#bams=/hpcfs/home/ing_sistemas/j.stepanian/remapeo/outHisat/*bam
bams=/hpcfs/home/ing_sistemas/j.stepanian/remapeo/*bam
java -Xmx20g -jar /hpcfs/home/ing_sistemas/j.stepanian/software/NGSEPcore_4.2.1.jar MultisampleVariantsDetector -r $REFERENCE -o genotypeCalls_${c}.vcf -querySeq ${c} -knownVariants ${varsFile} -minQuality 40 ${bams} >& genotypeCalls_${c}_detector.log

