#!/bin/bash


for i in  21-25*/;
do
#echo $i
cp ./fastqc-array.sh $i
folder=${i%/}
echo $folder
sample=${folder%%_*}
echo $sample
file_count=`ls $folder/*fastq.gz|wc -l`;
file_count=$((file_count-1))
#echo $file_count
sed -i "s/0-7/0-$file_count/g" $i/fastqc-array.sh
sed -i "s/-J 21-2490/-J $sample/g" $i/fastqc-array.sh
cd $i
sbatch fastqc-array.sh
cd ../
done



