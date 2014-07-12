Install Arch Linux
==================

* https://wiki.archlinux.org/index.php/Beginners%27_Guide

* 安装iso太老了，keyring总失败，重新制作启动u盘
  - https://www.archlinux.org/download/
  - 到以上链接中找到163，去下载iso
  - https://wiki.archlinux.org/index.php/USB_Installation_Media
  - 参照以上链接，制作启动u盘
  - dd bs=4M if=/home/zlx/iso/archlinux-2014.07.03-dual.iso of=/dev/sdb && sync

* 因为已经分区，并且一些分区上已经有东西，故而跳过分区
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
  - https://wiki.archlinux.org/index.php/Beginners%27_Guide
  - If you are using an Intel video chipset and the screen goes blank during the boot process, the problem is likely an issue with Kernel mode setting. A possible workaround may be achieved by rebooting and pressing e over the entry that you are trying to boot (i686 or x86_64). At the end of the string type nomodeset and press Enter. Alternatively, try video=SVIDEO-1:d which, if it works, will not disable kernel mode setting. You can also try i915.modeset=0. See the Intel article for more information. 
  - https://wiki.archlinux.org/index.php/Intel_Graphics
