# finds fastq file with R1 in name
for file1 in *R1*fastq
do
# assigns a R2 file with the same base name as file1 to file2
file2=${file1/R1/R2}
# names output folder with the same base name as file1 without fastq
out=${file1%%.fastq}_output
# runs spades
spades.py --careful -t 32 -1 $file1 -2 $file2 -o $out
done
