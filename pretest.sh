#!/bin/sh

clear
echo Please input board number:
read boardnum
echo Please input operator name:
read operatorname
echo "<board>"  > $boardnum.pre.log
echo "<id>$boardnum</id>" >> $boardnum.pre.log
echo "<date>`date`</date>" >> $boardnum.pre.log
echo "<operator>$operatorname</operator>" >> $boardnum.pre.log

#check HDD ASMedia device exist or not?
echo "<ASMedia>"  >> $boardnum.pre.log
echo wait for check ASMedia device,please enter to continue... 

read answer 


echo "   "
echo "   "
echo "<Msg>`lspci`</Msg>"  >> $boardnum.pre.log
echo "<result>"  >> $boardnum.pre.log
lspci | grep ASMedia
if [ $? != 0 ];then
	echo fail
	echo fail >> $boardnum.pre.log
else
	echo pass	
	echo pass >> $boardnum.pre.log
	break;
fi
echo "</result></ASMedia>" >> $boardnum.pre.log


#check TF card,please input TF card and press enter...
echo "<TFcard>"  >> $boardnum.pre.log

echo insert TF card and continue ,please enter to continue... 

read answer


echo "   "
echo "   "
echo "<Msg>`dmesg|grep mmcblk0 `</Msg>"  >> $boardnum.pre.log
echo "<result>"  >> $boardnum.pre.log
dmesg|grep mmcblk0
if [ $? != 0 ];then
	echo fail
	echo fail >> $boardnum.pre.log
else
	echo pass	
	echo pass >> $boardnum.pre.log
	break;
fi
echo "</result></TFcard>" >> $boardnum.pre.log



#check sata hdd
echo "<SATAP1>"  >> $boardnum.pre.log

echo checking sata device ,please enter to continue... 

read answer


echo "   "
echo "   "
echo "<Msg>`mount|grep /dev/sd `</Msg>"  >> $boardnum.pre.log
echo "<result>"  >> $boardnum.pre.log
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#should be change according to real devices
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
mount|grep /dev/sdb
if [ $? != 0 ];then
	echo fail
	echo fail >> $boardnum.pre.log
else
	echo pass	
	echo pass >> $boardnum.pre.log
	break;
fi
echo "</result></SATAP1>" >> $boardnum.pre.log





#check PCIE wifi
echo "<WIFI>"  >> $boardnum.pre.log

echo checking wifi pcie devices,please enter to continue... 

read answer


echo "   "
echo "   "
echo "<Msg>`lspci `</Msg>"  >> $boardnum.pre.log
echo "<result>"  >> $boardnum.pre.log
lspci
echo "Do you find 2 pcie wifi devices"
read answer_wifi
if [ $answer_wifi != y ];then
	echo fail
	echo fail >> $boardnum.pre.log
else
	echo pass	
	echo pass >> $boardnum.pre.log
	break;
fi
echo "</result></WIFI>" >> $boardnum.pre.log

echo "</board>" >> $boardnum.pre.log



