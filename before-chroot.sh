# #!/bin/bash
# Make sure to partition your disk first!

if [[ $EUID > 0 ]]
then
	echo "Please run as root. Exiting."
	exit
fi

pacstrap -K /mnt $(cat base_packages.txt | tr '\n' ' ')
genfstab -U /mnt >> /mnt/etc/fstab
ln -sf /mnt/usr/share/zoneinfo/UTC /mnt/etc/localtime
cp -r . /mnt/archinstall
arch-chroot /mnt
systemctl enable NetworkManager
