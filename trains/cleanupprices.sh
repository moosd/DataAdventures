#!/bin/bash

data=$(cat prices)
pastprice=909090

while read l; do
currprice=$(echo $l|cut -d',' -f2)
[[ "$currprice" == "$pastprice" ]] || {
echo "$l"
pastprice="$currprice"
}
done<<<"$data"
