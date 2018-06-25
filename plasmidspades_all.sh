for file1 in *R1*fq
do
file2=${file1/R1/R2}
out=${file1%%_RR1.fq}_output
spades.py --careful --plasmid -t 32 -1 $file1 -2 $file2 -o $out
done
