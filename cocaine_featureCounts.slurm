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
#SBATCH --job-name="SYBB412_project_featureCounts"

set -e

module load base
module load gcc
module load R/3.5.0

cd /mnt/pan/courses/sybb412/jrp208/scripts/

Rscript featureCounts.R

gcc --version
R --version

rm -rf "$PFSDIR"/*
