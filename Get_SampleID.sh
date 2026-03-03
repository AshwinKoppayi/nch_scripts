#!/bin/bash


for i in `ls *R1*`;do
echo $i
SampleID=$(echo "$i" |cut -d"_" -f1);
if grep -q "$SampleID" "sample_map.map"; then                                                                                   echo "Skipping $SampleID because it is present in sample_map.map"                                                       continue  # Skip to the next iteration of the loop
else
echo $SampleID >> sample_map.map
fi
lane=`ls ${SampleID}*R1*|wc -l`;
echo $lane

done
