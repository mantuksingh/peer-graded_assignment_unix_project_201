#! /usr/bin/bash
# function to get the no of files in a current directory
pwd_files(){
	no_of_files=`ls -la | grep ^- | wc -l` #only including the hidden files and regular files
}
# Calling the function (pwd_files)
pwd_files
echo "Please guess how many files are in current directory: \c"
# Asking user to guess the number of files in current directory
read num
num_test='^[+-]?[0-9]+$' # Represents a signed natural number
#Checking whether the entered number is natural number or not
if [[ $num =~ $num_test ]];then # if - 1
	# Looping until user get the correct guess
	while [ $no_of_files -ne $num ]
	do
		if [ $(( $no_of_files - $num )) -gt 0 -a $(( $no_of_files - $num )) -lt 5 ]  # if - 2			
		then	
			echo "You are almost there and too close also. Please try again:"
			read num
		elif [ $(( $no_of_files - $num )) -lt 0 -a $(( $no_of_files - $num )) -gt -5 ] # if - 2			
		then
			echo "You are almost there and too close also. Please try again:"
			read num
		elif [ $num -gt $no_of_files ];then # if - 2 			
			echo "Your guess is too high. Please try again:"
			read num
		else # if - 2
			echo "Your guess is too low. Please try again:"
			read num
		fi # if - 2
		
		if ! [[ $num =~ $num_test ]];then
			echo "You entered an invalid number(other than natural number). Exiting from the program"
			exit 1
		fi
	done
	echo "Congratulations!! your guess is correct"
else
	echo "You have entered an invalid number(other than natural number). Exiting from the program"
	exit 1
fi # if - 1


