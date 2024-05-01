# Создаем каталог для нового модуля в initrd
mkdir /usr/lib/dracut/modules.d/01test
cp /vagrant/module-setup.sh /vagrant/test.sh /usr/lib/dracut/modules.d/01test
# Пересоздаём initramfs
mkinitrd -f -v /boot/initramfs-$(uname -r).img $(uname -r)
sed -i 's/rhgb quiet//g' /etc/default/grub
sed -i 's/rhgb quiet//g' /etc/grub.d/10_linux
grub2-mkconfig