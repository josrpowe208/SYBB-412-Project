#!/bin/bash
#SBATCH -N 1
#SBATCH -n 4
#SBATCH --mem=32gb
#SBATCH --time=0-48:00:00
#SBATCH -A sybb412
#SBATCH --output=/mnt/pan/courses/sybb412/jrp208/cocaine_project/trim_output_%x.log
#SBATCH --error=/mnt/pan/courses/sybb412/jrp208/cocaine_project/trim_errors_%x.txt
#SBATCH --mail-user=jrp208@case.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name="SYBB412_project_hisat2_adapter_trimming"

set -e

module load base
module load gcc
module load python/3.6.6

cd /mnt/pan/courses/sybb412/jrp208/cocaine_project/


for file in /mnt/rstor/OOHPC/caseStudies/PRJNA388174_cocaine/*.gz
do
	/home/jrp208/Tools/TrimGalore-0.6.5/trim_galore $file --path_to_cutadapt /home/jrp208/.local/bin/cutadapt
done

rm -rf "$PFSDIR"/*


