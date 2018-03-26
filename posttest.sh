#!/bin/sh

clear
echo Please input board number:
read boardnum
echo Please input operator name:
read operatorname
echo "<board>"  > $boardnum.post.log
echo "<id>$boardnum</id>" >> $boardnum.post.log
echo "<date>`date`</date>" >> $boardnum.post.log
echo "<operator>$operatorname</operator>" >> $boardnum.post.log

#check HDD ASMedia device exist or not?
echo "<3G>"  >> $boardnum.post.log
echo wait for 3G devices,please enter to continue... 

read answer 


echo "   "
echo "   "
echo "<Msg>`ls /dev/ttyUSB* -l  `</Msg>"  >> $boardnum.post.log
echo "<result>"  >> $boardnum.post.log
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#should be change according to real devices
#crw-r--r--    1 root     root      188,   0 May 26 10:43 /dev/ttyUSB0           
#crw-r--r--    1 root     root      188,   1 May 26 10:41 /dev/ttyUSB1           
#crw-r--r--    1 root     root      188,   2 May 26 10:41 /dev/ttyUSB2           
#crw-r--r--    1 root     root      188,   3 May 26 10:41 /dev/ttyUSB3           
#crw-r--r--    1 root     root      188,   4 May 26 10:41 /dev/ttyUSB4           
#crw-r--r--    1 root     root      188,   5 May 26 10:41 /dev/ttyUSB5 
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
ls /dev/ttyUSB1 -l  
if [ $? != 0 ];then
	echo fail
	echo fail >> $boardnum.post.log
else
	echo pass	
	echo pass >> $boardnum.post.log
	break;
fi
echo "</result></3G>" >> $boardnum.post.log





#check sata hdd
echo "<SATAP2>"  >> $boardnum.post.log

echo checking sata device ,please enter to continue... 

read answer


echo "   "
echo "   "
echo "<Msg>`mount|grep /dev/sd `</Msg>"  >> $boardnum.post.log
echo "<result>"  >> $boardnum.post.log
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#should be change according to real devices
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
mount|grep /dev/sdb
if [ $? != 0 ];then
	echo fail
	echo fail >> $boardnum.post.log
else
	echo pass	
	echo pass >> $boardnum.post.log
	break;
fi
echo "</result></SATAP2>" >> $boardnum.post.log








