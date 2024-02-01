#!/usr/bin/bash

cd ../Data

echo "select database to drop .."
PS3="-->"

array=(`ls -F ../Data | grep / | tr / " "`)

select element in ${array[*]}

do
if [ $REPLY -gt ${#array[*]} ];then 
echo "$REPLY not on the menu"
continue 
else 

rm -r ${array[${REPLY}-1]}
echo "Your ${array[${REPLY}-1]} DB deleted successfully..."
break
fi
done

cd -  &> ~/../../dev/null

