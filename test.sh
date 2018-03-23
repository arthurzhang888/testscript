#!/bin/sh

clear
echo Please input board number:
read boardnum
echo Please input operator name:
read operatorname
echo "<board>"  > $boardnum.log
echo "<id>$boardnum</id>" > $boardnum.log
echo "<date>`date`</date>" >> $boardnum.log
echo "<operator>$operatorname</operator>" >> $boardnum.log

#check HDD ASMedia device exist or not?
echo "<ASMedia>"  >> $boardnum.log
echo wait for check ASMedia device,please enter to continue... 

read answer 


echo "   "
echo "   "
echo "<Msg>`lspci`</Msg>"  >> $boardnum.log
echo "<result>"
lspci | grep Intel
if [ $? != 0 ];then
	echo fail
	echo fail >> $boardnum.log
else
	echo pass	
	echo pass >> $boardnum.log
	break;
fi
echo "</result></ASMedia>" >> $boardnum.log


#check TF card,please input TF card and press enter...
echo "<TFcard>"  >> $boardnum.log

echo insert TF card and continue ,please enter to continue... 

read answer


echo "   "
echo "   "
echo "<Msg>`dmesg|grep mmcblk0 `</Msg>"  >> $boardnum.log
echo "<result>"
dmesg|grep mmcblk0

if [ $? != 0 ];then
	echo fail
	echo fail >> $boardnum.log
else
	echo pass	
	echo pass >> $boardnum.log
	break;
fi
echo "</result></TFcard>" >> $boardnum.log







read answer
echo $answer



ls /dev/ttyUSB* -l 




usbdisk  /mnt/sda4


