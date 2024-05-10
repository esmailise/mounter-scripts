#!/bin/bash

echo "=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
/usr/bin/lsblk
echo "=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"

echo "1 : mount device"

echo "2 : unmount device"

echo "3 : exit"

read -p "Enter number : " job

if [ $job == 1 ];then
	
	clear

	echo "=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
	/usr/bin/lsblk
	echo "=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"

	read -p "Enter DEVICE name like [sda1]: " device

	if [ -b /dev/$device  ];then

		if  mount | grep /dev/$device > /dev/null;then
			echo "this device is mounte !"

		else
			udisksctl mount -b /dev/$device  -o noatime,noexec

			clear

			/usr/bin/lsblk

		fi

	else
		echo "this device not exist!"
	fi

elif [ $job == 2 ];then
	
	clear

	echo "=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
	/usr/bin/lsblk
	echo "=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"

	read -p "Pls enter name of device like [sda1]: " device

	if [ -b /dev/$device ];then

		if  mount | grep /dev/$device > /dev/null ;then

			udisksctl unmount -b /dev/$device

			clear

			/usr/bin/lsblk
		else
			echo "This device not mounted!"
		fi
	else
		echo "This device not exist!"
	fi

elif [ $job == 3 ];then

	echo "GoodBye!"
else 
	echo "Pls enter not wrong number"

fi
