for file1 in *fastq
do
out=${file1%%.fastq}_output
spades.py --careful -t 32 --s1 $file1 -o $out
