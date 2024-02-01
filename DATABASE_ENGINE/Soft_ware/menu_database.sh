#!/usr/bin/bash
PS3=">>"
select choice in "create_db" "list_db" "connect_db" "drop_db" "Exit"
do

case $REPLY in
1) #creat
echo "creating_db.."
 ./create_db.sh
;;
2) #list_db
./list_db.sh
;;
3) #connect_db
./connect_db.sh
;;
4) #drop_db
 ./drop_db.sh
;;
5)
echo "exit..."
break 
;;
esac


done

