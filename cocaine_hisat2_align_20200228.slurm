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
#SBATCH --job-name="SYBB412_project_hisat2_alignment"

set -e

module load base
module load gcc
module load hisat2
module load samtools

cd /mnt/pan/courses/sybb412/jrp208/


for file in /mnt/pan/courses/sybb412/jrp208/cocaine_project/*.gz
do
	fbname=$(basename $file .fq.gz)
	sname="${fbname:0:10}"
	if test -f cocaine_project/${sname}.hisat.bam; then
		echo "${sname}.hisat.bam already exists. Continuing to next sample."
	else
		hisat2 -x genomes/hg19.index --known-splicesite-infile genomes/hg19_ens_splice_sites.txt -p 8 -1 cocaine_project/${sname}_1_trimmed.fq.gz -2 cocaine_project/${sname}_2_trimmed.fq.gz | samtools view -b > cocaine_project/${sname}.hisat.bam
	fi
done

gcc --version
hisat2 --version
samtools --version

rm -rf "$PFSDIR"/*
