#path for writing the content of output in a file and scheduling that output file to crontab in unix at the requested time.
output='/src/pack/output.sh'

numberOfFilesDisplay(){
	if [ -d $pth ]; then
		echo $'---------------------------------------------\n' >> $output
    		echo "$(find $pth -type f | wc -l)" >> $output
	else
		echo $'\n[ERROR]  Please provide a directory.' >> $output
	    exit 1
	fi
}

numberOfFilesHundredDays(){
	if [ -d $pth ]; then
		echo $'---------------------------------------------\n' >> $output
    		echo "$(find $pth -type f -mtime +100 | wc -l)" >> $output
	else
		echo $'\n[ERROR]  Please provide a directory.' >> $output
	    exit 1
	fi
}

deletingFiles(){
	echo $'Deleted 100 Days old data from '$pth >> $output
	find $pth -type f -mtime +100 -exec rm -rf {} \;
}

removingContentOfOutput(){
	echo -n > $output
}

commandInformation(){
	echo $'\n\nCommand Used to delete the file on "'$pth'"' >> $output
	echo $'---------------------------------------------\n' >> $output
	echo $'find "'$pth'" -type f -mtime +100 -exec rm -rf {} \;' >> $output
}



writingOutput(){
	echo $'Executing file(path/current_filename.sh) on some server\n' >> $output
	echo $'Total Number of Files on path Before deleting\n' >> $output
	numberOfFilesDisplay
	echo $'Total Number of Files on path > 100 days Before deleting\n' >> $output
	numberOfFilesHundredDays
	deletingFiles
	commandInformation
	echo $'\n\nTotal Number of Files on path After deleting\n' >> $output
	numberOfFilesDisplay
	echo $'Total Number of Files on path > 100 days After deleting\n' >> $output
	numberOfFilesHundredDays
}

#Subject and mail included
sendingMail(){
	mail -s "Deleting 100 Days old data" "Mailgroup@host.com"< $output
}

echo "Data on server folder1" >> $output
pth=''	#server path to be deleted.
writingOutput

echo "Data on server folder2" >> $output
pth=''	#server path to be deleted.
writingOutput

#as such as many folders

sendingMail

removingContentOfOutput

