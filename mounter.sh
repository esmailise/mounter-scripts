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
	read -p "Enter NAME for device like [Local Disk]:" name

	if [ -b /dev/$device  ];then

		if [ -d "/run/media/user/$name" ];then
			echo "file exist !"

		else
			sudo mkdir -p /run/media/user/$name
			sudo mount /dev/$device /run/media/user/$name -o noatime,noexec

			clear

			/usr/bin/lsblk

		fi

	else
		echo "this device not exist!"
	fi

elif [ $job == 2 ];then

	echo "=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
	/usr/bin/lsblk
	echo "=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"

	read -p "Pls enter name of device like [sda1]: " device

	if [ -b /dev/$device ];then

		if  mount | grep /dev/$device > /dev/null ;then

			sudo umount /dev/$device
			sudo rm -r /run/media/user

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
