printf '== You are running '
([[ -f '/sys/firmware/efi/fw_platform_size' ]] && echo 'UEFI%s' `cat /sys/firmware/efi/fw_platform_size`) || echo 'BIOS'
