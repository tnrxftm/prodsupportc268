array=(1 2 3 -4 -5 06 007 8) #8 elements
sum=3
ctr=6
echo "Average: $(($sum / ${#array[@]} )).$(($sum % ${#array[@]}))"
printf '%.3f' $(echo "$sum/${#array[@]}" | bc -l)
: '
IFS=$'\n' #setting my IFS to newline
max=`echo "${array[*]}" | sort -n | tail -n 1`
unset IFS
echo $max
temp=1
for val in ${array[@]} 
do
	(( temp=$temp*$val ))
done
echo $temp
'

#sum=`IFS=+; echo "$((${array[*]}))"`
#echo $sum

#echo "Do you want to input more than 5?(y/n)"
#read ans
#ans=`echo $ans | tr '[:upper:]' '[:lower:]'`

#if [ $ans == "n" ]; then
#        echo "no ${array[@]}"
#elif [ $ans == "y" ]; then
#        while [ $ans == "y" ] && [ $ctr -le 10 ]; do
#                echo "Enter integer $ctr :"
#                read num
#                if [[ $num =~ ^(-)?[0-9]+$ ]]; then
#                        array+=($num)
#                        ((ctr++))
#                else
#			echo "You must only input integers"
#                	exit 1
#               fi
#		if (($ctr <= 10)); then
#			echo "Do you want to continue? (y/n)"
#			read ans
#			ans=`echo $ans | tr '[:upper:]' '[:lower:]'`
#		fi
#		if [ $ans == 'n' ]; then
#			echo "This has been your list ${array[@]}"
#		fi
		
 #      done
	
#else
#        echo "Invalid option"
#        exit 1
#fi
#echo ${array[@]}

password_checker () {
	echo "Enter your password"
	read pword
	if [[ ${#pword} -ge 8 ]]; then
		 echo $pword | egrep -q [0-9]
		 if [[ $? -eq 0 ]]; then
			 echo $pword | egrep -q [A-Z]
			 if [[ $? -eq 0 ]]; then
				 echo $pword | egrep -q [a-z]
				  if [[ $? -eq 0 ]]; then
					  echo "Password meets all requirements"
					  return 0
				  fi
			 else
				 echo "Password must contain capital letters"
				 return 1
			 fi
		 else
			 echo "Password must include numbers"
			 return 1
		 fi
	 else
		 echo "Password must be at least 8 characters"
		 return 1
		 fi

}

password_checker

while [[ $? -eq 1 ]]
do
        echo "Do you want to try again?"
        read ans
	ans=$(echo $ans | tr '[:upper:]' '[:lower:]')
        if [ $ans == "y" ]; then
		password_checker
        elif [ $ans == "n" ]; then
		echo "Good bye!"
                exit 0
        else
                echo "Invalid option"
		exit 1
	fi
done
    
exit 0
