#! /bin/bash

echo "Please specify year you wish to download"
read year


#### REPLACE URL WITH YOUR ACCOUNT & TOKEN INFORMATION ####

start="https://passivliving.com/lpa/v/1/homes/XXXXX/solar/generation/graph/"
end="/graph.csv?overlay=None&language=en&isLocaltime=true&access_token=XXXXXXXXXXXXXXXXXXXXXXXXX"



#Check and create year directory if needed
if [ -d ./$year ]; then
    echo "Directory $year already exists - Downloading readings"
else
    echo "Creating $year Directory and downloading readings"
    mkdir $year
fi

#Cycle through dates and download the record
for date in $(cat "$year"Dates.csv); do
    echo "Downloading $date"
    address=$start$date$end
    filedate=$(echo "$date" | sed 's/\//-/g')
    Curl -o ./$year/"$filedate".csv $address
    sleep 1
done
