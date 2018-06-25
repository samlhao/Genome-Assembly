for file1 in *fastq
do
infolder=${file1%%.fastq}_output
index=${file1%%.fastq}
bowtie2-build --threads 32 /mnt/data/$infolder/contigs.fasta $index
out=${file1%%.fastq}_align.sam
bowtie2 -t --met-file /mnt/data/$index_metrics.txt -p 32 --un /mnt/data/$index_failedreads.fasta -x $index -U $file1 -S $out
done
