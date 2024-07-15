#!/bin/bash
# -- AFTER RUNNING --
# Install a bootloader!

if [[ $EUID > 0 ]]
then
	echo "Please run as root. Exiting."
	exit
fi

echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' >> /etc/locale.conf
echo 'Enter hostname: '
read my_hostname
echo "$my_hostname" >> /etc/hostname
mkinitcpio -P

pacman-key --init
pacman-key --populate archlinux

# users
passwd
groupadd sudo
echo 'Name the admin user: '
read admin_username
useradd -m -G sudo,video "$admin_username"
passwd $admin_username
