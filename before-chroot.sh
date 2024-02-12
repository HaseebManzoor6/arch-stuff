# Make sure to partition your disk first!

#pacstrap -K /mnt base linux linux-firmware base-devel sudo which git man-db man-pages texinfo neovim most bat zsh networkmanager
#genfstab -U /mnt >> /mnt/etc/fstab
#ln -sf /mnt/usr/share/zoneinfo/UTC /mnt/etc/localtime
#cp -r . ../mnt/archinstall
#arch-chroot /mnt
