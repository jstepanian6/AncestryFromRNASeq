#!/bin/bash
#SBATCH --job-name=admixture
#SBATCH -p medium
#SBATCH -N 1
#SBATCH -n 1 #Tasks paralelos, recomendado para MPI, Default=1
#SBATCH --cpus-per-task=16 #Cores requeridos por task, recomendado para multi-thread, Default=1
#SBATCH --time=48:00:00
#SBATCH --mem=40G
#SBATCH --mail-user=j.stepanian@uniandes.edu.co
#SBATCH --mail-type=FAIL
#SBATCH -o /hpcfs/home/ing_sistemas/j.stepanian/remapeo/ancestria/step8_admixture_NJ/admixture/logs/admixture.log

#Los primeros pasos se corrieron por sesión interactiva, se deben ajustar todos los paths 
vcf=/hpcfs/home/ing_sistemas/j.stepanian/remapeo/ancestria/step7.1_singleVCF+missingSamples/mergedSamples_withMissingSamples_filtered_minMAF0.01_m1850_saf10000SNPs+_regionrsrs.vcf
prefix=mergedSamples_withMissingSamples_filtered_minMAF0.01_m1850_saf10000SNPs+_regionrsrs
outdir=/hpcfs/home/ing_sistemas/j.stepanian/remapeo/ancestria/step8.1_admixture_NJ_withmissingsamples/
ped=/hpcfs/home/ing_sistemas/j.stepanian/remapeo/ancestria/step8.1_admixture_NJ_withmissingsamples/$prefix.ped

module load vcftools/0.1.16
module load plink/1.90b6.21

#ulimit -n 10000
#vcftools --vcf $vcf --plink --out ${oudir}$prefix
#if this fails (Error: Could not open temp file.) fix it with:  ulimit -n 10000

#plink --noweb --file ${oudir}$prefix --recode12 --out ${oudir}$prefix

#correr con muchos K
for k in {1..10}; do /hpcfs/home/ing_sistemas/j.stepanian/software/admixture_linux-1.3.0/admixture --cv=20 $ped $k >& ${prefix}_k${k}_cv20.log; done
