echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' >> /etc/locale.conf
echo 'Enter hostname: '
read my_hostname
echo "$my_hostname" >> /etc/hostname
mkinitcpio -P

# users
passwd
groupadd sudo
echo 'Name the admin user: '
read admin_username
useradd -m -G sudo "$admin_username"
passwd $admin_username
