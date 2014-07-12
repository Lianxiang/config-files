Install Arch Linux
==================

* https://wiki.archlinux.org/index.php/Beginners%27_Guide

* 因为已经分区，并且一些分区上已经有东西，故而跳过分区。
  - mkfs.ext4 /dev/sda1
  - mount /dev/sda1 /mnt
* 联网并安装
  - wifi-menu wlp3s0
  - nano /etc/pacman.d/mirrorlist
  - pacman -Syy
  - pacstrap /mnt base
  - genfstab -U -p /mnt >> /mnt/etc/fstab
* chroot到新系统
  - arch-chroot /mnt /bin/bash
* 本地化设置
  - nano /etc/locale.gen
  - locale-gen
* 时间相关设置
  - ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
  - hwclock --systohc --utc
* hostname相关设置
  - echo z > /etc/hostname
  - nano /etc/hosts
* 无线网络，不需要自动连接
  - pacman -S iw wpa_supplicant
  - pacman -S dialog
* 密码
  - passwd
* 安装grub，os-prober那个我以为我没有其他系统就不需要的，结果系统无法启动
  - pacman -S grub
  - grub-install --target=i386-pc --recheck /dev/sda
  - pacman -S os-prober
  - grub-mkconfig -o /boot/grub/grub.cfg
* 收工
  - exit
  - reboot
* 重启，画屏
