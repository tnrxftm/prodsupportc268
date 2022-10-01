file='act11file'

readarray -t cont < $file #reads file and stores it all in cont as array
declare -A nd_array
echo ${cont[@]}
#array+=($cont)
#echo "This is the normal array ${array[@]}"

for elem in ${cont[@]}; do
	nd_array[$elem]=0
done
echo "Associative arrays that has keys only ${!nd_array[@]}"
#IFS=$'\n'
#echo "${!nd_array[*]}" | sort -nr
#unset IFS
for key in "${!nd_array[@]}"; do 
	echo $key
done | sort -nr
exit 0
