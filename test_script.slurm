#!/bin/bash
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --mem=8gb
#SBATCH --time=0-96:00:00
#SBATCH -A sybb412
#SBATCH --output=/mnt/pan/courses/sybb412/jrp208/cocaine_project/output_%x.log
#SBATCH --error=/mnt/pan/courses/sybb412/jrp208/cocaine_project/errors_%x.txt
#SBATCH --mail-user=jrp208@case.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name="SYBB412_project_testscript"

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
        echo $sname
done
