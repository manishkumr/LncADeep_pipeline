#!/bin/bash
echo "Running Stringtie"
for file in /datasets/*.bam;do
	echo ${file##*/}
	./stringtie/stringtie -p 8 -G  /datasets/annotB36.gtf  -o /outputs/${file##*/}.gtf  ${file}
done
sleep 30s
