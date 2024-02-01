#!/usr/bin/bash
 
shopt -s extglob
 #==============1 list tables to user====

echo " --------------alredy existing tables-----------"

ls -s


 #==============2 let user create table with valid name====
while true
do

read -p "Enter Table_Name To create :" tname 

# ---name have spaces will change to _

name=` echo $name | tr ' ' '_' ` 

# ------validation ----
# if name space or empty
case $tname in 
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
if [[ -f $tname ]];then
echo "Sorry this name alredy exist"
continue 
else
 touch $tname
echo "created table with name : " $tname
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

# ======= let user insert data to the table===

while true
do

read -p "Enter Table fields number :" 
fields_num=$REPLY


case $fields_num in 
*[0] )
echo "fields can't be $fields_num"
continue
;;
*[1-9] | *[1-9]*[0-9] )
echo "fields num is $fields_num"
break

;;

esac

done

# ==========insert column name==========
# chang num from str to int
let fields_num=$fields_num
echo " ---------insert your meta data for $tname-----"
for `(i=2,i<=$fields_num,i++)`
do
while true
do
read -p "enter column num $i name "
col_name=$REPLY

# ------validation ----
# if name space or empty
case $col_name in 
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
if ( find $col_name ` head -1 $tname ` );then
echo "Sorry this name alredy exist"
continue 
else
  if [$i -eq 2];then

row_name+="id:"$col_name:
else 
row_name+=$col_name


  fi

break 

fi
 
 ;;
#  start w special char
 *)
echo "not valid don't start with special characters.."
continue
;;

esac
done



done
echo $row_name >> $tname
# =====insert type of data-==========
echo " insert column types"
echo "filed num 1 type is integer"

for `(i=2,i<=$fields_num,i++)`
do

echo ">> type your choice for filed $i"

#  only string or integer

select choice in string int 
do
case $choice in
string )
echo "string"
if [ $i -eq 2 ];then
row_type+=int:string:
else
 row_type+=string:
 fi
 break
 ;;
 int )
echo "int"
if [ $i -eq 2 ];then
row_type+=int:int:
else
 row_type+=int:
 fi
 break
 ;;
* ) echo "only 1 and 2 are avaliable"
continue
;;

esac
done

done

echo $row_type >> $tname

echo "your tale meta data is $row_name $row_type "







