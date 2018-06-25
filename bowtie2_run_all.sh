# builds bowtie2 index and runs bowtie2 on all fastq files in the directory
for file1 in *fastq
do
infolder=${file1%%.fastq}_output
index=${file1%%.fastq}
# builds index
bowtie2-build /mnt/data/spades_out/$infolder/contigs.fasta $index
out=${file1%%.fastq}_align.sam
# runs bowtie2 with timer, metrics, multi-threaded, reads that failed to align
bowtie2 -t --met-file /mnt/data/${index}_metrics.txt -p 32 --un /mnt/data/${index}_failedreads.fasta -x $index -U $file1 -S $out
done
