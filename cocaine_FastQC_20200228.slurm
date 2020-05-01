#!/bin/bash
#SBATCH -N 1 
#SBATCH -n 4
#SBATCH --mem=32gb 
#SBATCH --time=0-24:00:00 
#SBATCH -A sybb412
#SBATCH --output=/mnt/pan/courses/sybb412/jrp208/FastQC_results/output_%x.log
#SBATCH --error=/mnt/pan/courses/sybb412/jrp208/FastQC_results/errors_%x.txt
#SBATCH --mail-user=jrp208@case.edu 
#SBATCH --mail-type=ALL 
#SBATCH --job-name="SYBB412_project_FastQC" 

set -e

module load java


for file in /mnt/rstor/OOHPC/caseStudies/PRJNA388174_cocaine/*.gz
do
	/mnt/pan/courses/sybb412/tools/FastQC/fastqc $file -o /mnt/pan/courses/sybb412/jrp208/FastQC_results/
done

java -version

rm -rf "$PFSDIR"/*


