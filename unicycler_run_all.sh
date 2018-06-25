for file1 in *fastq
do
out=${file1%%.fastq}_unicycler_out
unicycler -s $file1 -t 32 -o $out
done
