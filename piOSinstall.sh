#!/bin/bash
function writePI() {
	diskutil unmountDisk /dev/$CardDisk
	sudo dd bs=1m if=$ImagePath of=/dev/r$CardDisk conv=sync
}

printf "\n\nRaspberry PI Image Installer\nBy:  Matt Barr\n\n"
printf "Enter Disk:  \n"
read CardDisk
printf "Enter Image Path:  \n"
read ImagePath

printf "Image will be written to $CardDisk.\n(Please allow up to 5 min for completion)\nContinue?  [y/n]\n"
read YesNo
echo "Installing..."
if [ "$YesNo" == "y" ]
then
	writePI
elif [ "$YesNo" == "Y" ]
then
	writePI
else 
	exit
fi

echo "Image Installed"
echo "Finalizing..."
sleep 30
touch /Volumes/boot/ssh
echo "Installation Complete."


	

