#!/bin/bash

echo "Caution: this is going to delete old records"
read -n 1 -s -r -p "Press any key to continue"
echo

rm -rf data
mkdir data

echo "Achieving data"
while :
do
        ps -aux | grep g3t1_1 >> data/g3t1_1.txt
done  
