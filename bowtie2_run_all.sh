# builds bowtie2 index and runs bowtie2 on all fastq files in the directory
for file1 in *fastq
do
infolder=${file1%%.fastq}_output
index=${file1%%.fastq}
# builds index multi-threaded
bowtie2-build --threads 32 /mnt/data/$infolder/contigs.fasta $index
out=${file1%%.fastq}_align.sam
# runs bowtie2 with timer, metrics, multi-threaded, reads that failed to align
bowtie2 -t --met-file /mnt/data/$index_metrics.txt -p 32 --un /mnt/data/$index_failedreads.fasta -x $index -U $file1 -S $out
done
