#!/bin/bash

#Set variables for login and user type
login=$1
user_type=$2

#Check if login already exists
if id "$login" >/dev/null 2>&1; then
echo "Error: login already exists in the system."
exit 1
fi

#Check if user type is valid
if [ "$user_type" != "teacher" ] && [ "$user_type" != "technician" ] && [ "$user_type" != "student" ]; then
echo "Error: invalid user type. Please enter 'teacher', 'technician', or 'student'."
exit 1
fi

#Create user home directory based on user type
if [ "$user_type" == "teacher" ]; then
home_dir="/home/professors/$login"
elif [ "$user_type" == "technician" ]; then
home_dir="/home/tecnicos/$login"
else
home_dir="/home/students/$login"
fi

#Create user and set home directory
useradd -m -d "$home_dir" "$login"

#Set user password to expire
passwd -e "$login"

#Add user to appropriate group
if [ "$user_type" == "teacher" ]; then
usermod -a -G teachers "$login"
elif [ "$user_type" == "technician" ]; then
usermod -a -G technicians "$login"
else
usermod -a -G students "$login"
fi

#Copy rules.txt file to user home directory
cp /home/regras.txt "$home_dir"

#Create welcome letter in user home directory
welcome_letter="$home_dir/welcome_$login.txt"
echo "Hello $login, welcome to COMPANY X." >> "$welcome_letter"
echo "Your title at the institution is: $user_type" >> "$welcome_letter"
echo "Your registration was activated on: $(date '+%B %d, %Y at %r')" >> "$welcome_letter"
echo "Good work!" >> "$welcome_letter"
