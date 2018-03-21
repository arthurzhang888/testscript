#!/bin/sh

clear
echo =============================
echo == check ASMedia device   ===
echo =============================

echo "   "
echo "   "


lspci | grep ASMedia
if [ $? != 0 ];then
	echo fail
else
	echo pass	
	break;
fi


read


usbdisk  /mnt/sda4


