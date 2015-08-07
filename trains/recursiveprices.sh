#!/bin/bash

data=$(cat out/*|grep -v "Error" |grep -v "Item"|sort|uniq|sed 's/\t/,/g'| cut -d',' -f2|sed 's/railway station//g')

while read l; do
./getprices.sh "$l" "Manchester"
done<<<"$data"
