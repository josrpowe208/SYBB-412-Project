#!/bin/bash
#SBATCH -N 1
#SBATCH -n 8
#SBATCH --mem=64gb
#SBATCH --time=0-96:00:00
#SBATCH -A sybb412
#SBATCH --output=/mnt/pan/courses/sybb412/jrp208/cocaine_project/output_%x.log
#SBATCH --error=/mnt/pan/courses/sybb412/jrp208/cocaine_project/errors_%x.txt
#SBATCH --mail-user=jrp208@case.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name="SYBB412_project_sort_and_index"

set -e

module load samtools

cd /mnt/pan/courses/sybb412/jrp208/cocaine_project/


for file in /mnt/pan/courses/sybb412/jrp208/cocaine_project/*.bam
do
	samtools sort -o $file.sorted.bam $file
done


for file in /mnt/pan/courses/sybb412/jrp208/cocaine_project/*.sorted.bam
do
	samtools index -b $file
done

samtools --version

rm -rf "$PFSDIR"/*

