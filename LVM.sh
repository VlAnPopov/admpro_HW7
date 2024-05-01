#!/bin/bash
# yum -y update

# Переименовываем группу
vgrename VolGroup00 OtusRoot
# Правим имя группы в конфигах )
sed -i 's/VolGroup00/OtusRoot/g' /etc/fstab
sed -i 's/VolGroup00/OtusRoot/g' /etc/default/grub
sed -i 's/VolGroup00/OtusRoot/g' /boot/grub2/grub.cfg
mkinitrd -f -v /boot/initramfs-$(uname -r).img $(uname -r)