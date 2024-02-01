#!/usr/bin/bash

PS3="Type DB Number to connect :"

cd ../Data

echo "select database num to connect.."


array=(`ls -F ../Data | grep / | tr / " "`)

select element in ${array[*]}

do
if [ $REPLY -gt ${#array[*]} ];then 
echo "$REPLY not on the menu"
continue 
else 

cd ../Data/${array[${REPLY}-1]}
echo $(pwd)
echo "You are connected ${array[${REPLY}-1]} DB ..."
break
fi
done

PS3="Enter action number -->"

select choice in "create_table" "list_tables " "drop_table" "insert_into_table" "select_from_table " "delete_from_table" "update_table" "Exit"
do


case $REPLY in
1) #creat table
. ../../Soft_ware/create_table.sh

;;


2) #llist_tables
 echo "list_tables.."
;;

3) #drop table
 echo "drop_table.."
;;

4) #insert_into_table
  echo "insert_into_table.."
;;

5) #select_from_table
echo "select_from_table.."

;;

6) #delete_from_table
echo "delete_from_table.."
;;

7) #update_table
echo "update_table.."
;;
8) #Exit
echo "exit..."
break 
;;

*) 
echo "Not from choice.."

;;
esac


done


cd -  &> ~/../../dev/null







