#!/bin/bash

#Update package list from repository
apt update

#Set variables for current date and time
current_date=$(date '+%Y%m%d')
current_time=$(date '+%H:%M:%S')

#Set target directory for report
target_dir="/var/backups/reports/$(date '+%Y')/$(date '+%m')"

#Create target directory if it does not exist
if [ ! -d "$target_dir" ]; then
mkdir -p "$target_dir"
fi

#Set file path for report
report_file="$target_dir/softwares-$current_date.csv"

#Create report file and add headers
echo "Package, Current version, Repository version, Section, Priority, Need to update?" >> "$report_file"

#Loop through all installed packages
for package in $(dpkg --get-selections | grep -v deinstall | awk '{print $1}'); do

#Get package information
current_version=$(apt-cache policy "$package" | grep Installed | awk '{print $2}')
repo_version=$(apt-cache policy "$package" | grep Candidate | awk '{print $2}')
section=$(apt-cache policy "$package" | grep "Section" | awk '{print $2}')
priority=$(apt-cache policy "$package" | grep "Priority" | awk '{print $2}')

#Check if package needs to be updated
if [ "$current_version" != "$repo_version" ]; then
update="Yes"
else
update="No"
fi

#Add package information to report
echo "$package, $current_version, $repo_version, $section, $priority, $update" >> "$report_file"
done

#Zip report file
tar -czvf "$report_file.tar.gz" "$report_file"

#Remove original report file
rm "$report_file"

#Check if current time is within specified range
if [ "$current_time" > "03:45:00" ] && [ "$current_time" < "03:46:00" ]; then

#Copy report to A.B.C.D server
scp "$report_file.tar.gz" root@A.B.C.D:/tmp/backups/
fi