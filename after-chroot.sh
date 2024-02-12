echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' >> /etc/locale.conf
echo "`read -p 'Enter hostname: '`" >> /etc/hostname
mkinitcpio -P
passwd
