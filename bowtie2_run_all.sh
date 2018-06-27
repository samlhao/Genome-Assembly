#!/usr/bin/env bash
# usage: bowtie2_run_all.sh <full path to reference file> <full path to output folder>
# builds bowtie2 index and runs bowtie2 on all fastq files in the directory
# path_to_contigs=${1?Error: path to reference file not given}
# out_folder=${2?Error: output folder not specified}
for file1 in *fastq
do
index=${file1%%.fastq}
# builds index from spades output
bowtie2-build $file1 $index
out=${file1%%.fastq}_align.sam
out_folder=${file1%%.fastq}_bowtie
# runs bowtie2 with timer, metrics, multi-threaded, reads that failed to align
# bowtie2 -t --met-file $out_folder/${index}_metrics.txt -p 32 --un $out_folder/${index}_failedreads.fasta -x $index -U $file1 -S $out_folder/$out
bowtie2 -p 32 -x $index -U $file1 -S ./$out_folder/$out
done
