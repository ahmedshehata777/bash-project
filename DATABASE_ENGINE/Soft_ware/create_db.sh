#!/usr/bin/bash
# shopt -s extglop



while true
do

read -p "Enter DB_Name To create :" name 

# ---name have spaces will change to _

name=` echo $name | tr ' ' '_' ` 

# ------validation ----
# if name space or empty
case $name in 
 "" | " ")
 echo "Name can't be empty.."
 continue 
 ;;
 #  if name start numbers
 [0-9]*)
 echo "Name can't start with numbers.."
 continue 
 ;;
#  if enter one char
 [a-zA-Z])
  echo "Name must more than one char"
 continue 
 ;;
#  start with any char or '_'
 *[a-zA-Z0-9_]*[a-zA-Z0-9_] | [a-zA-Z0-9_])
if [[ -d ~/bash_project/DATABASE_ENGINE/Data/$name ]];then
echo "Sorry this name alredy exist"
continue 
else
  mkdir ~/bash_project/DATABASE_ENGINE/Data/$name
echo "created database with name : " $name
fi
 break 
 ;;
#  start w special char
 *)
echo "not valid don't start with special characters.."
continue
;;

esac
done




cd -  &> ~/../../dev/null








