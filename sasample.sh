#!/bin/bash

: '

Author: Fatima Tenorio
Desc: Access the file that has numeric values
sorts it in reverse and remove duplicates

'
file='act11file' #store the file name as a variable for easy access
readarray -t cont < $file #read the contents from the file
echo "Contents of file ${cont[@]}"
declare -A nd_array #using associative array and storing values as keys
for val in ${cont[@]}; do
        nd_array[$val]=0 
done
echo "Sorted and removed duplicates"
for key in "${!nd_array[@]}"; do 
	echo $key
done | sort -nr  #go through every key and sort them in reverse
exit 0

