# #!/bin/bash
# -- BEFORE RUNNING --
# 1) Partition disks (fdisk -l, gdisk)
# 2) Make filesystems (mkfs.ext4 [partition], mkswap [partition])
# 3) Mount filesystems (mount [partition] /mnt, swapon [partition])

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
