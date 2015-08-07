#!/bin/bash

i=0

cat route.gpx | sed 's/></\n/g'|grep rtept|while read l; do

i=$((i+1))

if [[ $((i % 20)) -eq 0 ]]; then

lat=$(echo "$l" | cut -d '"' -f2)
lon=$(echo "$l" | cut -d '"' -f4)

wget "http://tools.wmflabs.org/autolist/download_query.php?q=CLAIM%5B31%3A55488%5D%20AND%20CLAIM%5B17%3A145%5D%20AND%20AROUND%5B625%2C$lat%2C$lon%2C5%5D" -O out/$i.tsv

else
echo "nope $i"
fi

done
