#!usr/bin bash
for cand_gene in candidate_genes/*
base=$(basename %cand_gene)
out_folder=${base}_bowtie
mkdir $out_folder
do
  for file in *fastq
  do
  # builds index from spades output
    bowtie2-build $cand_gene $base
    out=${file%%.fastq}_${base%%.fasta}_align.sam
    bowtie2 -p 32 -x $base -U $file -S $out_folder/$out
  done
done
