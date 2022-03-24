#!/bin/bash

sampling_rate=0

if [[ "$#" -gt 1 ]]; then
    echo "Too many arguments were passed!"
    exit 1
fi

if [[ "$#" -eq 0 ]]; then
    sampling_rate=10
else
    sampling_rate=$1
fi

if [[ -n ${sampling_rate//[0-9]/} ]]; then
    echo "The sampling rate is not an integer!"
    exit 1
fi

echo "Caution: this is going to delete old records"
read -n 1 -s -r -p "Press any key to continue"
echo

raw_path=data/raw

rm -rf data
mkdir data
mkdir data/raw

echo "Achieving data"
while :
do
        ps -aux | grep reli_engine >> $raw_path/reli_engine.txt
	ps -aux | grep g3t1_1 >> $raw_path/g3t1_1.txt
	ps -aux | grep g3t1_1 >> $raw_path/g3t1_1.txt
	ps -aux | grep g3t1_1 >> $raw_path/g3t1_1.txt
	ps -aux | grep g3t1_1 >> $raw_path/g3t1_1.txt
	ps -aux | grep g3t1_1 >> $raw_path/g3t1_1.txt
	ps -aux | grep g3t1_1 >> $raw_path/g3t1_1.txt
	ps -aux | grep g4t1 >> $raw_path/g4t1.txt
	ps -aux | grep param_adapter >> $raw_path/param_adapter.txt
	ps -aux | grep enactor >> $raw_path/enactor.txt
	ps -aux | grep injector >> $raw_path/injector.txt
	ps -aux | grep logger >> $raw_path/logger.txt
	ps -aux | grep patient >> $raw_path/patient.txt
	ps -aux | grep collector >> $raw_path/collector.txt
	ps -aux | grep data_access >> $raw_path/data_access.txt
	ps -aux | grep rosout >> $raw_path/rosout.txt
	ps -aux | grep master >> $raw_path/master.txt
	sleep $sampling_rate
done  
